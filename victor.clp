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

(defrule characterisation::NumTravelers "Ask number of sights a day"
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
(defrule construction::toPrint "Switches to printing"
	(declare (salience -20))
	=>
	(printout t "Printing..." crlf)
	(focus printmod)
)
; printmod should print solution, printout building travel 2, delete the assertion? and then re-switch to construction?

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
	;(printout t "TEST2")
	(bind ?good TRUE)
	(bind $?Unorderedlist (find-all-instances ((?inst City)) (> ?inst:Score 0))) ;; do-for-all-facts might prove useful to discard already 'visited' cities
	(bind $?VisitFilter (create$ ))
	(do-for-all-facts ((?f visited)) TRUE 
		;(printout t ?f)
		(bind $?Unorderedlist (delete-member$ $?Unorderedlist ?f:city))
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
			(assert (visited (city ?curr-obj))) ;; before doing this, in final, check if it's within acceptable range!
			;Add it to the travel
			;(printout t "Will visit city: ")		;TODO: comment these lines
			;(format t "%s " (send ?curr-obj get-CityName)) ; this too
			;(printout t crlf)
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

			
			; add prev-location for travels, maybe later on
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


(defrule construction::AssignTransports "Assigns the travel transports"
	(not (transportsAssigned))
	(travelRecomendation ?travel)
	=>
	(bind ?stays (send ?travel get-Stays))
	(bind ?city1 (send (nth$ 1 ?stays) get-StayCity))
	(bind ?result (create$ ))
	(loop-for-count (?i 2 (length$ $?stays)) do
		(bind ?city2 (send (nth$ (+ ?i 1) ?stays) get-StayCity))
		(bind ?transp (recTransport ?city1 ?city2))
		(bind ?recomended (send (maximum-score ?transp) get-Transport))
		(bind $?result (insert$ $?result (+ (length$ $?result) 1) ?curr-rec))
		(bind ?city1 ?city2)
	)
	(send ?travel put-TravelTransports ?result)
	(assert (transportsAssigned))
)






(deffunction printmod::Myprint (?travel ?travelers)
	(printout t "Travel:" crlf)
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
		(printout t crlf " - " (send ?city get-CityName) )

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
	(loop-for-count (?i 1 (length$ $?transports)) do
		(bind ?city1 (send (send (nth$ ?i $?stays) get-StayCity) get-CityName ) )
		(bind ?city2 (send (send (nth$ (+ ?i 1) $?stays) get-StayCity) get-CityName ) )
		(bind ?curr-transport (send (nth$ ?i $?transports) get-TransportName))
		(printout t crlf ?city1 " - " ?curr-transport " - " ?city2 )
	)
)


(defrule printmod::printer ""
	?f<-(travelRecomendation ?x)
	?f2<-(transportsAssigned)
	(travelers ?t)
	(not (oneDone))
	=>
	;(printout t "TEst") ; DEBUG
	(assert (oneDone))
	(Myprint ?x ?t)
	(printout t crlf "Building travel 2..." crlf)
	(retract ?f)
	(retract ?f2)
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