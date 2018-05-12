; Tue May 08 12:10:13 CEST 2018
; 
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot Days
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Stays
		(type INSTANCE)
;+		(allowed-classes Stay)
		(create-accessor read-write))
	(single-slot YCoord
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot StayCity
		(type INSTANCE)
;+		(allowed-classes City)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot CityInterests
		(type INSTANCE)
;+		(allowed-classes Interest)
		(cardinality 1 5)
;+		(inverse-slot InterestCity)
		(create-accessor read-write))
	(multislot CityCityType
		(type INSTANCE)
;+		(allowed-classes City)
;+		(inverse-slot CityTypes)
		(create-accessor read-write))
	(single-slot DailyCost
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot HotelStars
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot HasSights
		(type INSTANCE)
;+		(allowed-classes Sight)
;+		(inverse-slot SightSituatedIn)
		(create-accessor read-write))
	(multislot InterestSight
		(type INSTANCE)
;+		(allowed-classes Sight)
;+		(inverse-slot SightInterest)
		(create-accessor read-write))
	(single-slot TypeName
		(type SYMBOL)
		(allowed-values mediterranea rascacielos nordica superpoblada industrial maritima fria con_casco_historico asiatica verde)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot inverse_of_cityTypeCity
		(type INSTANCE)
;+		(allowed-classes CityType)
		(create-accessor read-write))
	(single-slot XCoord
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot TransportName
		(type SYMBOL)
		(allowed-values avion barco tren coche)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot SightSituatedIn
		(type INSTANCE)
;+		(allowed-classes City)
;+		(cardinality 1 1)
;+		(inverse-slot HasSights)
		(create-accessor read-write))
	(multislot CityTypes
		(type INSTANCE)
;+		(allowed-classes CityType)
		(cardinality 1 5)
;+		(inverse-slot CityCityType)
		(create-accessor read-write))
	(single-slot Distance
		(type SYMBOL)
		(allowed-values corta media larga)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot CostByNight
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot VisitCost
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Importance
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot CityTypeCities
		(type INSTANCE)
;+		(allowed-classes City)
;+		(inverse-slot TypeOfCity)
		(create-accessor read-write))
	(single-slot HotelSituatedIn
		(type INSTANCE)
;+		(allowed-classes City)
;+		(cardinality 1 1)
;+		(inverse-slot HasHotel)
		(create-accessor read-write))
	(single-slot HotelName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot TypeOfCity
		(type INSTANCE)
;+		(allowed-classes CityType)
		(cardinality 1 5)
;+		(inverse-slot CityTypeCities)
		(create-accessor read-write))
	(single-slot Score
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot StaySights
		(type INSTANCE)
;+		(allowed-classes Sight)
		(create-accessor read-write))
	(multislot InterestCity
		(type INSTANCE)
;+		(allowed-classes City)
;+		(inverse-slot CityInterests)
		(create-accessor read-write))
	(single-slot StayHotel
		(type INSTANCE)
;+		(allowed-classes Hotel)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot CityName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot HasHotel
		(type INSTANCE)
;+		(allowed-classes Hotel)
;+		(inverse-slot HotelSituatedIn)
		(create-accessor read-write))
	(single-slot Kind
		(type SYMBOL)
		(allowed-values romantico cultural deportivo musical historico infantil naturaleza relax aventura tecnologico)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot SightName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot SightInterest
		(type INSTANCE)
;+		(allowed-classes Interest)
		(cardinality 1 5)
;+		(inverse-slot InterestSight)
		(create-accessor read-write)))

