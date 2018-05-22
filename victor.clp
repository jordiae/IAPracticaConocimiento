;;; Victor parte de Clips. No tocar! Solo copiar
;;;





;;; Preliminary Modules, by subproblem detection:

(defmodule MAIN (export ?ALL))
;;; Module for user information recopilation and characterisation. 1st module after main
(defmodule characterisation
	(import MAIN ?ALL)
	(export ?ALL)
)
;;; Module for city/stay punctuation from Characterisation
(defmodule processing
	(import MAIN ?ALL)
	(import characterisation ?ALL)
	(export ?ALL)
)
;;; Module for solution construction
(defmodule construction
	(import MAIN ?ALL)
	(import characterisation ?ALL)
	(import processing ?ALL)
	(export ?ALL)
)
;;; Module for printing solution
(defmodule printmod
	(import MAIN ?ALL)
	(import construction ?ALL)
	(import characterisation ?ALL)
	(export ?ALL)
)
;; TODO: ERASE THIS!




;;; Useful functions for characterisation:
(deffunction MAIN::general-question (?question)
    (format t "%s " ?question)
	(bind ?answer (read))
	(while (not (lexemep ?answer)) do ;;; checks if input is string or symbol, else reject
		(format t "%s " ?question)
		(bind ?answer (read))
    )
	?answer
)
(deffunction MAIN::multioption (?question $?allowed-values)
   (format t "%s "?question)
   (progn$ (?curr-value $?allowed-values)
		(format t "(%s)" ?curr-value)
	)
   (printout t ": ")
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer))) ;;; put to lowercase, no need to check since it will be done next:
   (while (not (member$ ?answer ?allowed-values)) do
      (format t "%s "?question)
	  (progn$ (?curr-value $?allowed-values)
		(format t "[%s]" ?curr-value)
	  )
	  (printout t ": ")
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer
)
(deffunction MAIN::yes-no-question (?question)
   (bind ?response (multioption ?question si no))
   (if (eq ?response si)
       then TRUE 
       else FALSE)
)


(deffunction MAIN::num-question (?question ?min ?max)
	(format t "%s [entre %d y %d] " ?question ?min ?max)
	(bind ?answer (read))
	(while (not (and (>= ?answer ?min) (<= ?answer ?max)) ) do
		(format t "%s [entre %d y %d] " ?question ?min ?max)
		(bind ?answer (read))
	)
	?answer
)

;;; Questions with index seem unnecesary


;;; Rules for main and characterisation
(defrule MAIN::system-banner "First rule of program"
	(declare (salience 10))
	=>
    (printout t crlf crlf)
	(printout t "Travel Recommendation System")
    (printout t crlf crlf)
	(printout t "Por favor, responda a las siguientes preguntas:" crlf)
	(focus characterisation)
)

(defrule characterisation::budget "Asks for travel budget"
	(not (budget ?))
	=>
	(assert (budget (num-question "¿Cual es el presupuesto para el viaje? " 300 10000))) ;; TODO: change random values
)
(defrule characterisation::days "Asks for days of travel"
	(not (mindays ?))
	(not (maxdays ?))
	=>
	(bind ?min (num-question "¿Cual es el requisito de minimo de dias del viaje?" 0 30))
	(bind ?max (num-question "¿Cual es el requisito de maximo de dias del viaje? (-1 indica no hay máximo)" -1 30)) ;; TODO:Check this, could be troublesome
	(while (and (> ?min ?max) (not (eq ?max -1))) do
		(printout t "El maximo debe ser mayor que el minimo o -1" crlf)
		(bind ?min (num-question "¿Cual es el requisito de minimo de dias del viaje?" 0 30))
		(bind ?max (num-question "¿Cual es el requisito de maximo de dias del viaje? (-1 indica no hay máximo)" -1 30)) ;; TODO:Check this, could be troublesome
	)
	(assert (mindays ?min))
	(assert (maxdays ?max))
)
(defrule characterisation::numberofcities "Asks for number of cities to visit"
	(not (minnumcities ?))
	(not (maxnumcities ?))
	=>
	(bind ?min (num-question "¿Cual es el numero minimo de ciudades a visitar?" 0 10))
	(bind ?max (num-question "¿Cual es el numero maximo de ciudades a visitar?" 0 10))
	(while (> ?min ?max) do
		(printout t "El maximo debe ser mayor que el minimo o -1" crlf)
		(bind ?min (num-question "¿Cual es el numero minimo de ciudades a visitar?" 0 10))
		(bind ?max (num-question "¿Cual es el numero maximo de ciudades a visitar?" 0 10))
	)
	(assert (minnumcities ?min))
	(assert (maxnumcities ?max))
)
(defrule characterisation::numberofdaysincities "Asks for restriction of number of days in cities"
	(not (mindaysincities ?))
	(not (maxdaysincities ?))
	=>
	(bind ?min (num-question "¿Cual es el numero minimo de dias a pasar en una ciudad?" 0 10))
	(bind ?max (num-question "¿Cual es el numero maximo de dias a pasar en una ciudad?" 0 10))
	(while (> ?min ?max) do
		(printout t "El maximo debe ser mayor que el minimo o -1" crlf)
		(bind ?min (num-question "¿Cual es el numero minimo de ciudades a visitar?" 0 10))
		(bind ?max (num-question "¿Cual es el numero maximo de ciudades a visitar?" 0 10))
	)
	(assert (mindaysincities ?min))
	(assert (maxdaysincities ?max))
)
(defrule characterisation::minHotelQuality "Asks for the quality of the hotel"
	(not (minhotelquality ?))
	=>
	(assert (minhotelquality (num-question "¿Cual es el numero minimo de estrellas de los hoteles en que alojarse?" 1 5)))
)
(defrule characterisation::visitRare "Checks if user wants to visit rare sights"
	(not (visitrare ?))
	=>
	(assert (visitrare (yes-no-question "¿Quiere visitar lugares menos conocidos?")))
)
(defrule characterisation::sacrificeTimeForBudget "Checks whether the user wants to sacrifice time/quality for the sake of budget"
	(not (sacrificetimeforbudget ?))
	(mindays ?)
	(budget ?)
	=>
	(assert (sacrificetimeforbudget (yes-no-question "¿Esta dispuesto a pasar menos o mas dias de los especificados con tal de adecuarse al presupuesto?")))
) ;; sacrificeforbudget should work like this: if it is true, we can 'ignore' the restrictions on days or quality of hotel, depending on the type of sacrifice
;; Ignoring should mean punishing those solutions but not discard them
(defrule characterisation::sacrificeQualityForBudgetAuto ""
	(declare (salience 10))
	(not (sacrificequalityforbudget ?))
	(minhotelquality 1)
	=>
	(assert (sacrificequalityforbudget FALSE))
)
(defrule characterisation::sacrificeQualityForBudget "Checks whether the user wants to sacrifice time/quality for the sake of budget"
	(not (sacrificequalityforbudget ?))
	(budget ?)
	(minhotelquality ?)
	=>
	(assert (sacrificequalityforbudget (yes-no-question "¿Esta dispuesto a pasar noches en un hotel de menos calidad a la preferida?")))
) ;; sacrificeforbudget should work like this: if it is true, we can 'ignore' the restrictions on days or quality of hotel, depending on the type of sacrifice
;; Ignoring should mean punishing those solutions but not discard them


