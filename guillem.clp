
; Processing code

; template for the list of hotels
(deftemplate processing::hotelList
	(multislot hotels (type INSTANCE))
)

; template for the list of cities
(deftemplate processing::cityList
	(multislot cities (type INSTANCE))
)

; template for the list of sights
(deftemplate processing::sightList
	(multislot sights (type INSTANCE))
)

; initial assert to create lists we'll use later
(defrule processing::initial-asserts "Creating the lists used in processing"
    (declare (salience 20))
    (not (hotelList))
    =>
    (assert (hotelList))
    (assert (cityList))
    (assert (sightList))
)

; Adding all the hotels to their list and initializing the score to 0
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

; Adding all the cities to their list and initializing the score to 0
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

; Adding all the sights to their list and initializing the score to 0
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
    (declare (salience 9)) ; higher salience as this sets their base score
    (objective ?obj) ; this is the what the user is interested in
    ?fact <- (cityList (cities $?list))
    =>
    (progn$ (?curr-city $?list)
        (bind $?list2 (send ?curr-city get-CityInterests))
        (progn$ (?curr-interest $?list2)
            ; if an interest in a city is of the same kind as what the user is interested in, the base score of the city is higher
            (if (eq (send ?curr-interest get-Kind) ?obj) 
                then
                (send ?curr-city put-Score 100) 
            )
        )
	)
)

(defrule processing::scoreCitiesByTheirSights "Cities with better sights should have a better score"
    ?scoredsights <- (SightsScored) ; since we are giving better score to cities depending on their sights, all sights have to be scored before we do this
    ?fact <- (cityList (cities $?list))
    =>
    (progn$ (?curr-city $?list)
        (bind $?list2 (send ?curr-city get-HasSights))
        (progn$ (?curr-sight $?list2)
            ; for each sight a city has, we sum the score of the sight to the score of the city
            (send ?curr-city put-Score (+ (send ?curr-city get-Score) (send ?curr-sight get-Score)))
        )
	)
    (retract ?scoredsights) ; we retract this fact to mark that we're done with this scoring
)

(defrule processing::scoreSights "modify the score of each sight"
    (declare (salience 9)) ; higher salience as this sets their base score
    (objective ?obj) ; this is the what the user is interested in
    ?fact <- (sightList (sights $?list))
    =>
    (progn$ (?curr-sight $?list)
        (bind $?list2 (send ?curr-sight get-SightInterest))
        (progn$ (?curr-interest $?list2)
            (if (eq (send ?curr-interest get-Kind) ?obj)
                then
                ; same as the cities, if a sight has the same kind of interest the user wants, give it a higher score
                (send ?curr-sight put-Score 100) 
            )
        )
	)
)

(defrule processing::scoreSightsNotRare "As the user likes important, well known sights, we'll give those a better score"
    (visitrare FALSE) ; this means the user prefers more important sights
    ?fact <- (sightList (sights $?list))
    =>
    (progn$ (?curr-sight $?list)
        (send ?curr-sight put-Score (+ (send ?curr-sight get-Score) (* (send ?curr-sight get-Importance) 10) ))
        ; we add score to each sight proportionally to their importance
	)
    (assert (SightsScored)) ; We use this fact to mark that the sights are done being scored
)

(defrule processing::scoreSightsRare "As the user likes less important, less known sights, we'll give those a better score"
    (visitrare TRUE) ; this means the user prefers less important sights
    ?fact <- (sightList (sights $?list))
    =>
    (progn$ (?curr-sight $?list)
        (send ?curr-sight put-Score (+ (send ?curr-sight get-Score) (* (- 6 (send ?curr-sight get-Importance) ) 10) ))
        ; we add score to each sight proportionally inverse to their importance
	)
    (assert (SightsScored)) ; We use this fact to mark that the sights are done being scored
)

(defrule processing::scoreHotel "modify the score of each hotel"
    (declare (salience 9)) ; higher salience as this sets their base score
    ?fact <- (hotelList (hotels $?list))
    =>
    (progn$ (?curr-hot $?list)
        ; we add score to each hotel proportionally to its stars
        (send ?curr-hot put-Score (* (send ?curr-hot get-HotelStars) 10))
	)
)

(defrule processing::scoreHotelSacrifice "modify the score of each hotel if the user is willing to sacrifice comfort"
    (sacrificequalityforbudget TRUE) ; this tells us the user is willing to sacrifice comfort
    (minhotelquality ?quality) ; this tells us how many stars the user wants for hotels
    ?fact <- (hotelList (hotels $?list))
    =>
    (progn$ (?curr-hot $?list)
        (if (< (send ?curr-hot get-HotelStars) ?quality)
            then
            (send ?curr-hot put-Score (- (send ?curr-hot get-Score) (* (- ?quality (send ?curr-hot get-HotelStars)) 5)))
            ; we remove a small amount of score from hotels for having less stars than asked, though not enough to drive the score into the negatives
        )
	)
)

(defrule processing::scoreHotelNoSacrifice "modify the score of each hotel if the user is not willing to sacrifice comfort"
    (sacrificequalityforbudget FALSE) ; this tells us the user is not willing to sacrifice comfort
    (minhotelquality ?quality) ; this tells us how many stars the user demands for hotels
    ?fact <- (hotelList (hotels $?list))
    =>
    (progn$ (?curr-hot $?list)
        (if (< (send ?curr-hot get-HotelStars) ?quality)
            then
            (send ?curr-hot put-Score (- (send ?curr-hot get-Score) 1000))
            ; we remove a big amount of score from hotels if they have less stars than demanded, putting it into the negatives
        )
	)
)