(defclass Interest
	(is-a USER)
	(role concrete)
	(multislot InterestCity
		(type INSTANCE)
;+		(allowed-classes City)
		(create-accessor read-write))
	(multislot InterestSight
		(type INSTANCE)
;+		(allowed-classes Sight)
		(create-accessor read-write))
	(single-slot Kind
		(type SYMBOL)
		(allowed-values romantico cultural deportivo musical historico infantil naturaleza relax aventura tecnologico)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass City
	(is-a USER)
	(role concrete)
	(multislot TypeOfCity
		(type INSTANCE)
;+		(allowed-classes CityType)
		(cardinality 1 5)
		(create-accessor read-write))
	(single-slot DailyCost
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot HasSights
		(type INSTANCE)
;+		(allowed-classes Sight)
		(create-accessor read-write))
	(single-slot YCoord
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot XCoord
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Score
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot CityName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot HasHotel
		(type INSTANCE)
;+		(allowed-classes Hotel)
		(create-accessor read-write))
	(multislot CityInterests
		(type INSTANCE)
;+		(allowed-classes Interest)
		(cardinality 1 5)
		(create-accessor read-write)))

(defclass Hotel
	(is-a USER)
	(role concrete)
	(single-slot HotelStars
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot CostByNight
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot HotelSituatedIn
		(type INSTANCE)
;+		(allowed-classes City)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Score
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot HotelName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Sight
	(is-a USER)
	(role concrete)
	(single-slot VisitCost
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Importance
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot SightSituatedIn
		(type INSTANCE)
;+		(allowed-classes City)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Score
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot SightName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot SightInterest
		(type INSTANCE)
;+		(allowed-classes Interest)
		(cardinality 1 5)
		(create-accessor read-write)))

(defclass CityType
	(is-a USER)
	(role concrete)
	(multislot CityTypeCities
		(type INSTANCE)
;+		(allowed-classes City)
		(create-accessor read-write))
	(single-slot TypeName
		(type SYMBOL)
		(allowed-values mediterranea rascacielos nordica superpoblada industrial maritima fria con_casco_historico asiatica verde)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Transport
	(is-a USER)
	(role concrete)
	(single-slot Distance
		(type SYMBOL)
		(allowed-values corta media larga)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot TransportName
		(type SYMBOL)
		(allowed-values avion barco tren coche)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Travel
	(is-a USER)
	(role concrete)
	(multislot Stays
		(type INSTANCE)
;+		(allowed-classes Stay)
		(create-accessor read-write)))

(defclass Stay
	(is-a USER)
	(role concrete)
	(single-slot Days
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot StaySights
		(type INSTANCE)
;+		(allowed-classes Sight)
		(create-accessor read-write))
	(single-slot StayHotel
		(type INSTANCE)
;+		(allowed-classes Hotel)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot StayCity
		(type INSTANCE)
;+		(allowed-classes City)
;+		(cardinality 1 1)
		(create-accessor read-write)))


(definstances instances
; Tue May 08 12:10:13 CEST 2018
; 
;+ (version "3.5")
;+ (build "Build 663")

([TravelRecommendationOnthology_Class10] of  Interest

	(InterestCity
		[TravelRecommendationOnthology_Class10032]
		[TravelRecommendationOnthology_Class10033]
		[TravelRecommendationOnthology_Class10036]
		[TravelRecommendationOnthology_Class10042]
		[TravelRecommendationOnthology_Class10043]
		[TravelRecommendationOnthology_Class10044]
		[TravelRecommendationOnthology_Class10045]
		[TravelRecommendationOnthology_Class10046]
		[TravelRecommendationOnthology_Class10049]
		[TravelRecommendationOnthology_Class10051]
		[TravelRecommendationOnthology_Class10068])
	(InterestSight
		[TravelRecommendationOnthology_Class10056]
		[TravelRecommendationOnthology_Class10059]
		[TravelRecommendationOnthology_Class10065]
		[TravelRecommendationOnthology_Class10074]
		[TravelRecommendationOnthology_Class10076]
		[TravelRecommendationOnthology_Class10081]
		[TravelRecommendationOnthology_Class10084]
		[TravelRecommendationOnthology_Class10087]
		[TravelRecommendationOnthology_Class10091]
		[TravelRecommendationOnthology_Class10092]
		[TravelRecommendationOnthology_Class10094]
		[TravelRecommendationOnthology_Class10102]
		[TravelRecommendationOnthology_Class10109])
	(Kind cultural))

([TravelRecommendationOnthology_Class10015] of  Interest

	(InterestCity
		[TravelRecommendationOnthology_Class10033]
		[TravelRecommendationOnthology_Class10041]
		[TravelRecommendationOnthology_Class10052])
	(InterestSight
		[TravelRecommendationOnthology_Class10060]
		[TravelRecommendationOnthology_Class10077]
		[TravelRecommendationOnthology_Class10115])
	(Kind naturaleza))

([TravelRecommendationOnthology_Class10016] of  Interest

	(InterestCity
		[TravelRecommendationOnthology_Class10039]
		[TravelRecommendationOnthology_Class10040]
		[TravelRecommendationOnthology_Class10041]
		[TravelRecommendationOnthology_Class10043]
		[TravelRecommendationOnthology_Class10044]
		[TravelRecommendationOnthology_Class10053])
	(InterestSight
		[TravelRecommendationOnthology_Class10070]
		[TravelRecommendationOnthology_Class10073]
		[TravelRecommendationOnthology_Class10079]
		[TravelRecommendationOnthology_Class10085]
		[TravelRecommendationOnthology_Class10086]
		[TravelRecommendationOnthology_Class10116]
		[TravelRecommendationOnthology_Class10117])
	(Kind relax))

([TravelRecommendationOnthology_Class10017] of  Interest

	(InterestCity
		[TravelRecommendationOnthology_Class10035]
		[TravelRecommendationOnthology_Class10043]
		[TravelRecommendationOnthology_Class10047]
		[TravelRecommendationOnthology_Class10050])
	(InterestSight
		[TravelRecommendationOnthology_Class10062]
		[TravelRecommendationOnthology_Class10083]
		[TravelRecommendationOnthology_Class10095]
		[TravelRecommendationOnthology_Class10107])
	(Kind aventura))

([TravelRecommendationOnthology_Class10018] of  Interest

	(InterestCity
		[TravelRecommendationOnthology_Class10047]
		[TravelRecommendationOnthology_Class10048]
		[TravelRecommendationOnthology_Class10049]
		[TravelRecommendationOnthology_Class10052])
	(InterestSight
		[TravelRecommendationOnthology_Class10096]
		[TravelRecommendationOnthology_Class10098]
		[TravelRecommendationOnthology_Class10099]
		[TravelRecommendationOnthology_Class10101]
		[TravelRecommendationOnthology_Class10103]
		[TravelRecommendationOnthology_Class10112])
	(Kind tecnologico))

([TravelRecommendationOnthology_Class10020] of  CityType

	(CityTypeCities
		[TravelRecommendationOnthology_Class10032]
		[TravelRecommendationOnthology_Class10033]
		[TravelRecommendationOnthology_Class10035]
		[TravelRecommendationOnthology_Class10036]
		[TravelRecommendationOnthology_Class10039]
		[TravelRecommendationOnthology_Class10045]
		[TravelRecommendationOnthology_Class10046])
	(TypeName mediterranea))

([TravelRecommendationOnthology_Class10021] of  CityType

	(CityTypeCities
		[TravelRecommendationOnthology_Class10048]
		[TravelRecommendationOnthology_Class10047]
		[TravelRecommendationOnthology_Class10050]
		[TravelRecommendationOnthology_Class10051]
		[TravelRecommendationOnthology_Class10053])
	(TypeName rascacielos))

([TravelRecommendationOnthology_Class10022] of  CityType

	(CityTypeCities
		[TravelRecommendationOnthology_Class10040]
		[TravelRecommendationOnthology_Class10041]
		[TravelRecommendationOnthology_Class10042]
		[TravelRecommendationOnthology_Class10068])
	(TypeName nordica))

([TravelRecommendationOnthology_Class10023] of  CityType

	(CityTypeCities
		[TravelRecommendationOnthology_Class10033]
		[TravelRecommendationOnthology_Class10040]
		[TravelRecommendationOnthology_Class10041])
	(TypeName verde))

([TravelRecommendationOnthology_Class10026] of  CityType

	(CityTypeCities
		[TravelRecommendationOnthology_Class10043]
		[TravelRecommendationOnthology_Class10046]
		[TravelRecommendationOnthology_Class10048]
		[TravelRecommendationOnthology_Class10047]
		[TravelRecommendationOnthology_Class10049]
		[TravelRecommendationOnthology_Class10050]
		[TravelRecommendationOnthology_Class10051]
		[TravelRecommendationOnthology_Class10053]
		[TravelRecommendationOnthology_Class10068])
	(TypeName superpoblada))

([TravelRecommendationOnthology_Class10027] of  CityType

	(CityTypeCities
		[TravelRecommendationOnthology_Class10048]
		[TravelRecommendationOnthology_Class10049])
	(TypeName industrial))

([TravelRecommendationOnthology_Class10028] of  CityType

	(CityTypeCities
		[TravelRecommendationOnthology_Class10032]
		[TravelRecommendationOnthology_Class10035]
		[TravelRecommendationOnthology_Class10042]
		[TravelRecommendationOnthology_Class10044]
		[TravelRecommendationOnthology_Class10046]
		[TravelRecommendationOnthology_Class10047]
		[TravelRecommendationOnthology_Class10049]
		[TravelRecommendationOnthology_Class10050]
		[TravelRecommendationOnthology_Class10052]
		[TravelRecommendationOnthology_Class10053])
	(TypeName maritima))

([TravelRecommendationOnthology_Class10029] of  CityType

	(CityTypeCities
		[TravelRecommendationOnthology_Class10042]
		[TravelRecommendationOnthology_Class10043]
		[TravelRecommendationOnthology_Class10044])
	(TypeName fria))

([TravelRecommendationOnthology_Class10030] of  CityType

	(CityTypeCities
		[TravelRecommendationOnthology_Class10032]
		[TravelRecommendationOnthology_Class10033]
		[TravelRecommendationOnthology_Class10035]
		[TravelRecommendationOnthology_Class10036]
		[TravelRecommendationOnthology_Class10039]
		[TravelRecommendationOnthology_Class10041]
		[TravelRecommendationOnthology_Class10042]
		[TravelRecommendationOnthology_Class10043]
		[TravelRecommendationOnthology_Class10044]
		[TravelRecommendationOnthology_Class10045]
		[TravelRecommendationOnthology_Class10046]
		[TravelRecommendationOnthology_Class10052]
		[TravelRecommendationOnthology_Class10068])
	(TypeName con_casco_historico))

([TravelRecommendationOnthology_Class10031] of  CityType

	(CityTypeCities
		[TravelRecommendationOnthology_Class10048]
		[TravelRecommendationOnthology_Class10047]
		[TravelRecommendationOnthology_Class10049]
		[TravelRecommendationOnthology_Class10050]
		[TravelRecommendationOnthology_Class10051])
	(TypeName asiatica))

([TravelRecommendationOnthology_Class10032] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class11]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class12])
	(CityName "Barcelona")
	(DailyCost 40.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10119]
		[TravelRecommendationOnthology_Class10120]
		[TravelRecommendationOnthology_Class10149])
	(HasSights
		[TravelRecommendationOnthology_Class10055]
		[TravelRecommendationOnthology_Class10056]
		[TravelRecommendationOnthology_Class10057])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10028]
		[TravelRecommendationOnthology_Class10020]
		[TravelRecommendationOnthology_Class10030])
	(XCoord 41)
	(YCoord 2))