;; Restrictions set above, now further characterisation

(defrule characterisation::age "Ask for user's age"
	(not (age ?))
	=>
	(assert (age (num-question "¿Que edad tiene?" 1 110)))
)

;(defrule characterisation::culturalLevel "Ask for cultural level"
;	(not (culture ?))
;	=>
;	(assert (culture (num-question "¿?")))
;) I'd rather avoid this question. 

(defrule characterisation::kids "Ask if kids are coming"
	(not (kids ?))
	=>
	(assert (kids (yes-no-question "¿Viajaran con niños?")))
)
(defrule characterisation::NumTravelers "Ask number of travelers"
	(not (travelers ?))
	=>
	(assert (travelers (num-question "¿Numero de viajeros?" 1 10)))
)

(defrule characterisation::Event "Asks if the travel is of a certain event"
	(declare (salience 3))
	(not (event ?))
	=>
	(assert (event (multioption "El viaje se debe a algun tipo de evento concreto?" bodas fin-de-curso amigos imserso aniversario-de-niño escapada ruta-natural estudiantes-Upc melomania deportista otro)))
)
(defrule characterisation::eventBodas "Si son bodas, viaje romantico"
	(declare (salience 10))
	(event bodas)
	=>
	(assert (objective romantico))
)
(defrule characterisation::eventFDC "Si son fin-de-curso, viaje cultural"
	(declare (salience 10))
	(event fin-de-curso)
	=>
	(assert (objective cultural))
)
(defrule characterisation::eventAmigos "Si son amigos, aventura"
	(declare (salience 10))
	(event amigos)
	=>
	(assert (objective aventura))
)
(defrule characterisation::eventImserso "Si son imserso, viaje historico"
	(declare (salience 10))
	(event imserso)
	=>
	(assert (objective historico))
)
(defrule characterisation::eventADN "Si son aniversario-de-niño, viaje infantil"
	(declare (salience 10))
	(event aniversario-de-niño)
	=>
	(assert (objective infantil))
)
(defrule characterisation::eventEscapada "Si son escapada, viaje relax"
	(declare (salience 10))
	(event escapada)
	=>
	(assert (objective relax))
)
(defrule characterisation::eventRuta "Si son ruta-natural, viaje naturaleza"
	(declare (salience 10))
	(event ruta-natural)
	=>
	(assert (objective naturaleza))
)
(defrule characterisation::eventUPC "Si son estudiantes-Upc, viaje tecnologico"
	(declare (salience 10))
	(event estudiantes-Upc)
	=>
	(assert (objective tecnologico))
)
(defrule characterisation::eventMelomania "Si son melomania, viaje musical"
	(declare (salience 10))
	(event melomania)
	=>
	(assert (objective musical))
)
(defrule characterisation::eventDeportista "Si son deportista, viaje deportivo"
	(declare (salience 10))
	(event deportista)
	=>
	(assert (objective deportivo))
)
(defrule characterisation::relaxImpliesNotManySights "Ask number of travelers"
	(objective relax)
	=>
	(assert (monumentsPerDay 1))
)

