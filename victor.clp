
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
	(printout t "Por favor, responda a las siguientes preguntas:")
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
(defrule characterisation::numberofdaysincities "Asks for number of cities to visit"
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
(defrule characterisation::transportpreferences "Asks for all transport preferences"
	(not (transportPreferencesSet))
	=>
	(bind ?listatransportes ????);;; TODO: ADD FROM ONTHOLOGY, GET ALL INSTANCES OF TRANSPORT
	(if (yes-no-question "¿Tiene alguna preferencia sobre transportes a evitar?")
		then 
		(bind ?done FALSE)
		(while (not (done)) do
			(bind ?avoid (multioption "Inserte transporte a evitar:" ?listaTransportes))
			(assert (avoidtransport ?avoid))
			(bind ?done (yes-no-question "¿Alguno mas?"))
		)
	)
	(if (yes-no-question "¿Tiene alguna preferencia sobre transportes a tomar?")
		then 
		(bind ?done FALSE)
		(while (not (done)) do
			(bind ?avoid (multioption "Inserte transporte preferido:" ?listaTransportes))
			(assert (avoidtransport ?avoid))
			(bind ?done (yes-no-question "¿Alguno mas?"))
		)
	)
	(assert transportPreferencesSet)
)
(defrule characterisation::minHotelQuality "Asks for the quality of the hotel"
	(not (minhotelquality ?))
	=>
	(assert (minhotelquality (num-question "¿Cual es el numero minimo de estrellas de los hoteles en que alojarse?" 0 5)))
)
;; TODO: could add rule here to check constraints on number of days in city, cities to visit and days in travel.
;facts: budget, mindays, maxdays, minnumcities, maxnumcities, mindaysincities, maxdaysincities, avoidtransport, prefertransport, minhotelquality