([TravelRecommendationOnthology_Class10033] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10034]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class10015])
	(CityName "Paris")
	(DailyCost 80.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10121]
		[TravelRecommendationOnthology_Class10127]
		[TravelRecommendationOnthology_Class10150])
	(HasSights
		[TravelRecommendationOnthology_Class10058]
		[TravelRecommendationOnthology_Class10059]
		[TravelRecommendationOnthology_Class10060])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10023]
		[TravelRecommendationOnthology_Class10020]
		[TravelRecommendationOnthology_Class10030])
	(XCoord 48)
	(YCoord 2))

([TravelRecommendationOnthology_Class10034] of  Interest

	(InterestCity
		[TravelRecommendationOnthology_Class10033]
		[TravelRecommendationOnthology_Class10035]
		[TravelRecommendationOnthology_Class10051]
		[TravelRecommendationOnthology_Class10068])
	(InterestSight
		[TravelRecommendationOnthology_Class10058]
		[TravelRecommendationOnthology_Class10063]
		[TravelRecommendationOnthology_Class10075]
		[TravelRecommendationOnthology_Class10110])
	(Kind romantico))

([TravelRecommendationOnthology_Class10035] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class13]
		[TravelRecommendationOnthology_Class10017]
		[TravelRecommendationOnthology_Class10034])
	(CityName "Roma")
	(DailyCost 60.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10122]
		[TravelRecommendationOnthology_Class10136]
		[TravelRecommendationOnthology_Class10151])
	(HasSights
		[TravelRecommendationOnthology_Class10061]
		[TravelRecommendationOnthology_Class10062]
		[TravelRecommendationOnthology_Class10063])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10028]
		[TravelRecommendationOnthology_Class10020]
		[TravelRecommendationOnthology_Class10030])
	(XCoord 41)
	(YCoord 12))

([TravelRecommendationOnthology_Class10036] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class11]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class14])
	(CityName "Madrid")
	(DailyCost 50.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10123]
		[TravelRecommendationOnthology_Class10138]
		[TravelRecommendationOnthology_Class10153])
	(HasSights
		[TravelRecommendationOnthology_Class10064]
		[TravelRecommendationOnthology_Class10065]
		[TravelRecommendationOnthology_Class10066])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10020]
		[TravelRecommendationOnthology_Class10030])
	(XCoord 40)
	(YCoord -4))

([TravelRecommendationOnthology_Class10039] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class14]
		[TravelRecommendationOnthology_Class13]
		[TravelRecommendationOnthology_Class10016])
	(CityName "Lisboa")
	(DailyCost 40.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10124]
		[TravelRecommendationOnthology_Class10139]
		[TravelRecommendationOnthology_Class10157])
	(HasSights
		[TravelRecommendationOnthology_Class10067]
		[TravelRecommendationOnthology_Class10069]
		[TravelRecommendationOnthology_Class10070])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10020]
		[TravelRecommendationOnthology_Class10030])
	(XCoord 39)
	(YCoord -9))

([TravelRecommendationOnthology_Class10040] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class13]
		[TravelRecommendationOnthology_Class10016])
	(CityName "Berlin")
	(DailyCost 50.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10126]
		[TravelRecommendationOnthology_Class10142]
		[TravelRecommendationOnthology_Class10158])
	(HasSights
		[TravelRecommendationOnthology_Class10071]
		[TravelRecommendationOnthology_Class10072]
		[TravelRecommendationOnthology_Class10073])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10022]
		[TravelRecommendationOnthology_Class10023])
	(XCoord 53)
	(YCoord 13))

([TravelRecommendationOnthology_Class10041] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10015]
		[TravelRecommendationOnthology_Class13]
		[TravelRecommendationOnthology_Class10016])
	(CityName "Munich")
	(DailyCost 80.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10129]
		[TravelRecommendationOnthology_Class10145]
		[TravelRecommendationOnthology_Class10160])
	(HasSights
		[TravelRecommendationOnthology_Class10077]
		[TravelRecommendationOnthology_Class10078]
		[TravelRecommendationOnthology_Class10079])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10023]
		[TravelRecommendationOnthology_Class10022]
		[TravelRecommendationOnthology_Class10030])
	(XCoord 48)
	(YCoord 12))