(defrule characterisation::NumSightsPerDay "Ask number of sights a day"
	(declare (salience -4))
	(not (monumentsPerDay ?))
	=>
	(assert (monumentsPerDay (num-question "¿Maximo de monumentos a visitar por dia?" 1 10)))
)

(defrule characterisation::Objective "Ask for the objective of the travel"
	(not (objective ?))
	=>
	(bind $?objectives (find-all-instances ((?o Interest)) TRUE))
	(bind $?name-kinds (create$ ))
	(loop-for-count (?i 1 (length$ $?objectives)) do
		(bind ?curr-obj (nth$ ?i ?objectives))
		(bind ?curr-name (send ?curr-obj get-Kind))
		(bind $?name-kinds(insert$ $?name-kinds (+ (length$ $?name-kinds) 1) ?curr-name))
	)
	(assert (objective (multioption "¿Cual es el interes principal del viaje?" ?name-kinds)))
)

(deftemplate characterisation::prefertransport 
	(slot trans (type SYMBOL))
)

(deftemplate characterisation::avoidtransport 
	(slot trans (type SYMBOL))
)

(defrule characterisation::transportpreferences "Asks for all transport preferences"
	(not (transportPreferencesSet))
	=>
	(bind $?listatransportes (find-all-instances ((?o Transport)) TRUE))
	(bind $?transportTypes (create$ ))
	(loop-for-count (?i 1 (length$ $?listatransportes)) do
		(bind ?curr-obj (nth$ ?i ?listatransportes))
		(bind ?curr-name (send ?curr-obj get-TransportName))
		(bind $?transportTypes(insert$ $?transportTypes (+ (length$ $?transportTypes) 1) ?curr-name))
	)
	(if (yes-no-question "¿Tiene alguna preferencia sobre transportes a evitar?")
		then 
		(bind ?done FALSE)
		(while (not ?done) do
			(bind ?avoid (multioption "Inserte transporte a evitar:" ?transportTypes))
			(assert (avoidtransport (trans ?avoid)))
			(bind ?done (not (yes-no-question "¿Alguno mas?")))
		)
	)
	(if (yes-no-question "¿Tiene alguna preferencia sobre transportes a tomar?")
		then 
		(bind ?done FALSE)
		(while (not ?done) do
			(bind ?prefered (multioption "Inserte transporte preferido:" ?transportTypes))
			(assert (prefertransport (trans ?prefered)))
			(bind ?done (not (yes-no-question "¿Alguno mas?")))
		)
	)
	(assert (transportPreferencesSet))
)

; TODO: tipo ciudad

(defrule characterisation::toProcessing "Switches focus to processing after nothing else to do"
	(declare(salience -20))
	=>
	(printout t "Processing..." crlf)
	(focus processing)
)










(defrule processing::toConstruction "Switches to construction"
	(declare (salience -20))
	=>
	(printout t "Building travel 1..." crlf)
	(focus construction)
)


