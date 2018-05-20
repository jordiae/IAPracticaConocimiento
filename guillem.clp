
; processing a bit less temporal


(defrule characterisation::TempTestFunc
    (declare (salience 20))
    (impossible fact)
    =>
    (bind ?instances (find-all-instances ( (?i Hotel)) TRUE))
    ;(bind ?instances (sort id-sort ?instances))
    ;(progn$ (?i ?instances)
    ;    (printout t (send ?i get-id) " " (send ?i get-full-name) crlf)))
    (progn$ (?curr-hot ?instances)
		(printout t (send ?curr-hot get-HotelName) crlf)
	)
)

(deftemplate processing::hotelList
	(multislot hotels (type INSTANCE))
)

(deftemplate processing::cityList
	(multislot cities (type INSTANCE))
)

(deftemplate processing::sightList
	(multislot sights (type INSTANCE))
)

;(deftemplate processing::hotelListFiltered
;	(multislot hotelsFiltered (type INSTANCE))
;)

;(defclass processing::cityRecommendation ;;;template or class? will leave as class for now
;    (multislot hotels  
;        (type INSTANCE)
;        (create-accessor read-write)
;    )  
;)

;(defclass processing::trip ;;;template or class? will leave as class for now
;    (multislot cityRecommendations  ;;;all cityRecommendations with the objective from the user
;        (type INSTANCE)
;        (create-accessor read-write)
;    )  
;)



;(defclass stay ;;; might not use it, very temp
;	(is-a USER)
;	(role concrete)
;	(multislot recomendaciones
;		(type INSTANCE)
;		(create-accessor read-write))
;    (slot hotel
;		(type INSTANCE)
;		(create-accessor read-write))
;    (slot days
;        (type INTEGER)
;        (create-accessor read-write))
;	(multislot sights    ;;; either all the sights for the stay (filtered) or all the possible sights in that city
;		(type INSTANCE)
;		(create-accessor read-write))
;)

(defrule processing::initial-asserts "Just for testing"
    (declare (salience 20))
    (not (hotelList))
    =>
    (assert (hotelList))
    (assert (cityList))
    (assert (sightList))
    ;(assert (hotelListFiltered))
)

(defrule processing::addHotels "Add all hotels, score afterwards"
    (declare (salience 10))
    ?hot <- (object (is-a Hotel))
	?fact <- (hotelList (hotels $?list))
	(test (not (member$ ?hot $?list)))
	=>
	(bind $?list (insert$ $?list (+ (length$ $?list) 1) ?hot))
	(modify ?fact (hotels $?list))
    (send ?hot put-Score 0)
)

(defrule processing::addCities "Add all cities, score afterwards"
    (declare (salience 10))
    ?hot <- (object (is-a City))
	?fact <- (cityList (cities $?list))
	(test (not (member$ ?hot $?list)))
	=>
	(bind $?list (insert$ $?list (+ (length$ $?list) 1) ?hot))
	(modify ?fact (cities $?list))
    (send ?hot put-Score 0)
)

(defrule processing::addSights "Add all hotels, score afterwards"
    (declare (salience 10))
    ?hot <- (object (is-a Sight))
	?fact <- (sightList (sights $?list))
	(test (not (member$ ?hot $?list)))
	=>
	(bind $?list (insert$ $?list (+ (length$ $?list) 1) ?hot))
	(modify ?fact (sights $?list))
    (send ?hot put-Score 0)
)

(defrule processing::scoreCities "modify the score of each city"
    (declare (salience 9)) ;putting this here because this rule sets the initial score
    (objective ?obj)
    ?fact <- (cityList (cities $?list))
    =>
    (progn$ (?curr-city $?list)
        (bind $?list2 (send ?curr-city get-CityInterests))
        (progn$ (?curr-interest $?list2)
            (if (eq (send ?curr-interest get-Kind) ?obj)
                then
                ;(send ?curr-city put-Score (+ (send ?curr-city get-Score) 100))
                (send ?curr-city put-Score 100)  ;;;have to do it like this because the instances have no score
                ;; might want to change later the 100 for a function that gives a score depending on the combination of user obj + city interest
            )
        )
	)
)

(defrule processing::scoreCitiesByTheirSights "What would you know, people go places to see things"
    ?scoredsights <- (SightsScored) ;; we need to know that this has been done to score the cities better
    ?fact <- (cityList (cities $?list))
    =>
    (progn$ (?curr-city $?list)
        (bind $?list2 (send ?curr-city get-HasSights))
        (progn$ (?curr-sight $?list2)
            (send ?curr-city put-Score (+ (send ?curr-city get-Score) (send ?curr-sight get-Score)))
        )
	)
    (retract ?scoredsights) ;; to mark that it's done
)