([TravelRecommendationOnthology_Class10042] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class13]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class12])
	(CityName "Estocolmo")
	(DailyCost 80.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10130]
		[TravelRecommendationOnthology_Class10146]
		[TravelRecommendationOnthology_Class10161])
	(HasSights
		[TravelRecommendationOnthology_Class10080]
		[TravelRecommendationOnthology_Class10081]
		[TravelRecommendationOnthology_Class10082])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10022]
		[TravelRecommendationOnthology_Class10029]
		[TravelRecommendationOnthology_Class10028]
		[TravelRecommendationOnthology_Class10030])
	(XCoord 59)
	(YCoord 18))

([TravelRecommendationOnthology_Class10043] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10017]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class10016])
	(CityName "Moscu")
	(DailyCost 40.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10131]
		[TravelRecommendationOnthology_Class10152]
		[TravelRecommendationOnthology_Class10162])
	(HasSights
		[TravelRecommendationOnthology_Class10083]
		[TravelRecommendationOnthology_Class10084]
		[TravelRecommendationOnthology_Class10085])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10029]
		[TravelRecommendationOnthology_Class10026]
		[TravelRecommendationOnthology_Class10030])
	(XCoord 56)
	(YCoord 8))

([TravelRecommendationOnthology_Class10044] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10016]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class12])
	(CityName "San Petersburgo")
	(DailyCost 40.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10132]
		[TravelRecommendationOnthology_Class10154]
		[TravelRecommendationOnthology_Class10164])
	(HasSights
		[TravelRecommendationOnthology_Class10086]
		[TravelRecommendationOnthology_Class10087]
		[TravelRecommendationOnthology_Class10088])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10029]
		[TravelRecommendationOnthology_Class10028]
		[TravelRecommendationOnthology_Class10030])
	(XCoord 60)
	(YCoord 30))

([TravelRecommendationOnthology_Class10045] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class13]
		[TravelRecommendationOnthology_Class11]
		[TravelRecommendationOnthology_Class10])
	(CityName "Atenas")
	(DailyCost 30.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10133]
		[TravelRecommendationOnthology_Class10155]
		[TravelRecommendationOnthology_Class10167])
	(HasSights
		[TravelRecommendationOnthology_Class10089]
		[TravelRecommendationOnthology_Class10090]
		[TravelRecommendationOnthology_Class10091])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10020]
		[TravelRecommendationOnthology_Class10030])
	(XCoord 24)
	(YCoord 38))

([TravelRecommendationOnthology_Class10046] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class13])
	(CityName "Estambul")
	(DailyCost 20.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10134]
		[TravelRecommendationOnthology_Class10156]
		[TravelRecommendationOnthology_Class10168])
	(HasSights
		[TravelRecommendationOnthology_Class10092]
		[TravelRecommendationOnthology_Class10093]
		[TravelRecommendationOnthology_Class10094])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10026]
		[TravelRecommendationOnthology_Class10028]
		[TravelRecommendationOnthology_Class10020]
		[TravelRecommendationOnthology_Class10030])
	(XCoord 41)
	(YCoord 29))

([TravelRecommendationOnthology_Class10047] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10017]
		[TravelRecommendationOnthology_Class10018]
		[TravelRecommendationOnthology_Class14])
	(CityName "Tokyo")
	(DailyCost 80.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10135]
		[TravelRecommendationOnthology_Class10163]
		[TravelRecommendationOnthology_Class10170])
	(HasSights
		[TravelRecommendationOnthology_Class10095]
		[TravelRecommendationOnthology_Class10096]
		[TravelRecommendationOnthology_Class10097])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10031]
		[TravelRecommendationOnthology_Class10026]
		[TravelRecommendationOnthology_Class10021]
		[TravelRecommendationOnthology_Class10028])
	(XCoord 36)
	(YCoord 140))

([TravelRecommendationOnthology_Class10048] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10018]
		[TravelRecommendationOnthology_Class11])
	(CityName "Pequin")
	(DailyCost 40.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10137]
		[TravelRecommendationOnthology_Class10165]
		[TravelRecommendationOnthology_Class10171]
		[TravelRecommendationOnthology_Class10173])
	(HasSights
		[TravelRecommendationOnthology_Class10098]
		[TravelRecommendationOnthology_Class10099]
		[TravelRecommendationOnthology_Class10100])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10031]
		[TravelRecommendationOnthology_Class10026]
		[TravelRecommendationOnthology_Class10021]
		[TravelRecommendationOnthology_Class10027])
	(XCoord 40)
	(YCoord 116))

([TravelRecommendationOnthology_Class10049] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10018]
		[TravelRecommendationOnthology_Class10])
	(CityName "Shangai")
	(DailyCost 30.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10140]
		[TravelRecommendationOnthology_Class10166])
	(HasSights
		[TravelRecommendationOnthology_Class10101]
		[TravelRecommendationOnthology_Class10102]
		[TravelRecommendationOnthology_Class10103])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10028]
		[TravelRecommendationOnthology_Class10031]
		[TravelRecommendationOnthology_Class10026]
		[TravelRecommendationOnthology_Class10027])
	(XCoord 31)
	(YCoord 122))

([TravelRecommendationOnthology_Class10050] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class14]
		[TravelRecommendationOnthology_Class10017])
	(CityName "Hong Kong")
	(DailyCost 80.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10141]
		[TravelRecommendationOnthology_Class10169]
		[TravelRecommendationOnthology_Class10172])
	(HasSights
		[TravelRecommendationOnthology_Class10105]
		[TravelRecommendationOnthology_Class10106]
		[TravelRecommendationOnthology_Class10107])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10031]
		[TravelRecommendationOnthology_Class10026]
		[TravelRecommendationOnthology_Class10021]
		[TravelRecommendationOnthology_Class10028])
	(XCoord 22)
	(YCoord 114))

([TravelRecommendationOnthology_Class10051] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class11]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class10034])
	(CityName "Seul")
	(DailyCost 60.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10143]
		[TravelRecommendationOnthology_Class10174]
		[TravelRecommendationOnthology_Class10177])
	(HasSights
		[TravelRecommendationOnthology_Class10108]
		[TravelRecommendationOnthology_Class10109]
		[TravelRecommendationOnthology_Class10110])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10031]
		[TravelRecommendationOnthology_Class10026]
		[TravelRecommendationOnthology_Class10021])
	(XCoord 38)
	(YCoord 127))

([TravelRecommendationOnthology_Class10052] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class13]
		[TravelRecommendationOnthology_Class10018]
		[TravelRecommendationOnthology_Class10015])
	(CityName "Gdansk")
	(DailyCost 50.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10147]
		[TravelRecommendationOnthology_Class10175]
		[TravelRecommendationOnthology_Class10178])
	(HasSights
		[TravelRecommendationOnthology_Class10111]
		[TravelRecommendationOnthology_Class10112]
		[TravelRecommendationOnthology_Class10115])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10028]
		[TravelRecommendationOnthology_Class10028]
		[TravelRecommendationOnthology_Class10030])
	(XCoord 54)
	(YCoord 19))