(deffunction MAIN::maximum-score ($?lista)
	(bind ?maximum -1)
	(bind ?element nil)
	(progn$ (?curr-element $?lista)
		(bind ?curr-sc (send ?curr-element get-Score))
		(if (> ?curr-sc ?maximum)
			then 
			(bind ?maximum ?curr-sc)
			(bind ?element ?curr-element)
		)
	)
	?element
)
(deftemplate construction::visited 
	(slot city (type INSTANCE))
)
(defrule construction::Start "Initializes the solution with minimum requirements"
	(not (travelRecomendation ?))
	(not (BadTravel))
	(minnumcities ?mc)
	(mindaysincities ?dc)
	(maxdaysincities ?maxdc)
	(mindays ?mtd)
	(monumentsPerDay ?mpd)
	=>
	(bind ?good TRUE)
	(bind $?Unorderedlist (find-all-instances ((?inst City)) (> ?inst:Score 0))) ;; do-for-all-facts might prove useful to discard already 'visited' cities
	(bind $?VisitFilter (create$ ))
	(do-for-all-facts ((?f visited)) TRUE 
		;(printout t ?f)
		(bind $?Unorderedlist (delete-member$ $?Unorderedlist ?f:city))
	)
    (progn$ (?curr-city $?Unorderedlist)
        (bind $?cityHotels (send ?curr-city get-HasHotel))
        (bind ?somePositiveHotel FALSE)
        (progn$ (?curr-hotel $?cityHotels)
            (if
                (> (send ?curr-hotel get-Score) 0)
            then
                (bind ?somePositiveHotel TRUE)
            )
        )
        (if
            (eq ?somePositiveHotel FALSE)
        then
            (bind $?Unorderedlist (delete-member$ $?Unorderedlist ?curr-city))
        )
    )
	(bind $?result (create$ ))
	(while (and (not (eq (length$ $?Unorderedlist) 0)) (< (length$ $?result) ?mc))  do ;; pairing it with comment below, should get more cities!
		(bind ?curr-rec (maximum-score $?Unorderedlist))
		(bind $?Unorderedlist (delete-member$ $?Unorderedlist ?curr-rec))
		(bind $?result (insert$ $?result (+ (length$ $?result) 1) ?curr-rec))
	)
	(if (< (length$ $?result) ?mc)
	then
		(printout t "Impossible travel: Not enough good cities" crlf)
		(bind ?good FALSE)
	else
		(bind $?stays (create$ ))
		(loop-for-count (?i 1 (length$ $?result)) do
			(bind ?curr-obj (nth$ ?i ?result))
			(assert (visited (city ?curr-obj))) ;This city might not be truly visited, only proven that it has no good hotel. Works the same anyway
			(bind $?hotelList (send ?curr-obj get-HasHotel))

			; Now we get the cheapest hotel with positive score.
			(bind ?minPrice 10000) ; Consider this number +infinity, there's no hotel that pricey
			(bind ?finalHotel nil)
			(loop-for-count (?i 1 (length$ $?hotelList)) do ; find cheapest hotel with positive score? (avoid <stars), give it to instance
				(bind ?curr-jbo (nth$ ?i ?hotelList))
				(bind ?curr-sc (send ?curr-jbo get-Score))
				(bind ?curr-pr (send ?curr-jbo get-CostByNight))
				(if (and (< ?curr-pr ?minPrice) (>= ?curr-sc 0)) ; assuming score <0 if stars < minstars
					then
					(bind ?finalHotel ?curr-jbo)
					(bind ?minPrice ?curr-pr)
				)
				;(printout t crlf)
			)
			(if (eq ?finalHotel nil)
			then
				(printout t "Impossible travel: Could not find a Hotel in ")
				(format t "%s " (send ?curr-obj get-CityName))
				(bind ?good FALSE)
			else
				(bind $?stays (insert$ $?stays (+ (length$ $?stays) 1)  
					(make-instance (gensym) of Stay (Days ?dc) (StayCity ?curr-obj) (StayHotel ?finalHotel))  
				));push new instance!
			)
		)
		; Here we should add a couple days to first city to get enough mindays, put in the next one if we exceed maxdaysincities
		; for now no sights ?
		(bind ?leftmindays (- ?mtd (* ?mc ?dc)))
		(bind ?i 1)
		(bind ?maximumAddition (- ?maxdc ?dc))
		(while (and (<= ?i (length$ $?stays)) (> ?leftmindays 0)) do
			(bind ?curr-obj (nth$ ?i ?stays))
			(if (< ?leftmindays ?maximumAddition)
			then
				(send ?curr-obj put-Days ?leftmindays)
				(bind ?leftmindays 0)
			else
				(send ?curr-obj put-Days ?maxdc)
				;(bind ?curr-obj:)
				(bind ?leftmindays (- ?leftmindays ?maximumAddition))
			)
			(bind ?i (+ ?i 1))
		)
		(if (> ?leftmindays 0) ; TODO: check for > maxdays too!
		then
			(printout t "Impossible travel: Day restrictions make it impossible" crlf)
			(bind ?good FALSE)
		)


		; Here we will add the sights to the travel. We will add as many sights as possible.
		(bind ?i 1)
		(while (<= ?i (length$ $?stays))
			(bind ?curr-stay (nth$ ?i ?stays))
			(bind ?curr-days (send ?curr-stay get-Days) )
			(bind ?totalSights (* ?mpd ?curr-days) )
			(bind ?curr-city (send ?curr-stay get-StayCity) )
			(bind ?sightList (send ?curr-city get-HasSights) )
			(bind $?result (create$ ))
			(while (and 
				(not (eq (length$ $?sightList) 0)) 
				(not (eq ?totalSights 0))) do 

				(bind ?curr-rec (maximum-score $?sightList))
				(bind ?totalSights (- ?totalSights 1))
				(bind $?sightList (delete-member$ $?sightList ?curr-rec))
				(bind $?result (insert$ $?result (+ (length$ $?result) 1) ?curr-rec))
			)
			(send ?curr-stay put-StaySights ?result)
			(bind ?i (+ ?i 1))
		)


		; TODO: check budget!
		(if ?good
		then
			(assert (travelRecomendation (make-instance (gensym) of Travel (Stays ?stays))))
			;(printout t "Test3")
		else
			(assert (BadTravel))
		)
	)
)

(defclass transportScoring
	(is-a USER)
	(role concrete)
	(slot Transport
		(type INSTANCE)
		(create-accessor read-write))
	(slot Score
		(type INTEGER)
		(create-accessor read-write))
)

