;;; Victor parte de Clips. No tocar! Solo copiar

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
	(export ?ALL)
)
;;; Module for printing solution
(defmodule printmod
	(import MAIN ?ALL)
	(export ?ALL)
)

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
	(assert (sacrificetimeforbudget (yes-no-question "¿Está dispuesto a pasar menos o más días de los especificados con tal de adecuarse al presupuesto?")))
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
	(assert (sacrificequalityforbudget (yes-no-question "¿Está dispuesto a pasar noches en un hotel de menos calidad a la preferida?")))
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
(defrule characterisation::kids "Ask number of travelers"
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
			(assert (avoidtransport ?avoid))
			(bind ?done (not (yes-no-question "¿Alguno mas?")))
		)
	)
	(if (yes-no-question "¿Tiene alguna preferencia sobre transportes a tomar?")
		then 
		(bind ?done FALSE)
		(while (not ?done) do
			(bind ?prefered (multioption "Inserte transporte preferido:" ?transportTypes))
			(assert (prefertransport ?prefered))
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
	(focus processing)
)
(defrule processing::toPrint "Switches to printing"
	(declare (salience -20))
	=>
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


(defrule construction::Start "Initializes the solution with minimum requirements"
	(not (travel ?))
	(minnumcities ?d)
	(mindaysincities ?dc)
	=>
	(bind $?Unorderedlist (find-all-instances ((?inst City)) (> ?inst:score 0)))
	(bind $?result (create$ ))
	(while (and (not (eq (length$ $?Unorderedlist) 0)) (< (length$ $?result) ?d))  do
		(bind ?curr-rec (maximum-score $?Unorderedlist))
		(bind $?Unorderedlist (delete-member$ $?Unorderedlist ?curr-rec))
		(bind $?result (insert$ $?result (+ (length$ $?result) 1) ?curr-rec))
	)
	(if (< (length$ $?result) ?d)
		then
		(printout t "Impossible travel" crlf)
		else
			(loop-for-count (?i 1 (length$ $?result)) do
				(bind ?curr-obj (nth$ ?i ?result))
				(assert (visited (send ?curr-obj get-CityName)))
				(make-instance (gensym) of Stay (Days ?dc) (StayCity ?curr-obj))
				(printout t "Will visit city: ")
				(format t "%s " (send ?curr-obj get-CityName))
				(printout t crlf)
			)
	)
)




;num-question
;yes-no-question
;multioption

;; TODO: could add rule here to check constraints on number of days in city, cities to visit and days in travel.
;facts: budget, mindays, maxdays, minnumcities, maxnumcities, mindaysincities, maxdaysincities, avoidtransport, prefertransport, minhotelquality, visitrare, sacrificetimeforbudget, sacrificequalityforbudget, age, culture??, kids, travelers, event, objective