([TravelRecommendationOnthology_Class10053] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10016]
		[TravelRecommendationOnthology_Class11])
	(CityName "Dubai")
	(DailyCost 100.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10148]
		[TravelRecommendationOnthology_Class10176]
		[TravelRecommendationOnthology_Class10179])
	(HasSights
		[TravelRecommendationOnthology_Class10116]
		[TravelRecommendationOnthology_Class10117]
		[TravelRecommendationOnthology_Class10118])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10021]
		[TravelRecommendationOnthology_Class10026]
		[TravelRecommendationOnthology_Class10028])
	(XCoord 25)
	(YCoord 55))

([TravelRecommendationOnthology_Class10055] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class11])
	(SightName "Camp Nou")
	(SightSituatedIn [TravelRecommendationOnthology_Class10032])
	(VisitCost 100.0))

([TravelRecommendationOnthology_Class10056] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Sagrada Familia")
	(SightSituatedIn [TravelRecommendationOnthology_Class10032])
	(VisitCost 50.0))

([TravelRecommendationOnthology_Class10057] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class12])
	(SightName "Palau de la Musica")
	(SightSituatedIn [TravelRecommendationOnthology_Class10032])
	(VisitCost 100.0))

([TravelRecommendationOnthology_Class10058] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10034])
	(SightName "Torre Eiffel")
	(SightSituatedIn [TravelRecommendationOnthology_Class10033])
	(VisitCost 50.0))

([TravelRecommendationOnthology_Class10059] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Louvre")
	(SightSituatedIn [TravelRecommendationOnthology_Class10033])
	(VisitCost 75.0))

([TravelRecommendationOnthology_Class10060] of  Sight

	(Importance 1)
	(SightInterest [TravelRecommendationOnthology_Class10015])
	(SightName "Parque de Belleville")
	(SightSituatedIn [TravelRecommendationOnthology_Class10033])
	(VisitCost 0.0))

([TravelRecommendationOnthology_Class10061] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Coliseo")
	(SightSituatedIn [TravelRecommendationOnthology_Class10035])
	(VisitCost 100.0))

([TravelRecommendationOnthology_Class10062] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10017])
	(SightName "Roma Subterranea")
	(SightSituatedIn [TravelRecommendationOnthology_Class10035])
	(VisitCost 50.0))

([TravelRecommendationOnthology_Class10063] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10034])
	(SightName "Centro Roma")
	(SightSituatedIn [TravelRecommendationOnthology_Class10035])
	(VisitCost 0.0))

([TravelRecommendationOnthology_Class10064] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class11])
	(SightName "Estadio Santiago Bernabeu")
	(SightSituatedIn [TravelRecommendationOnthology_Class10036])
	(VisitCost 100.0))

([TravelRecommendationOnthology_Class10065] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Museo El Prado")
	(SightSituatedIn [TravelRecommendationOnthology_Class10036])
	(VisitCost 80.0))

([TravelRecommendationOnthology_Class10066] of  Sight

	(Importance 1)
	(SightInterest [TravelRecommendationOnthology_Class14])
	(SightName "Teleferico de Madrid")
	(SightSituatedIn [TravelRecommendationOnthology_Class10036])
	(VisitCost 40.0))

([TravelRecommendationOnthology_Class10067] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class14])
	(SightName "Tranvia de Lisboa")
	(SightSituatedIn [TravelRecommendationOnthology_Class10039])
	(VisitCost 10.0))

([TravelRecommendationOnthology_Class10068] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class10034])
	(CityName "Londres")
	(DailyCost 100.0)
	(HasHotel
		[TravelRecommendationOnthology_Class10128]
		[TravelRecommendationOnthology_Class10144]
		[TravelRecommendationOnthology_Class10159])
	(HasSights
		[TravelRecommendationOnthology_Class10074]
		[TravelRecommendationOnthology_Class10075]
		[TravelRecommendationOnthology_Class10076])
	(TypeOfCity
		[TravelRecommendationOnthology_Class10022]
		[TravelRecommendationOnthology_Class10026]
		[TravelRecommendationOnthology_Class10030])
	(XCoord 52)
	(YCoord 0))

([TravelRecommendationOnthology_Class10069] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Castillo de San Jorge")
	(SightSituatedIn [TravelRecommendationOnthology_Class10039])
	(VisitCost 40.0))

([TravelRecommendationOnthology_Class10070] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Barrio Alto")
	(SightSituatedIn [TravelRecommendationOnthology_Class10039])
	(VisitCost 0.0))

([TravelRecommendationOnthology_Class10071] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Museo al Holocausto")
	(SightSituatedIn [TravelRecommendationOnthology_Class10040])
	(VisitCost 30.0))

([TravelRecommendationOnthology_Class10072] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Puerta de Brandenburgo")
	(SightSituatedIn [TravelRecommendationOnthology_Class10040])
	(VisitCost 0.0))

([TravelRecommendationOnthology_Class10073] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Bus turistico de Berlin")
	(SightSituatedIn [TravelRecommendationOnthology_Class10040])
	(VisitCost 30.0))

([TravelRecommendationOnthology_Class10074] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Museo Britanico")
	(SightSituatedIn [TravelRecommendationOnthology_Class10068])
	(VisitCost 100.0))

([TravelRecommendationOnthology_Class10075] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10034])
	(SightName "London Eye")
	(SightSituatedIn [TravelRecommendationOnthology_Class10068])
	(VisitCost 40.0))

([TravelRecommendationOnthology_Class10076] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Puente de la Torre")
	(SightSituatedIn [TravelRecommendationOnthology_Class10068])
	(VisitCost 60.0))

([TravelRecommendationOnthology_Class10077] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10015])
	(SightName "Jardin Ingles de Munich")
	(SightSituatedIn [TravelRecommendationOnthology_Class10041])
	(VisitCost 20.0))

([TravelRecommendationOnthology_Class10078] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Marienplatz (centro)")
	(SightSituatedIn [TravelRecommendationOnthology_Class10041])
	(VisitCost 0.0))

([TravelRecommendationOnthology_Class10079] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Cerveceria Hofbrauhaus")
	(SightSituatedIn [TravelRecommendationOnthology_Class10041])
	(VisitCost 70.0))