(deffunction construction::recTransport (?city1 ?city2) ;;; given two cities returns the list of transports and their scores
    
    (bind $?scoredTransports (create$ ))
    (bind $?allTransports (find-all-instances ((?inst Transport)) TRUE))
    
    (progn$ (?curr $?allTransports)
        (bind $?scoredTransports 
            (insert$ $?scoredTransports (+ (length$ $?scoredTransports) 1) 
                (make-instance (gensym) of transportScoring (Transport ?curr) (Score 0))
            )
        )
    )
    
    (do-for-all-facts ((?f prefertransport)) TRUE 
		;(printout t ?f crlf ?trans crlf "-----------")
        (bind ?trans ?f:trans)
        (progn$ (?curr $?scoredTransports)
            (if
                (eq ?trans (send (send ?curr get-Transport) get-TransportName) )
            then
                (send ?curr put-Score 10)
            )
        )
		;(bind $?Unorderedlist (delete-member$ $?Unorderedlist ?f:city))
	)
    
    (do-for-all-facts ((?f avoidtransport)) TRUE 
		;(printout t ?f crlf ?trans crlf "-----------")
        (bind ?trans ?f:trans)
        (progn$ (?curr $?scoredTransports)
            (if
                (eq ?trans (send (send ?curr get-Transport) get-TransportName) )
            then
                (send ?curr put-Score -10)
            )
        )
		;(bind $?Unorderedlist (delete-member$ $?Unorderedlist ?f:city))
	)
    
    (bind ?xdist (- (send ?city2 get-XCoord) (send ?city1 get-XCoord) ))
    (bind ?ydist (- (send ?city2 get-YCoord) (send ?city1 get-YCoord) ))
    (bind ?dist (sqrt (+ (* ?xdist ?xdist) (* ?ydist ?ydist) )))
    
    (progn$ (?curr $?scoredTransports)
        (bind ?tr-type (send (send ?curr get-Transport) get-Distance))
        (if
            (eq ?tr-type corta)
        then
            (if
                (<= ?dist 20)
            then
                (send ?curr put-Score (+ (send ?curr get-Score) 10))
            else
                (send ?curr put-Score (+ (send ?curr get-Score) (- 10 (/ (- ?dist 20) 4))))
            )
        )
        (if
            (eq ?tr-type media)
        then
            (if
                (and (<= ?dist 50) (> ?dist 20))
            then
                (send ?curr put-Score (+ (send ?curr get-Score) 10))
            else
                (if 
                    (<= ?dist 20)
                then
                    (send ?curr put-Score (+ (send ?curr get-Score) (- 10 (/ (- 20 ?dist) 4))))
                else
                    (send ?curr put-Score (+ (send ?curr get-Score) (- 10 (/ (- ?dist 50) 4))))
                )
            )
        )
        (if
            (eq ?tr-type larga)
        then
            (if
                (> ?dist 50)
            then
                (send ?curr put-Score (+ (send ?curr get-Score) 10))
            else
                (send ?curr put-Score (+ (send ?curr get-Score) (- 10 (/ (- 50 ?dist) 2))))
            )
        )
    )
    
    ;(bind $?scoredTransports (insert$ $?scoredTransports 1 $?allTransports))
    
    ;(do-for-all-facts ((?f (prefertransport ?trans))) TRUE 
	;	(printout t ?f crlf ?trans crlf "-----------")
    ;    (progn$ )
	;	(bind $?Unorderedlist (delete-member$ $?Unorderedlist ?f:city))
	;)
    
    (return $?scoredTransports)
    
)

(deffunction construction::travelCost (?travel ?travelers)
	(bind $?stays (send ?travel get-Stays))
	(bind ?total 0)
	(progn$ (?stay ?stays)
		(bind ?hotelCost (* (send (send ?stay get-StayHotel) get-CostByNight) (* (send ?stay get-Days) ?travelers)))
		(bind ?total (+ ?total ?hotelCost))
	)
	(return ?total)
)

