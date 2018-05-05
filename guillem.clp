; processing muy temporal

(defrule characterisation::TempFocusChange
    (kids ?)
    =>
    (focus processing)
)

;(defrule processing::imprimehoteles
;	?hecho <- (budget ?x)
;	=>
;    (printout t ?x crlf)
;	(bind $?lista (find-all-instances ((?inst Hotel)) TRUE))
;	(progn$ (?curr-con $?lista)
;		(printout t (send ?curr-con get-HotelName) crlf)
;	)	
;	(retract ?hecho)
;)

;;; template for hotel lists, might be enough with one def, haven't tested
(deftemplate processing::hotelList
	(multislot hotels (type INSTANCE))
)

(deftemplate processing::hotelListFiltered
	(multislot hotelsFiltered (type INSTANCE))
)

(defclass stay ;;; might not use it, very temp
	(is-a USER)
	(role concrete)
	(multislot recomendaciones
		(type INSTANCE)
		(create-accessor read-write))
    (slot hotel
		(type INSTANCE)
		(create-accessor read-write))
    (slot days
        (type INTEGER)
        (create-accessor read-write))
	(multislot sights    ;;; either all the sights for the stay (filtered) or all the possible sights in that city
		(type INSTANCE)
		(create-accessor read-write))
)

(defrule processing::initial-asserts "Just for testing"
    (declare (salience 20))
    (not (hotelList))
    =>
    (assert (hotelList))
    ;(assert (hotelListFiltered))
)

(defrule processing::addHotels "Add all hotels, filter afterwards"
    (declare (salience 10))
    ?hot <- (object (is-a Hotel))
	?fact <- (hotelList (hotels $?list))
	(test (not (member$ ?hot $?list)))
	=>
	(bind $?list (insert$ $?list (+ (length$ $?list) 1) ?hot))
	(modify ?fact (hotels $?list))
)

(defrule processing::more-asserts "this shouldn't be necessary" ;;can most likely be moved to the intial asserts of processing
    (declare (salience 7))
    (not (hotelListFiltered))
    =>
    (assert (hotelListFiltered))
)

(defrule processing::removeHotelsByStars "Remove hotels with less stars than asked for"
    (declare (salience 5))
    ?factTMP <- (minhotelquality ?quality)
	?fact1 <- (hotelList (hotels $?list))
    ?fact2 <- (hotelListFiltered (hotelsFiltered $?list2))
    ;?h2 <- (sacrificequalityforbudget FALSE)
	=>
    (progn$ (?curr-hot $?list)
        (if (>= (send ?curr-hot get-HotelStars) ?quality)
            then 
            (bind $?list2 (insert$ $?list2 (+ (length$ $?list2) 1) ?curr-hot))
        )
	)
	(modify ?fact2 (hotelsFiltered $?list2))
    (retract ?factTMP)
)

(defrule processing::printSavedHotels "print saved hotels in list"
    (declare (salience -10))
    ?fact <- (hotelListFiltered (hotelsFiltered $?list))
    =>
    (progn$ (?curr-hot $?list)
		(printout t (send ?curr-hot get-HotelName) crlf)
	)
)