([TravelRecommendationOnthology_Class10080] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Gamla Stan (centro historico)")
	(SightSituatedIn [TravelRecommendationOnthology_Class10042])
	(VisitCost 0.0))

([TravelRecommendationOnthology_Class10081] of  Sight

	(Importance 1)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Museo Maritimo Vasa")
	(SightSituatedIn [TravelRecommendationOnthology_Class10042])
	(VisitCost 70.0))

([TravelRecommendationOnthology_Class10082] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class12])
	(SightName "Museo de ABBA")
	(SightSituatedIn [TravelRecommendationOnthology_Class10042])
	(VisitCost 90.0))

([TravelRecommendationOnthology_Class10083] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10017])
	(SightName "Aventura Trans-siberiana")
	(SightSituatedIn [TravelRecommendationOnthology_Class10043])
	(VisitCost 60.0))

([TravelRecommendationOnthology_Class10084] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Catedral de San Basilio")
	(SightSituatedIn [TravelRecommendationOnthology_Class10043])
	(VisitCost 40.0))

([TravelRecommendationOnthology_Class10085] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Plaza Roja")
	(SightSituatedIn [TravelRecommendationOnthology_Class10043])
	(VisitCost 0.0))

([TravelRecommendationOnthology_Class10086] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Paseo en barco por el tio Neva")
	(SightSituatedIn [TravelRecommendationOnthology_Class10044])
	(VisitCost 20.0))

([TravelRecommendationOnthology_Class10087] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Hermitage")
	(SightSituatedIn [TravelRecommendationOnthology_Class10044])
	(VisitCost 60.0))

([TravelRecommendationOnthology_Class10088] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class12])
	(SightName "Teatro Mariinski")
	(SightSituatedIn [TravelRecommendationOnthology_Class10044])
	(VisitCost 100.0))

([TravelRecommendationOnthology_Class10089] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Partenon")
	(SightSituatedIn [TravelRecommendationOnthology_Class10045])
	(VisitCost 40.0))

([TravelRecommendationOnthology_Class10090] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class11])
	(SightName "Estadio del Panathinaikos")
	(SightSituatedIn [TravelRecommendationOnthology_Class10045])
	(VisitCost 50.0))

([TravelRecommendationOnthology_Class10091] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Museo de la Acropolis")
	(SightSituatedIn [TravelRecommendationOnthology_Class10045])
	(VisitCost 30.0))

([TravelRecommendationOnthology_Class10092] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Basilica de Santa Sofia")
	(SightSituatedIn [TravelRecommendationOnthology_Class10046])
	(VisitCost 20.0))

([TravelRecommendationOnthology_Class10093] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Hipodromo")
	(SightSituatedIn [TravelRecommendationOnthology_Class10046])
	(VisitCost 10.0))

([TravelRecommendationOnthology_Class10094] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Museo de las Artes Turcas e Islamicas")
	(SightSituatedIn [TravelRecommendationOnthology_Class10046])
	(VisitCost 30.0))

([TravelRecommendationOnthology_Class10095] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10017])
	(SightName "Parque de atracciones Odaiba")
	(SightSituatedIn [TravelRecommendationOnthology_Class10047])
	(VisitCost 140.0))

([TravelRecommendationOnthology_Class10096] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10018])
	(SightName "Torre Tokyo Skytree")
	(SightSituatedIn [TravelRecommendationOnthology_Class10047])
	(VisitCost 90.0))

([TravelRecommendationOnthology_Class10097] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class14])
	(SightName "Tokyo DisneySea")
	(SightSituatedIn [TravelRecommendationOnthology_Class10047])
	(VisitCost 180.0))

([TravelRecommendationOnthology_Class10098] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10018])
	(SightName "China Zun Tower")
	(SightSituatedIn [TravelRecommendationOnthology_Class10048])
	(VisitCost 40.0))

([TravelRecommendationOnthology_Class10099] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10018])
	(SightName "Sede de CCTV")
	(SightSituatedIn [TravelRecommendationOnthology_Class10048])
	(VisitCost 20.0))

([TravelRecommendationOnthology_Class10100] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class11])
	(SightName "Estadio Olimpico de Pequin")
	(SightSituatedIn [TravelRecommendationOnthology_Class10048])
	(VisitCost 60.0))

([TravelRecommendationOnthology_Class10101] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10018])
	(SightName "Shanghai World Financial Center")
	(SightSituatedIn [TravelRecommendationOnthology_Class10049])
	(VisitCost 0.0))

([TravelRecommendationOnthology_Class10102] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Jardin Yuyuan")
	(SightSituatedIn [TravelRecommendationOnthology_Class10049])
	(VisitCost 60.0))

([TravelRecommendationOnthology_Class10103] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10018])
	(SightName "Torre Perla Oriental")
	(SightSituatedIn [TravelRecommendationOnthology_Class10049])
	(VisitCost 50.0))

([TravelRecommendationOnthology_Class10105] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class14])
	(SightName "Hong Kong Disneyland")
	(SightSituatedIn [TravelRecommendationOnthology_Class10050])
	(VisitCost 150.0))

([TravelRecommendationOnthology_Class10106] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class14])
	(SightName "Ocean Park de Hong Kong")
	(SightSituatedIn [TravelRecommendationOnthology_Class10050])
	(VisitCost 80.0))

([TravelRecommendationOnthology_Class10107] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10017])
	(SightName "Cumbre Victoria")
	(SightSituatedIn [TravelRecommendationOnthology_Class10050])
	(VisitCost 0.0))

([TravelRecommendationOnthology_Class10108] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class11])
	(SightName "Estadio Olimpico de Seul")
	(SightSituatedIn [TravelRecommendationOnthology_Class10051])
	(VisitCost 50.0))

([TravelRecommendationOnthology_Class10109] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Palacio de Gyeongbokgung")
	(SightSituatedIn [TravelRecommendationOnthology_Class10051])
	(VisitCost 80.0))

([TravelRecommendationOnthology_Class10110] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10034])
	(SightName "N Seoul Tower")
	(SightSituatedIn [TravelRecommendationOnthology_Class10051])
	(VisitCost 50.0))

([TravelRecommendationOnthology_Class10111] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Monumento a Jan Sobieski III")
	(SightSituatedIn [TravelRecommendationOnthology_Class10052])
	(VisitCost 0.0))

([TravelRecommendationOnthology_Class10112] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10018])
	(SightName "Universidad Tecnologica de Gdansk")
	(SightSituatedIn [TravelRecommendationOnthology_Class10052])
	(VisitCost 0.0))

([TravelRecommendationOnthology_Class10115] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10015])
	(SightName "Park Oliwski")
	(SightSituatedIn [TravelRecommendationOnthology_Class10052])
	(VisitCost 30.0))