(defrule construction::ProposeAndApply "Improves the travel if possible"
	(travelRecomendation ?travel)
	(budget ?budget)
	(travelers ?t)
	(not (ImprovementFinished))
	(mindaysincities ?mindc)
	(maxdaysincities ?maxdc)
	(maxdays ?maxd)
	(monumentsPerDay ?mpd)
	(maxnumcities ?mc)
	=>
	(bind ?notEnd TRUE)

	(while ?notEnd do
	(bind ?leftOverMoney (- ?budget (travelCost ?travel ?t)))

	(bind ?maxScoreImprovement 0)
	(bind ?bestOption nil)

	; IMPROVING A HOTEL (IMPROVEMENT = DAYS* (NEWHOTEL - PREVHOTEL)*travelers)
	(bind ?i 1)
	(progn$ (?stay (send ?travel get-Stays))
		(bind ?prevHotel (send ?stay get-StayHotel))
		(bind ?days (send ?stay get-Days))
		(bind ?psc (send ?prevHotel get-Score))
		(bind ?hotelList (send (send ?stay get-StayCity) get-HasHotel))
		(bind ?newHotel (maximum-score ?hotelList))
		(bind ?improvement (* ?days (- (send ?newHotel get-Score) (send ?prevHotel get-Score) )))
		(bind ?extraCost (* (* ?days (- (send ?newHotel get-CostByNight) (send ?prevHotel get-CostByNight))) ?t))
		(printout t "Debug " ?extraCost " "?i crlf)
		;(printout t "EDebug " ?days " " ?t " " "hO"  " " "hN" crlf)
		(if (and
			(> ?improvement ?maxScoreImprovement)
			(>= ?leftOverMoney ?extraCost) 
			)
		then
			(bind ?maxScoreImprovement ?improvement)
			(bind ?bestOption (create$ 1 ?i))
		)
		(bind ?i (+ ?i 1))
	)

	; ADDING A DAY (IMPROVEMENT = HOTELDAY + EXTRASIGHTS)
	(bind ?travelDays 0)
	(progn$ (?stay (send ?travel get-Stays))
		(bind ?travelDays (+ ?travelDays (send ?stay get-Days)))
	)

	(if (> ?maxd ?travelDays)
	then ;We can add a day, probably
		(bind ?i 1)
		(progn$ (?stay (send ?travel get-Stays))
			(bind ?days (send ?stay get-Days))
			(if (> ?maxdc ?days)
			then ;We can add a day to this stay, if we have the budget
				(bind ?hotel (send ?stay get-StayHotel))
				(bind ?extraCost (* (send ?hotel get-CostByNight) ?t))
				(if (>= ?leftOverMoney ?extraCost)
				then ;We can add a day here for sure
					;Calculating extra score:
					(bind ?improvement (send ?hotel get-Score))
					(bind ?SightsSeen (length$ (send ?stay get-StaySights)))
					(bind ?j 1)
					(bind ?sightList (send (send ?stay get-StayCity) get-HasSights))
					(while (and (<= ?j ?SightsSeen) (not (eq (length$ ?sightList) 0)) )
						(bind ?toErase (maximum-score $?sightList))
						(bind $?sightList (delete-member$ $?sightList ?toErase))
						(bind ?j (+ ?j 1))
					)
					(bind ?j 1)
					(while (and (<= ?j ?mpd) (not (eq (length$ ?sightList) 0)) )
						(bind ?newSightToVisit (maximum-score $?sightList))
						(bind ?improvement (+ ?improvement (send ?newSightToVisit get-Score)))
						(bind $?sightList (delete-member$ $?sightList ?newSightToVisit))
						(bind ?j (+ ?j 1))
					)
					(if (< ?maxScoreImprovement ?improvement)
					then
						(bind ?maxScoreImprovement ?improvement)
						(bind ?bestOption (create$ 2 ?i))
					)
				)
			)
			(bind ?i (+ ?i 1))
		)
	)

	; ADDING A CITY (IMPROVEMENT = CityScore)
	(if (and 
		(<= (+ ?travelDays ?mindc) ?maxd)
		(< (length$ (send ?travel get-Stays)) ?mc)
		)
	then ; We can add a city
		(bind $?Unorderedlist (find-all-instances ((?inst City)) (> ?inst:Score 0)))
		(bind $?VisitFilter (create$ ))
		(do-for-all-facts ((?f visited)) TRUE 
			(bind $?Unorderedlist (delete-member$ $?Unorderedlist ?f:city))
		)
        (progn$ (?curr-city $?Unorderedlist)
            (bind $?cityHotels (send ?curr-city get-HasHotel))
            (bind ?somePositiveHotel FALSE)
            (progn$ (?curr-hotel $?cityHotels)
                (if
                    (> (send ?curr-hotel get-Score) 0)
                then
                    (bind ?somePositiveHotel TRUE)
                )
            )
            (if
                (eq ?somePositiveHotel FALSE)
            then
                (bind $?Unorderedlist (delete-member$ $?Unorderedlist ?curr-city))
            )
        )
		; UnorderedList has the cities yet to visit
		(if (not (eq (length$ $?Unorderedlist) 0))
		then ;Let's try to acquire the best one
			(bind ?newCity (maximum-score $?Unorderedlist))
			(if (< ?maxScoreImprovement (send ?newCity get-Score))
			then ; Potentially best option, need to check if we can actually put it here
				(bind $?hotelList (send ?newCity get-HasHotel))
				(bind ?minPrice 10000) ; Consider this number +infinity, there's no hotel that pricey
				(bind ?finalHotel nil)
				(loop-for-count (?i 1 (length$ $?hotelList)) do ; find cheapest hotel with positive score? (avoid <stars), give it to instance
					(bind ?curr-jbo (nth$ ?i ?hotelList))
					(bind ?curr-sc (send ?curr-jbo get-Score))
					(bind ?curr-pr (send ?curr-jbo get-CostByNight))
					(if (and (< ?curr-pr ?minPrice) (>= ?curr-sc 0)) ; assuming score <0 if stars < minstars
						then
						(bind ?finalHotel ?curr-jbo)
						(bind ?minPrice ?curr-pr)
					)
				)
				(if (not (eq ?finalHotel nil))
				then
					(bind ?totalCost (* (* (send ?finalHotel get-CostByNight) ?mindc) ?t))
					(if (>= ?leftOverMoney ?totalCost)
					then ; We actually can add a city
						;NO need (bind ?maxScoreImprovement)
						(bind ?bestOption (create$ 3))
					)
				)
			)
		)
	)
	
	; if whatever assert ImprovementFinished
	(if (eq ?bestOption nil) 
	then
		(bind ?notEnd FALSE)
		(assert (ImprovementFinished))
	else
		(printout t ?leftOverMoney " " (nth$ 1 ?bestOption) " " (nth$ 2 ?bestOption) crlf)
		(if (eq (nth$ 1 ?bestOption) 1)
		then
			(bind ?stay (nth$ (nth$ 2 ?bestOption) (send ?travel get-Stays)))
			(bind ?hotelList (send (send ?stay get-StayCity) get-HasHotel))
			(bind ?newHotel (maximum-score ?hotelList))
			(send ?stay put-StayHotel ?newHotel)
		)
		(if (eq (nth$ 1 ?bestOption) 2)
		then
			(bind ?stay (nth$ (nth$ 2 ?bestOption) (send ?travel get-Stays)))
			(send ?stay put-Days (+ (send ?stay get-Days) 1))

			(bind ?SightsSeen (length$ (send ?stay get-StaySights)))
			(bind ?j 1)
			(bind ?sightList (send (send ?stay get-StayCity) get-HasSights))
			(bind ?finalSightList (create$ ))
			(while (and (<= ?j ?SightsSeen) (not (eq (length$ ?sightList) 0)) )
				(bind ?toErase (maximum-score $?sightList))
				(bind $?sightList (delete-member$ $?sightList ?toErase))
				(bind $?finalSightList (insert$ $?finalSightList (+ (length$ $?finalSightList) 1) ?toErase))
				(bind ?j (+ ?j 1))
			)
			(bind ?j 1)
			(while (and (<= ?j ?mpd) (not (eq (length$ ?sightList) 0)) )
				(bind ?newSightToVisit (maximum-score $?sightList))
				(bind $?sightList (delete-member$ $?sightList ?newSightToVisit))
				(bind $?finalSightList (insert$ $?finalSightList (+ (length$ $?finalSightList) 1) ?newSightToVisit))
				(bind ?j (+ ?j 1))
			)
			(send ?stay put-StaySights ?finalSightList)
		)
		(if (eq (nth$ 1 ?bestOption) 3)
		then
			(bind $?Unorderedlist (find-all-instances ((?inst City)) (> ?inst:Score 0)))
			(bind $?VisitFilter (create$ ))
			(do-for-all-facts ((?f visited)) TRUE 
				(bind $?Unorderedlist (delete-member$ $?Unorderedlist ?f:city))
			)
            (progn$ (?curr-city $?Unorderedlist)
                (bind $?cityHotels (send ?curr-city get-HasHotel))
                (bind ?somePositiveHotel FALSE)
                (progn$ (?curr-hotel $?cityHotels)
                    (if
                        (> (send ?curr-hotel get-Score) 0)
                    then
                        (bind ?somePositiveHotel TRUE)
                    )
                )
                (if
                    (eq ?somePositiveHotel FALSE)
                then
                    (bind $?Unorderedlist (delete-member$ $?Unorderedlist ?curr-city))
                )
            )
			; UnorderedList has the cities yet to visit
			(if (not (eq (length$ $?Unorderedlist) 0))
			then
				(bind ?newCity (maximum-score $?Unorderedlist))

				(bind $?hotelList (send ?newCity get-HasHotel))
				(bind ?minPrice 10000) ; Consider this number +infinity, there's no hotel that pricey
				(bind ?finalHotel nil)
				(loop-for-count (?i 1 (length$ $?hotelList)) do ; find cheapest hotel with positive score? (avoid <stars), give it to instance
					(bind ?curr-jbo (nth$ ?i ?hotelList))
					(bind ?curr-sc (send ?curr-jbo get-Score))
					(bind ?curr-pr (send ?curr-jbo get-CostByNight))
					(if (and (< ?curr-pr ?minPrice) (>= ?curr-sc 0)) ; assuming score <0 if stars < minstars
						then
						(bind ?finalHotel ?curr-jbo)
						(bind ?minPrice ?curr-pr)
					)
				)
				(if (not (eq ?finalHotel nil)) 
				then
					(bind ?newStay (make-instance (gensym) of Stay (Days ?mindc) (StayCity ?newCity) (StayHotel ?finalHotel)))
					;Get the sights!
					(bind ?numberOfSights (* ?mindc ?mpd))
					(bind ?citySights (send ?newCity get-HasSights))
					(bind ?finalSightList (create$ ))
					(loop-for-count (?i 1 ?numberOfSights) do
						(bind ?newSightToVisit (maximum-score $?citySights))
						(bind $?citySights (delete-member$ $?citySights ?newSightToVisit))
						(bind $?finalSightList (insert$ $?finalSightList (+ (length$ $?finalSightList) 1) ?newSightToVisit))
					)
					(send ?newStay put-StaySights ?finalSightList)

					(bind ?stays (send ?travel get-Stays))
					(bind ?stays (insert$ $?stays (+ (length$ $?stays) 1) ?newStay))
					(send ?travel put-Stays ?stays)
					(assert (visited (city ?newCity))) 
				else ;Should never happen, already checked above
					(printout t "Error if this happens something went kapoof")
				)
				
			else
				(printout t "Error if this happens something went kapoof")
			)
		)
	)

	);endwhile
)
























