(defrule processing::scoreSights "modify the score of each sight"
    (declare (salience 9)) ;putting this here because this rule sets the initial score
    (objective ?obj)
    ?fact <- (sightList (sights $?list))
    =>
    (progn$ (?curr-sight $?list)
        (bind $?list2 (send ?curr-sight get-SightInterest))
        (progn$ (?curr-interest $?list2)
            (if (eq (send ?curr-interest get-Kind) ?obj)
                then
                ;(send ?curr-sight put-Score (+ (send ?curr-sight get-Score) 100))
                (send ?curr-sight put-Score 100)  ;;;have to do it like this because the instances have no score
                ;; might want to change later the 100 for a function that gives a score depending on the combination of user obj + city interest
            )
        )
	)
)

(defrule processing::scoreSightsNotRare "The user likes not being able to see what he is visiting and bumping into selfie sticks"
    (visitrare FALSE)
    ?fact <- (sightList (sights $?list))
    =>
    (progn$ (?curr-sight $?list)
        (send ?curr-sight put-Score (+ (send ?curr-sight get-Score) (* (send ?curr-sight get-Importance) 10) ))
        ;; just regular scoring
	)
    (assert (SightsScored)) ;; we need to know that this has been done to score the cities better
)

(defrule processing::scoreSightsRare "The user doesn't like to see people when visiting things, may I recommend VR?"
    (visitrare TRUE)
    ?fact <- (sightList (sights $?list))
    =>
    (progn$ (?curr-sight $?list)
        (send ?curr-sight put-Score (+ (send ?curr-sight get-Score) (* (- 6 (send ?curr-sight get-Importance) ) 10) ))
        ;; just inverse scoring
	)
    (assert (SightsScored)) ;; we need to know that this has been done to score the cities better
)

(defrule processing::scoreHotel "modify the score of each hotel"
    (declare (salience 9)) ;putting this here because this rule sets the initial score
    ?fact <- (hotelList (hotels $?list))
    =>
    (progn$ (?curr-hot $?list)
        (send ?curr-hot put-Score (* (send ?curr-hot get-HotelStars) 10))
	)
)

(defrule processing::scoreHotelSacrifice "modify the score of each hotel if the user is willing to sacrifice comfort"
    (sacrificequalityforbudget TRUE)
    (minhotelquality ?quality)
    ?fact <- (hotelList (hotels $?list))
    =>
    (progn$ (?curr-hot $?list)
        (if (< (send ?curr-hot get-HotelStars) ?quality)
            then
            (send ?curr-hot put-Score (- (send ?curr-hot get-Score) (* (- ?quality (send ?curr-hot get-HotelStars)) 5)))
            ; small punishment for having less stars than asked
        )
	)
)

(defrule processing::scoreHotelNoSacrifice "modify the score of each hotel if the user is not willing to sacrifice comfort"
    (sacrificequalityforbudget FALSE)
    (minhotelquality ?quality)
    ?fact <- (hotelList (hotels $?list))
    =>
    (progn$ (?curr-hot $?list)
        (if (< (send ?curr-hot get-HotelStars) ?quality)
            then
            (send ?curr-hot put-Score (- (send ?curr-hot get-Score) 1000))
            ; divine smite to the unworthy hotels with below asked stars
        )
	)
)

;(defrule processing::printCityScore "testforScoring"
;    (declare (salience -10))
;    ?fact <- (cityList (cities $?list))
;    =>
;    (progn$ (?curr-city $?list)
;		(printout t (send ?curr-city get-CityName) "    " (send ?curr-city get-Score) crlf)
;	)
;)


;(defrule processing::removeHotelsByStars "Remove hotels with less stars than asked for"
;    (declare (salience 5))
;    (not (hotelsAreFiltered))
;    ?factTMP <- (minhotelquality ?quality)
;	?fact1 <- (hotelList (hotels $?list))
;    ?fact2 <- (hotelListFiltered (hotelsFiltered $?list2))
;    ;?h2 <- (sacrificequalityforbudget FALSE)
;	=>
;    (progn$ (?curr-hot $?list)
;        (if (>= (send ?curr-hot get-HotelStars) ?quality)
;            then 
;            (bind $?list2 (insert$ $?list2 (+ (length$ $?list2) 1) ?curr-hot))
;        )
;	)
;	(modify ?fact2 (hotelsFiltered $?list2))
;    (assert (hotelsAreFiltered))
;)

;(defrule processing::printSavedHotels "print saved hotels in list"
;    (declare (salience -10))
;    ?fact <- (hotelListFiltered (hotelsFiltered $?list))
;    =>
;    (progn$ (?curr-hot $?list)
;		(printout t (send ?curr-hot get-HotelName) crlf)
;	)
;)

(deffacts testing-data "just a random set of input"
    (event amigos)
    (objective aventura)
    (budget 6000)
    (mindays 1)
    (maxdays 30)
    (sacrificetimeforbudget TRUE)
    (minnumcities 1)
    (maxnumcities 10)
    (mindaysincities 1)
    (maxdaysincities 10)
    (minhotelquality 4)
    (sacrificequalityforbudget FALSE)
    (visitrare TRUE)
    (age 100)
    (kids TRUE)
    (travelers 3)
    (avoidtransport coche)
    (prefertransport avion)
    (transportPreferencesSet)
)