([TravelRecommendationOnthology_Class10116] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Rascacielos Burj Khalifa")
	(SightSituatedIn [TravelRecommendationOnthology_Class10053])
	(VisitCost 60.0))

([TravelRecommendationOnthology_Class10117] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Dubai Mall")
	(SightSituatedIn [TravelRecommendationOnthology_Class10053])
	(VisitCost 0.0))

([TravelRecommendationOnthology_Class10118] of  Sight

	(Importance 1)
	(SightInterest [TravelRecommendationOnthology_Class11])
	(SightName "Kite Beach")
	(SightSituatedIn [TravelRecommendationOnthology_Class10053])
	(VisitCost 40.0))

([TravelRecommendationOnthology_Class10119] of  Hotel

	(CostByNight 100.0)
	(HotelName "Golden Paradise Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10032])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10120] of  Hotel

	(CostByNight 150.0)
	(HotelName "Exalted Square Hotel & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10032])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10121] of  Hotel

	(CostByNight 150.0)
	(HotelName "Olive Heritage Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10033])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10122] of  Hotel

	(CostByNight 50.0)
	(HotelName "Riverside Wolf Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10035])
	(HotelStars 1))

([TravelRecommendationOnthology_Class10123] of  Hotel

	(CostByNight 100.0)
	(HotelName "Bronze Cave Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10036])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10124] of  Hotel

	(CostByNight 200.0)
	(HotelName "Twin Sierra Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10039])
	(HotelStars 4))

([TravelRecommendationOnthology_Class10126] of  Hotel

	(CostByNight 50.0)
	(HotelName "Lunar Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10040])
	(HotelStars 1))

([TravelRecommendationOnthology_Class10127] of  Hotel

	(CostByNight 250.0)
	(HotelName "Coffee Hotel & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10033])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10128] of  Hotel

	(CostByNight 250.0)
	(HotelName "Yesteryear Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10068])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10129] of  Hotel

	(CostByNight 250.0)
	(HotelName "Blizzard Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10041])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10130] of  Hotel

	(CostByNight 150.0)
	(HotelName "Atlantis Temple Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10042])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10131] of  Hotel

	(CostByNight 50.0)
	(HotelName "Ancient Vista Resort & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10043])
	(HotelStars 1))

([TravelRecommendationOnthology_Class10132] of  Hotel

	(CostByNight 200.0)
	(HotelName "Western Grove Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10044])
	(HotelStars 4))

([TravelRecommendationOnthology_Class10133] of  Hotel

	(CostByNight 150.0)
	(HotelName "Pacific Lake Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10045])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10134] of  Hotel

	(CostByNight 100.0)
	(HotelName "Aquamarine Park Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10046])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10135] of  Hotel

	(CostByNight 200.0)
	(HotelName "Parallel Brook Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10047])
	(HotelStars 4))

([TravelRecommendationOnthology_Class10136] of  Hotel

	(CostByNight 250.0)
	(HotelName "Copper Hotel & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10035])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10137] of  Hotel

	(CostByNight 50.0)
	(HotelName "Ranch Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10048])
	(HotelStars 1))

([TravelRecommendationOnthology_Class10138] of  Hotel

	(CostByNight 100.0)
	(HotelName "Travel Resort & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10036])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10139] of  Hotel

	(CostByNight 250.0)
	(HotelName "Fairyland Hotel & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10039])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10140] of  Hotel

	(CostByNight 200.0)
	(HotelName "Snowy Memorial Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10049])
	(HotelStars 4))

([TravelRecommendationOnthology_Class10141] of  Hotel

	(CostByNight 100.0)
	(HotelName "Sunset Pastures Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10050])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10142] of  Hotel

	(CostByNight 150.0)
	(HotelName "Mellow Gorge Hotel & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10040])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10143] of  Hotel

	(CostByNight 100.0)
	(HotelName "Silver Emperor Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10051])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10144] of  Hotel

	(CostByNight 100.0)
	(HotelName "Sunrise Cove Resort & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10068])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10145] of  Hotel

	(CostByNight 200.0)
	(HotelName "Lord's Raven Hotel & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10041])
	(HotelStars 4))

([TravelRecommendationOnthology_Class10146] of  Hotel

	(CostByNight 100.0)
	(HotelName "Elegant Hotel & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10042])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10147] of  Hotel

	(CostByNight 150.0)
	(HotelName "Stardust Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10052])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10148] of  Hotel

	(CostByNight 150.0)
	(HotelName "Cozy Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10053])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10149] of  Hotel

	(CostByNight 200.0)
	(HotelName "Repose Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10032])
	(HotelStars 4))

([TravelRecommendationOnthology_Class10150] of  Hotel

	(CostByNight 200.0)
	(HotelName "City Memorial Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10033])
	(HotelStars 4))

([TravelRecommendationOnthology_Class10151] of  Hotel

	(CostByNight 50.0)
	(HotelName "Green Sunset Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10035])
	(HotelStars 1))

([TravelRecommendationOnthology_Class10152] of  Hotel

	(CostByNight 250.0)
	(HotelName "Mellow Saint Hotel & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10043])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10153] of  Hotel

	(CostByNight 150.0)
	(HotelName "Silver King Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10036])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10154] of  Hotel

	(CostByNight 100.0)
	(HotelName "Moon Resort & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10044])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10155] of  Hotel

	(CostByNight 200.0)
	(HotelName "Lord Knight Hotel & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10045])
	(HotelStars 4))

([TravelRecommendationOnthology_Class10156] of  Hotel

	(CostByNight 100.0)
	(HotelName "Classy Hotel & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10046])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10157] of  Hotel

	(CostByNight 250.0)
	(HotelName "Jupiter Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10039])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10158] of  Hotel

	(CostByNight 150.0)
	(HotelName "Kingdom Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10040])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10159] of  Hotel

	(CostByNight 250.0)
	(HotelName "May Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10068])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10160] of  Hotel

	(CostByNight 50.0)
	(HotelName "Antique Maple Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10041])
	(HotelStars 1))

([TravelRecommendationOnthology_Class10161] of  Hotel

	(CostByNight 250.0)
	(HotelName "Grandiose Peak Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10042])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10162] of  Hotel

	(CostByNight 200.0)
	(HotelName "Antique Cove Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10043])
	(HotelStars 4))

([TravelRecommendationOnthology_Class10163] of  Hotel

	(CostByNight 100.0)
	(HotelName "Malachite Emperor Resort & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10047])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10164] of  Hotel

	(CostByNight 100.0)
	(HotelName "Malachite Creek Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10044])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10165] of  Hotel

	(CostByNight 250.0)
	(HotelName "Remote Jewel Resort & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10048])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10166] of  Hotel

	(CostByNight 50.0)
	(HotelName "Troposphere Resort & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10049])
	(HotelStars 1))

([TravelRecommendationOnthology_Class10167] of  Hotel

	(CostByNight 150.0)
	(HotelName "Recreation Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10045])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10168] of  Hotel

	(CostByNight 50.0)
	(HotelName "Prism Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10046])
	(HotelStars 1))

([TravelRecommendationOnthology_Class10169] of  Hotel

	(CostByNight 200.0)
	(HotelName "Leisure Hotel & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10050])
	(HotelStars 4))

([TravelRecommendationOnthology_Class10170] of  Hotel

	(CostByNight 100.0)
	(HotelName "Pyramid Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10047])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10171] of  Hotel

	(CostByNight 200.0)
	(HotelName "Empire Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10048])
	(HotelStars 4))

([TravelRecommendationOnthology_Class10172] of  Hotel

	(CostByNight 150.0)
	(HotelName "Diamond Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10050])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10173] of  Hotel

	(CostByNight 150.0)
	(HotelName "Grandiose Rise Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10048])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10174] of  Hotel

	(CostByNight 50.0)
	(HotelName "Forest Resort & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10051])
	(HotelStars 1))

([TravelRecommendationOnthology_Class10175] of  Hotel

	(CostByNight 250.0)
	(HotelName "Remote Paradise Resort & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10052])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10176] of  Hotel

	(CostByNight 200.0)
	(HotelName "Stratosphere Resort & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10053])
	(HotelStars 4))

([TravelRecommendationOnthology_Class10177] of  Hotel

	(CostByNight 150.0)
	(HotelName "Genius Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10051])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10178] of  Hotel

	(CostByNight 150.0)
	(HotelName "Circle Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10052])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10179] of  Hotel

	(CostByNight 200.0)
	(HotelName "Enterprise Hotel & Spa")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10053])
	(HotelStars 4))

([TravelRecommendationOnthology_Class11] of  Interest

	(InterestCity
		[TravelRecommendationOnthology_Class10032]
		[TravelRecommendationOnthology_Class10036]
		[TravelRecommendationOnthology_Class10045]
		[TravelRecommendationOnthology_Class10048]
		[TravelRecommendationOnthology_Class10051]
		[TravelRecommendationOnthology_Class10053])
	(InterestSight
		[TravelRecommendationOnthology_Class10055]
		[TravelRecommendationOnthology_Class10064]
		[TravelRecommendationOnthology_Class10090]
		[TravelRecommendationOnthology_Class10100]
		[TravelRecommendationOnthology_Class10108]
		[TravelRecommendationOnthology_Class10118])
	(Kind deportivo))

([TravelRecommendationOnthology_Class12] of  Interest

	(InterestCity
		[TravelRecommendationOnthology_Class10032]
		[TravelRecommendationOnthology_Class10042]
		[TravelRecommendationOnthology_Class10044])
	(InterestSight
		[TravelRecommendationOnthology_Class10057]
		[TravelRecommendationOnthology_Class10082]
		[TravelRecommendationOnthology_Class10088])
	(Kind musical))

([TravelRecommendationOnthology_Class13] of  Interest

	(InterestCity
		[TravelRecommendationOnthology_Class10035]
		[TravelRecommendationOnthology_Class10039]
		[TravelRecommendationOnthology_Class10040]
		[TravelRecommendationOnthology_Class10041]
		[TravelRecommendationOnthology_Class10042]
		[TravelRecommendationOnthology_Class10045]
		[TravelRecommendationOnthology_Class10046]
		[TravelRecommendationOnthology_Class10052])
	(InterestSight
		[TravelRecommendationOnthology_Class10061]
		[TravelRecommendationOnthology_Class10069]
		[TravelRecommendationOnthology_Class10071]
		[TravelRecommendationOnthology_Class10072]
		[TravelRecommendationOnthology_Class10078]
		[TravelRecommendationOnthology_Class10080]
		[TravelRecommendationOnthology_Class10089]
		[TravelRecommendationOnthology_Class10093]
		[TravelRecommendationOnthology_Class10111])
	(Kind historico))

([TravelRecommendationOnthology_Class14] of  Interest

	(InterestCity
		[TravelRecommendationOnthology_Class10036]
		[TravelRecommendationOnthology_Class10039]
		[TravelRecommendationOnthology_Class10047]
		[TravelRecommendationOnthology_Class10050])
	(InterestSight
		[TravelRecommendationOnthology_Class10066]
		[TravelRecommendationOnthology_Class10097]
		[TravelRecommendationOnthology_Class10105]
		[TravelRecommendationOnthology_Class10106]
		[TravelRecommendationOnthology_Class10067])
	(Kind infantil))

([TravelRecommendationOnthology_Class3] of  Transport

	(Distance corta)
	(TransportName coche))

([TravelRecommendationOnthology_Class4] of  Transport

	(Distance media)
	(TransportName tren))

([TravelRecommendationOnthology_Class5] of  Transport

	(Distance larga)
	(TransportName avion))

([TravelRecommendationOnthology_Class6] of  Transport

	(Distance larga)
	(TransportName barco))

)





















































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
			; filter by score, stars or whatever? done below, in if
			(bind ?minPrice 10000)
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
				
				; Note: no sights yet!
			)
			; add prev-location for travels, maybe later on
		)
		; Here we should add a couple days to first city to get enough mindays, put in the next one if we exceed maxdaysincities
		; for now no sights ?
		(bind ?leftmindays (- ?mtd (* ?mc ?dc)))
		(bind ?i 1)
		(bind ?maximumAddition (- ?maxdc ?dc))
		(while (and (< ?i (length$ $?stays)) (> ?leftmindays 0)) do
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
		)
		(if (> ?leftmindays 0) ; TODO: check for > maxdays too!
		then
			(printout t "Impossible travel: Day restrictions make it impossible" crlf)
			(bind ?good FALSE)
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
	(printout t crlf "Sights and transport not implemented yet, sorry" crlf)
)


(defrule printmod::printer ""
	?f<-(travelRecomendation ?x)
	(travelers ?t)
	(not (oneDone))
	=>
	;(printout t "TEst") ; DEBUG
	(assert (oneDone))
	(Myprint ?x ?t)
	(printout t crlf "Building travel 2..." crlf)
	(retract ?f)
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
            ; only half the punishment
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
            (send ?curr-hot put-Score (- (send ?curr-hot get-Score) (* (- ?quality (send ?curr-hot get-HotelStars)) 10)))
            ; full punishment
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