(defrule construction::AssignTransports "Assigns the travel transports"
	(declare (salience -9))
	(not (transportsAssigned))
	(travelRecomendation ?travel)
	=>
	(bind ?stays (send ?travel get-Stays))
	(bind ?city1 (send (nth$ 1 ?stays) get-StayCity)) ; TODO: FIX THIS!
	(bind ?result (create$ ))
	(loop-for-count (?i 2 (length$ $?stays)) do

		(bind ?city2 (send (nth$ ?i ?stays) get-StayCity))
		(bind ?transp (recTransport ?city1 ?city2))
		(bind ?recomended (send (maximum-score ?transp) get-Transport))
		(bind $?result (insert$ $?result (+ (length$ $?result) 1) ?recomended))
		(bind ?city1 ?city2)
	)
	(send ?travel put-TravelTransports ?result)
	(assert (transportsAssigned))
)



(defrule construction::toPrint "Switches to printing"
	(declare (salience -20))
	=>
	(printout t "Printing..." crlf)
	(focus printmod)
)


(deffunction printmod::Myprint (?travel ?travelers)
	(printout t "Travel: (" (travelCost ?travel ?travelers) " $)"crlf)
	(printout t "Cities: ")
	(bind $?stays (send ?travel get-Stays))
	(loop-for-count (?i 1 (length$ $?stays)) do
		(if (neq ?i 1)
			then (printout t ", ")
		)
		(bind ?curr-stay (nth$ ?i $?stays))
		(bind ?city (send ?curr-stay get-StayCity))
		;(printout t ?city)
		(printout t (send ?city get-CityName) "(" (send ?curr-stay get-Days) "days)")
	)
	(printout t crlf "Hotels: ")
	(loop-for-count (?i 1 (length$ $?stays)) do
		(if (neq ?i 1)
			then (printout t ", ")
		)
		(bind ?city (send (nth$ ?i ?stays) get-StayCity))
		(bind ?hotel (send (nth$ ?i ?stays) get-StayHotel))
		(format t "%s" (send ?hotel get-HotelName))
		(format t "(%s)" (send ?city get-CityName))
		(printout t "[" (send ?hotel get-HotelStars) "-stars, " (* (send ?hotel get-CostByNight) (* (send (nth$ ?i ?stays) get-Days) ?travelers)) "$" "]" )
	)
	(printout t crlf "Sights: ")
	(loop-for-count (?i 1 (length$ $?stays)) do
		(bind ?curr-stay (nth$ ?i $?stays))
		(bind ?city (send ?curr-stay get-StayCity))
		(printout t crlf " - " (send ?city get-CityName)  ":   ")

		(bind ?sights (send ?curr-stay get-StaySights))

		(loop-for-count (?j 1 (length$ $?sights)) do
			(if (neq ?j 1)
				then (printout t ", ")
			)
			(bind ?sight (nth$ ?j ?sights))
			(format t "%s" (send ?sight get-SightName))	
		)
	)
	(bind $?transports (send ?travel get-TravelTransports))
	(printout t crlf "Transport: " (length$ $?transports))
	(loop-for-count (?i 1 (length$ $?transports)) do
		(bind ?city1 (send (send (nth$ ?i $?stays) get-StayCity) get-CityName ) )
		(bind ?city2 (send (send (nth$ (+ ?i 1) $?stays) get-StayCity) get-CityName ) )
		(bind ?curr-transport (send (nth$ ?i $?transports) get-TransportName))
		(printout t crlf ?city1 " - " ?curr-transport " - " ?city2 )
	)
	(printout t crlf crlf)
)


(defrule printmod::printer ""
	?f<-(travelRecomendation ?x)
	?f2<-(transportsAssigned)
	?f3<-(ImprovementFinished)
	(travelers ?t)
	(not (oneDone))
	=>
	(assert (oneDone))
	(Myprint ?x ?t)
	(printout t crlf "Building travel 2..." crlf)
	(retract ?f)
	(retract ?f2)
	(retract ?f3)
	(focus construction)
)

(defrule printmod::printer2 ""
	?f<-(travelRecomendation ?x)
	(travelers ?t)
	(oneDone)
	=>
	(Myprint ?x ?t)
)


;num-question
;yes-no-question
;multioption

;; TODO: could add rule here to check constraints on number of days in city, cities to visit and days in travel.
;facts: budget, mindays, maxdays, minnumcities, maxnumcities, mindaysincities, maxdaysincities, avoidtransport, prefertransport, minhotelquality, visitrare, sacrificetimeforbudget, sacrificequalityforbudget, age, culture??, kids, travelers, event, objective


















(deffacts testing-data "just a random set of input"
    (event amigos)
    (objective aventura)
    (budget 6000)
    (mindays 1)
    (maxdays 30)
    (sacrificetimeforbudget TRUE)
    (minnumcities 3)
    (maxnumcities 10)
    (mindaysincities 1)
    (maxdaysincities 10)
    (minhotelquality 4)
    (sacrificequalityforbudget FALSE)
    (visitrare TRUE)
    (age 100)
    (kids TRUE)
    (travelers 3)
    (avoidtransport (trans coche))
    (prefertransport (trans avion))
    (transportPreferencesSet)
)