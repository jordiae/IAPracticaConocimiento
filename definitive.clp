; Sun May 27 00:06:39 CEST 2018
; 
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot DailyCost
		(type FLOAT)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot inverse_of_cityTypeCity
		(type INSTANCE)
;+		(allowed-classes)
		(create-accessor read-write))
	(single-slot Days
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Distance
		(type SYMBOL)
		(allowed-values corta media larga)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot CityInterests
		(type INSTANCE)
;+		(allowed-classes Interest)
		(cardinality 1 5)
;+		(inverse-slot InterestCity)
		(create-accessor read-write))
	(single-slot SightName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot HasSights
		(type INSTANCE)
;+		(allowed-classes Sight)
;+		(inverse-slot SightSituatedIn)
		(create-accessor read-write))
	(single-slot TransportName
		(type SYMBOL)
		(allowed-values avion barco tren coche)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot CityName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot SightSituatedIn
		(type INSTANCE)
;+		(allowed-classes City)
;+		(cardinality 1 1)
;+		(inverse-slot HasSights)
		(create-accessor read-write))
	(multislot TravelTransports
		(type INSTANCE)
;+		(allowed-classes Transport)
		(create-accessor read-write))
	(single-slot CostByNight
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot HotelName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot CityTypeCities
		(type INSTANCE)
;+		(allowed-classes City)
;+		(inverse-slot TypeOfCity)
		(create-accessor read-write))
	(multislot TypeOfCity
		(type INSTANCE)
;+		(allowed-classes)
		(cardinality 1 5)
;+		(inverse-slot CityTypeCities)
		(create-accessor read-write))
	(single-slot XCoord
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot HotelSituatedIn
		(type INSTANCE)
;+		(allowed-classes City)
;+		(cardinality 1 1)
;+		(inverse-slot HasHotel)
		(create-accessor read-write))
	(single-slot BaseCost
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot InterestCity
		(type INSTANCE)
;+		(allowed-classes City)
;+		(inverse-slot CityInterests)
		(create-accessor read-write))
	(single-slot VisitCost
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot HasHotel
		(type INSTANCE)
;+		(allowed-classes Hotel)
;+		(inverse-slot HotelSituatedIn)
		(create-accessor read-write))
	(multislot Stays
		(type INSTANCE)
;+		(allowed-classes Stay)
		(create-accessor read-write))
	(multislot SightInterest
		(type INSTANCE)
;+		(allowed-classes Interest)
		(cardinality 1 5)
;+		(inverse-slot InterestSight)
		(create-accessor read-write))
	(single-slot StayHotel
		(type INSTANCE)
;+		(allowed-classes Hotel)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot CityTypes
		(type INSTANCE)
;+		(allowed-classes)
		(cardinality 1 5)
;+		(inverse-slot CityCityType)
		(create-accessor read-write))
	(multislot StaySights
		(type INSTANCE)
;+		(allowed-classes Sight)
		(create-accessor read-write))
	(single-slot YCoord
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot HotelStars
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot TypeName
		(type SYMBOL)
		(allowed-values mediterranea rascacielos nordica superpoblada industrial maritima fria con_casco_historico asiatica verde)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Kind
		(type SYMBOL)
		(allowed-values romantico cultural deportivo musical historico infantil naturaleza relax aventura tecnologico)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot InterestSight
		(type INSTANCE)
;+		(allowed-classes Sight)
;+		(inverse-slot SightInterest)
		(create-accessor read-write))
	(single-slot StayCity
		(type INSTANCE)
;+		(allowed-classes City)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Importance
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Score
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot CityCityType
		(type INSTANCE)
;+		(allowed-classes City)
;+		(inverse-slot CityTypes)
		(create-accessor read-write)))

(defclass Interest
	(is-a USER)
	(role concrete)
	(single-slot Kind
		(type SYMBOL)
		(allowed-values romantico cultural deportivo musical historico infantil naturaleza relax aventura tecnologico)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot InterestSight
		(type INSTANCE)
;+		(allowed-classes Sight)
		(create-accessor read-write))
	(multislot InterestCity
		(type INSTANCE)
;+		(allowed-classes City)
		(create-accessor read-write)))

(defclass City
	(is-a USER)
	(role concrete)
	(single-slot YCoord
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot CityInterests
		(type INSTANCE)
;+		(allowed-classes Interest)
		(cardinality 1 5)
		(create-accessor read-write))
	(multislot HasSights
		(type INSTANCE)
;+		(allowed-classes Sight)
		(create-accessor read-write))
	(single-slot XCoord
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot CityName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot HasHotel
		(type INSTANCE)
;+		(allowed-classes Hotel)
		(create-accessor read-write))
	(single-slot Score
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Hotel
	(is-a USER)
	(role concrete)
	(single-slot HotelStars
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot HotelName
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot HotelSituatedIn
		(type INSTANCE)
;+		(allowed-classes City)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot CostByNight
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Score
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Sight
	(is-a USER)
	(role concrete)
	(single-slot SightName
		(type STRING)
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
	(multislot SightInterest
		(type INSTANCE)
;+		(allowed-classes Interest)
		(cardinality 1 5)
		(create-accessor read-write))
	(single-slot Score
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Transport
	(is-a USER)
	(role concrete)
	(single-slot TransportName
		(type SYMBOL)
		(allowed-values avion barco tren coche)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot BaseCost
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Distance
		(type SYMBOL)
		(allowed-values corta media larga)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Travel
	(is-a USER)
	(role concrete)
	(multislot Stays
		(type INSTANCE)
;+		(allowed-classes Stay)
		(create-accessor read-write))
	(multislot TravelTransports
		(type INSTANCE)
;+		(allowed-classes Transport)
		(create-accessor read-write)))

(defclass Stay
	(is-a USER)
	(role concrete)
	(single-slot Days
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot StayHotel
		(type INSTANCE)
;+		(allowed-classes Hotel)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot StaySights
		(type INSTANCE)
;+		(allowed-classes Sight)
		(create-accessor read-write))
	(single-slot StayCity
		(type INSTANCE)
;+		(allowed-classes City)
;+		(cardinality 1 1)
		(create-accessor read-write)))


(definstances instances
; Sun May 27 00:06:39 CEST 2018
; 
;+ (version "3.5")
;+ (build "Build 663")

([TravelRecommendationOnthology_Class0] of  Hotel

	(CostByNight 250.0)
	(HotelName "Fairfield Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10032])
	(HotelStars 5))

([TravelRecommendationOnthology_Class1] of  Hotel

	(CostByNight 50.0)
	(HotelName "Columbia Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10033])
	(HotelStars 1))

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
		[TravelRecommendationOnthology_Class10068]
		[TravelRecommendationOnthology_Class10048])
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
		[TravelRecommendationOnthology_Class10109]
		[TravelRecommendationOnthology_Class10000]
		[TravelRecommendationOnthology_Class10001]
		[TravelRecommendationOnthology_Class20003]
		[TravelRecommendationOnthology_Class20006]
		[TravelRecommendationOnthology_Class20009]
		[TravelRecommendationOnthology_Class20010]
		[TravelRecommendationOnthology_Class20012]
		[TravelRecommendationOnthology_Class20014]
		[TravelRecommendationOnthology_Class30015]
		[TravelRecommendationOnthology_Class30017])
	(Kind cultural))

([TravelRecommendationOnthology_Class10000] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Universitat de Barcelona")
	(SightSituatedIn [TravelRecommendationOnthology_Class10032]))

([TravelRecommendationOnthology_Class10001] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Campos Eliseos")
	(SightSituatedIn [TravelRecommendationOnthology_Class10033]))

([TravelRecommendationOnthology_Class10002] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Circo Maximo")
	(SightSituatedIn [TravelRecommendationOnthology_Class10035]))

([TravelRecommendationOnthology_Class10003] of  Hotel

	(CostByNight 250.0)
	(HotelName "Millenium Residence")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10036])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10004] of  Hotel

	(CostByNight 50.0)
	(HotelName "Square Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10039])
	(HotelStars 1))

([TravelRecommendationOnthology_Class10005] of  Hotel

	(CostByNight 50.0)
	(HotelName "Immer Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10039])
	(HotelStars 1))

([TravelRecommendationOnthology_Class10006] of  Hotel

	(CostByNight 100.0)
	(HotelName "Queen's Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10068])
	(HotelStars 2))

([TravelRecommendationOnthology_Class10007] of  Hotel

	(CostByNight 150.0)
	(HotelName "The Castle Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10041])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10008] of  Hotel

	(CostByNight 200.0)
	(HotelName "Hilton Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10042])
	(HotelStars 4))

([TravelRecommendationOnthology_Class10010] of  Hotel

	(CostByNight 150.0)
	(HotelName "Da House")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10043])
	(HotelStars 3))

([TravelRecommendationOnthology_Class10011] of  Hotel

	(CostByNight 250.0)
	(HotelName "My Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10044])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10012] of  Hotel

	(CostByNight 250.0)
	(HotelName "Lampard Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10045])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10013] of  Hotel

	(CostByNight 250.0)
	(HotelName "Mary Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10046])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10014] of  Hotel

	(CostByNight 250.0)
	(HotelName "Heritance Palace Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10047])
	(HotelStars 5))

([TravelRecommendationOnthology_Class10015] of  Interest

	(InterestCity
		[TravelRecommendationOnthology_Class10033]
		[TravelRecommendationOnthology_Class10041]
		[TravelRecommendationOnthology_Class10052])
	(InterestSight
		[TravelRecommendationOnthology_Class10060]
		[TravelRecommendationOnthology_Class10077]
		[TravelRecommendationOnthology_Class10115]
		[TravelRecommendationOnthology_Class20007])
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
		[TravelRecommendationOnthology_Class10117]
		[TravelRecommendationOnthology_Class20004]
		[TravelRecommendationOnthology_Class30018])
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
		[TravelRecommendationOnthology_Class10107]
		[TravelRecommendationOnthology_Class30016])
	(Kind aventura))

([TravelRecommendationOnthology_Class10018] of  Interest

	(InterestCity
		[TravelRecommendationOnthology_Class10047]
		[TravelRecommendationOnthology_Class10049]
		[TravelRecommendationOnthology_Class10052]
		[TravelRecommendationOnthology_Class10048])
	(InterestSight
		[TravelRecommendationOnthology_Class10096]
		[TravelRecommendationOnthology_Class10098]
		[TravelRecommendationOnthology_Class10099]
		[TravelRecommendationOnthology_Class10101]
		[TravelRecommendationOnthology_Class10103]
		[TravelRecommendationOnthology_Class10112]
		[TravelRecommendationOnthology_Class20013])
	(Kind tecnologico))

([TravelRecommendationOnthology_Class10032] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class11]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class12])
	(CityName "Barcelona")
	(HasHotel
		[TravelRecommendationOnthology_Class10119]
		[TravelRecommendationOnthology_Class10120]
		[TravelRecommendationOnthology_Class10149]
		[TravelRecommendationOnthology_Class0])
	(HasSights
		[TravelRecommendationOnthology_Class10055]
		[TravelRecommendationOnthology_Class10056]
		[TravelRecommendationOnthology_Class10057]
		[TravelRecommendationOnthology_Class10000])
	(XCoord 41)
	(YCoord 2))

([TravelRecommendationOnthology_Class10033] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10034]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class10015])
	(CityName "Paris")
	(HasHotel
		[TravelRecommendationOnthology_Class10121]
		[TravelRecommendationOnthology_Class10127]
		[TravelRecommendationOnthology_Class10150]
		[TravelRecommendationOnthology_Class1])
	(HasSights
		[TravelRecommendationOnthology_Class10058]
		[TravelRecommendationOnthology_Class10059]
		[TravelRecommendationOnthology_Class10060]
		[TravelRecommendationOnthology_Class10001])
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
	(HasHotel
		[TravelRecommendationOnthology_Class10122]
		[TravelRecommendationOnthology_Class10136]
		[TravelRecommendationOnthology_Class10151]
		[TravelRecommendationOnthology_Class2])
	(HasSights
		[TravelRecommendationOnthology_Class10061]
		[TravelRecommendationOnthology_Class10062]
		[TravelRecommendationOnthology_Class10063]
		[TravelRecommendationOnthology_Class10002])
	(XCoord 41)
	(YCoord 12))

([TravelRecommendationOnthology_Class10036] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class11]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class14])
	(CityName "Madrid")
	(HasHotel
		[TravelRecommendationOnthology_Class10123]
		[TravelRecommendationOnthology_Class10138]
		[TravelRecommendationOnthology_Class10153]
		[TravelRecommendationOnthology_Class10003])
	(HasSights
		[TravelRecommendationOnthology_Class10064]
		[TravelRecommendationOnthology_Class10065]
		[TravelRecommendationOnthology_Class10066]
		[TravelRecommendationOnthology_Class20003])
	(XCoord 40)
	(YCoord -4))

([TravelRecommendationOnthology_Class10039] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class14]
		[TravelRecommendationOnthology_Class13]
		[TravelRecommendationOnthology_Class10016])
	(CityName "Lisboa")
	(HasHotel
		[TravelRecommendationOnthology_Class10124]
		[TravelRecommendationOnthology_Class10139]
		[TravelRecommendationOnthology_Class10157]
		[TravelRecommendationOnthology_Class10004]
		[TravelRecommendationOnthology_Class10005])
	(HasSights
		[TravelRecommendationOnthology_Class10067]
		[TravelRecommendationOnthology_Class10069]
		[TravelRecommendationOnthology_Class10070]
		[TravelRecommendationOnthology_Class20004])
	(XCoord 39)
	(YCoord -9))

([TravelRecommendationOnthology_Class10040] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class13]
		[TravelRecommendationOnthology_Class10016])
	(CityName "Berlin")
	(HasHotel
		[TravelRecommendationOnthology_Class10126]
		[TravelRecommendationOnthology_Class10142]
		[TravelRecommendationOnthology_Class10158])
	(HasSights
		[TravelRecommendationOnthology_Class10071]
		[TravelRecommendationOnthology_Class10072]
		[TravelRecommendationOnthology_Class10073]
		[TravelRecommendationOnthology_Class20005])
	(XCoord 53)
	(YCoord 13))

([TravelRecommendationOnthology_Class10041] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10015]
		[TravelRecommendationOnthology_Class13]
		[TravelRecommendationOnthology_Class10016])
	(CityName "Munich")
	(HasHotel
		[TravelRecommendationOnthology_Class10129]
		[TravelRecommendationOnthology_Class10145]
		[TravelRecommendationOnthology_Class10160]
		[TravelRecommendationOnthology_Class10007])
	(HasSights
		[TravelRecommendationOnthology_Class10077]
		[TravelRecommendationOnthology_Class10078]
		[TravelRecommendationOnthology_Class10079]
		[TravelRecommendationOnthology_Class20007])
	(XCoord 48)
	(YCoord 12))

([TravelRecommendationOnthology_Class10042] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class13]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class12])
	(CityName "Estocolmo")
	(HasHotel
		[TravelRecommendationOnthology_Class10130]
		[TravelRecommendationOnthology_Class10146]
		[TravelRecommendationOnthology_Class10161]
		[TravelRecommendationOnthology_Class10008])
	(HasSights
		[TravelRecommendationOnthology_Class10080]
		[TravelRecommendationOnthology_Class10081]
		[TravelRecommendationOnthology_Class10082]
		[TravelRecommendationOnthology_Class20008])
	(XCoord 59)
	(YCoord 18))

([TravelRecommendationOnthology_Class10043] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10017]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class10016])
	(CityName "Moscu")
	(HasHotel
		[TravelRecommendationOnthology_Class10131]
		[TravelRecommendationOnthology_Class10152]
		[TravelRecommendationOnthology_Class10162]
		[TravelRecommendationOnthology_Class10010])
	(HasSights
		[TravelRecommendationOnthology_Class10083]
		[TravelRecommendationOnthology_Class10084]
		[TravelRecommendationOnthology_Class10085]
		[TravelRecommendationOnthology_Class20009])
	(XCoord 56)
	(YCoord 38))

([TravelRecommendationOnthology_Class10044] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10016]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class12])
	(CityName "San Petersburgo")
	(HasHotel
		[TravelRecommendationOnthology_Class10132]
		[TravelRecommendationOnthology_Class10154]
		[TravelRecommendationOnthology_Class10164]
		[TravelRecommendationOnthology_Class10011])
	(HasSights
		[TravelRecommendationOnthology_Class10086]
		[TravelRecommendationOnthology_Class10087]
		[TravelRecommendationOnthology_Class10088]
		[TravelRecommendationOnthology_Class20010])
	(XCoord 60)
	(YCoord 30))

([TravelRecommendationOnthology_Class10045] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class13]
		[TravelRecommendationOnthology_Class11]
		[TravelRecommendationOnthology_Class10])
	(CityName "Atenas")
	(HasHotel
		[TravelRecommendationOnthology_Class10133]
		[TravelRecommendationOnthology_Class10155]
		[TravelRecommendationOnthology_Class10167]
		[TravelRecommendationOnthology_Class10012])
	(HasSights
		[TravelRecommendationOnthology_Class10089]
		[TravelRecommendationOnthology_Class10090]
		[TravelRecommendationOnthology_Class10091]
		[TravelRecommendationOnthology_Class20011])
	(XCoord 38)
	(YCoord 24))

([TravelRecommendationOnthology_Class10046] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class13])
	(CityName "Estambul")
	(HasHotel
		[TravelRecommendationOnthology_Class10134]
		[TravelRecommendationOnthology_Class10156]
		[TravelRecommendationOnthology_Class10168]
		[TravelRecommendationOnthology_Class10013])
	(HasSights
		[TravelRecommendationOnthology_Class10092]
		[TravelRecommendationOnthology_Class10093]
		[TravelRecommendationOnthology_Class10094]
		[TravelRecommendationOnthology_Class20012])
	(XCoord 41)
	(YCoord 29))

([TravelRecommendationOnthology_Class10047] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10017]
		[TravelRecommendationOnthology_Class10018]
		[TravelRecommendationOnthology_Class14])
	(CityName "Tokyo")
	(HasHotel
		[TravelRecommendationOnthology_Class10135]
		[TravelRecommendationOnthology_Class10163]
		[TravelRecommendationOnthology_Class10170]
		[TravelRecommendationOnthology_Class10014])
	(HasSights
		[TravelRecommendationOnthology_Class10095]
		[TravelRecommendationOnthology_Class10096]
		[TravelRecommendationOnthology_Class10097]
		[TravelRecommendationOnthology_Class20013])
	(XCoord 36)
	(YCoord 140))

([TravelRecommendationOnthology_Class10048] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10018]
		[TravelRecommendationOnthology_Class11]
		[TravelRecommendationOnthology_Class10])
	(CityName "Pequin")
	(HasHotel
		[TravelRecommendationOnthology_Class10137]
		[TravelRecommendationOnthology_Class10165]
		[TravelRecommendationOnthology_Class10171]
		[TravelRecommendationOnthology_Class10173]
		[TravelRecommendationOnthology_Class20015])
	(HasSights
		[TravelRecommendationOnthology_Class10098]
		[TravelRecommendationOnthology_Class10099]
		[TravelRecommendationOnthology_Class10100]
		[TravelRecommendationOnthology_Class20014])
	(XCoord 40)
	(YCoord 116))

([TravelRecommendationOnthology_Class10049] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10018]
		[TravelRecommendationOnthology_Class10])
	(CityName "Shangai")
	(HasHotel
		[TravelRecommendationOnthology_Class10140]
		[TravelRecommendationOnthology_Class10166]
		[TravelRecommendationOnthology_Class20016])
	(HasSights
		[TravelRecommendationOnthology_Class10101]
		[TravelRecommendationOnthology_Class10102]
		[TravelRecommendationOnthology_Class10103]
		[TravelRecommendationOnthology_Class30015])
	(XCoord 31)
	(YCoord 122))

([TravelRecommendationOnthology_Class10050] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class14]
		[TravelRecommendationOnthology_Class10017])
	(CityName "Hong Kong")
	(HasHotel
		[TravelRecommendationOnthology_Class10141]
		[TravelRecommendationOnthology_Class10169]
		[TravelRecommendationOnthology_Class10172]
		[TravelRecommendationOnthology_Class20017])
	(HasSights
		[TravelRecommendationOnthology_Class10105]
		[TravelRecommendationOnthology_Class10106]
		[TravelRecommendationOnthology_Class10107]
		[TravelRecommendationOnthology_Class30016])
	(XCoord 22)
	(YCoord 114))

([TravelRecommendationOnthology_Class10051] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class11]
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class10034])
	(CityName "Seul")
	(HasHotel
		[TravelRecommendationOnthology_Class10143]
		[TravelRecommendationOnthology_Class10174]
		[TravelRecommendationOnthology_Class10177]
		[TravelRecommendationOnthology_Class20018])
	(HasSights
		[TravelRecommendationOnthology_Class10108]
		[TravelRecommendationOnthology_Class10109]
		[TravelRecommendationOnthology_Class10110]
		[TravelRecommendationOnthology_Class30017])
	(XCoord 38)
	(YCoord 127))

([TravelRecommendationOnthology_Class10052] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class13]
		[TravelRecommendationOnthology_Class10018]
		[TravelRecommendationOnthology_Class10015])
	(CityName "Gdansk")
	(HasHotel
		[TravelRecommendationOnthology_Class10147]
		[TravelRecommendationOnthology_Class10175]
		[TravelRecommendationOnthology_Class10178]
		[TravelRecommendationOnthology_Class20019])
	(HasSights
		[TravelRecommendationOnthology_Class10111]
		[TravelRecommendationOnthology_Class10112]
		[TravelRecommendationOnthology_Class10115]
		[TravelRecommendationOnthology_Class30019])
	(XCoord 54)
	(YCoord 19))

([TravelRecommendationOnthology_Class10053] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10016]
		[TravelRecommendationOnthology_Class11])
	(CityName "Dubai")
	(HasHotel
		[TravelRecommendationOnthology_Class10148]
		[TravelRecommendationOnthology_Class10176]
		[TravelRecommendationOnthology_Class10179]
		[TravelRecommendationOnthology_Class20020])
	(HasSights
		[TravelRecommendationOnthology_Class10116]
		[TravelRecommendationOnthology_Class10117]
		[TravelRecommendationOnthology_Class10118]
		[TravelRecommendationOnthology_Class30018])
	(XCoord 25)
	(YCoord 55))

([TravelRecommendationOnthology_Class10055] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class11])
	(SightName "Camp Nou")
	(SightSituatedIn [TravelRecommendationOnthology_Class10032]))

([TravelRecommendationOnthology_Class10056] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Sagrada Familia")
	(SightSituatedIn [TravelRecommendationOnthology_Class10032]))

([TravelRecommendationOnthology_Class10057] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class12])
	(SightName "Palau de la Musica")
	(SightSituatedIn [TravelRecommendationOnthology_Class10032]))

([TravelRecommendationOnthology_Class10058] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10034])
	(SightName "Torre Eiffel")
	(SightSituatedIn [TravelRecommendationOnthology_Class10033]))

([TravelRecommendationOnthology_Class10059] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Louvre")
	(SightSituatedIn [TravelRecommendationOnthology_Class10033]))

([TravelRecommendationOnthology_Class10060] of  Sight

	(Importance 1)
	(SightInterest [TravelRecommendationOnthology_Class10015])
	(SightName "Parque de Belleville")
	(SightSituatedIn [TravelRecommendationOnthology_Class10033]))

([TravelRecommendationOnthology_Class10061] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Coliseo")
	(SightSituatedIn [TravelRecommendationOnthology_Class10035]))

([TravelRecommendationOnthology_Class10062] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10017])
	(SightName "Roma Subterranea")
	(SightSituatedIn [TravelRecommendationOnthology_Class10035]))

([TravelRecommendationOnthology_Class10063] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10034])
	(SightName "Centro Roma")
	(SightSituatedIn [TravelRecommendationOnthology_Class10035]))

([TravelRecommendationOnthology_Class10064] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class11])
	(SightName "Estadio Santiago Bernabeu")
	(SightSituatedIn [TravelRecommendationOnthology_Class10036]))

([TravelRecommendationOnthology_Class10065] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Museo El Prado")
	(SightSituatedIn [TravelRecommendationOnthology_Class10036]))

([TravelRecommendationOnthology_Class10066] of  Sight

	(Importance 1)
	(SightInterest [TravelRecommendationOnthology_Class14])
	(SightName "Teleferico de Madrid")
	(SightSituatedIn [TravelRecommendationOnthology_Class10036]))

([TravelRecommendationOnthology_Class10067] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class14])
	(SightName "Tranvia de Lisboa")
	(SightSituatedIn [TravelRecommendationOnthology_Class10039]))

([TravelRecommendationOnthology_Class10068] of  City

	(CityInterests
		[TravelRecommendationOnthology_Class10]
		[TravelRecommendationOnthology_Class10034])
	(CityName "Londres")
	(HasHotel
		[TravelRecommendationOnthology_Class10128]
		[TravelRecommendationOnthology_Class10144]
		[TravelRecommendationOnthology_Class10159]
		[TravelRecommendationOnthology_Class10006])
	(HasSights
		[TravelRecommendationOnthology_Class10074]
		[TravelRecommendationOnthology_Class10075]
		[TravelRecommendationOnthology_Class10076]
		[TravelRecommendationOnthology_Class20006])
	(XCoord 52)
	(YCoord 0))

([TravelRecommendationOnthology_Class10069] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Castillo de San Jorge")
	(SightSituatedIn [TravelRecommendationOnthology_Class10039]))

([TravelRecommendationOnthology_Class10070] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Barrio Alto")
	(SightSituatedIn [TravelRecommendationOnthology_Class10039]))

([TravelRecommendationOnthology_Class10071] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Museo al Holocausto")
	(SightSituatedIn [TravelRecommendationOnthology_Class10040]))

([TravelRecommendationOnthology_Class10072] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Puerta de Brandenburgo")
	(SightSituatedIn [TravelRecommendationOnthology_Class10040]))

([TravelRecommendationOnthology_Class10073] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Bus turistico de Berlin")
	(SightSituatedIn [TravelRecommendationOnthology_Class10040]))

([TravelRecommendationOnthology_Class10074] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Museo Britanico")
	(SightSituatedIn [TravelRecommendationOnthology_Class10068]))

([TravelRecommendationOnthology_Class10075] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10034])
	(SightName "London Eye")
	(SightSituatedIn [TravelRecommendationOnthology_Class10068]))

([TravelRecommendationOnthology_Class10076] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Puente de la Torre")
	(SightSituatedIn [TravelRecommendationOnthology_Class10068]))

([TravelRecommendationOnthology_Class10077] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10015])
	(SightName "Jardin Ingles de Munich")
	(SightSituatedIn [TravelRecommendationOnthology_Class10041]))

([TravelRecommendationOnthology_Class10078] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Marienplatz (centro)")
	(SightSituatedIn [TravelRecommendationOnthology_Class10041]))

([TravelRecommendationOnthology_Class10079] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Cerveceria Hofbrauhaus")
	(SightSituatedIn [TravelRecommendationOnthology_Class10041]))

([TravelRecommendationOnthology_Class10080] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Gamla Stan (centro historico)")
	(SightSituatedIn [TravelRecommendationOnthology_Class10042]))

([TravelRecommendationOnthology_Class10081] of  Sight

	(Importance 1)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Museo Maritimo Vasa")
	(SightSituatedIn [TravelRecommendationOnthology_Class10042]))

([TravelRecommendationOnthology_Class10082] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class12])
	(SightName "Museo de ABBA")
	(SightSituatedIn [TravelRecommendationOnthology_Class10042]))

([TravelRecommendationOnthology_Class10083] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10017])
	(SightName "Aventura Trans-siberiana")
	(SightSituatedIn [TravelRecommendationOnthology_Class10043]))

([TravelRecommendationOnthology_Class10084] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Catedral de San Basilio")
	(SightSituatedIn [TravelRecommendationOnthology_Class10043]))

([TravelRecommendationOnthology_Class10085] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Plaza Roja")
	(SightSituatedIn [TravelRecommendationOnthology_Class10043]))

([TravelRecommendationOnthology_Class10086] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Paseo en barco por el tio Neva")
	(SightSituatedIn [TravelRecommendationOnthology_Class10044]))

([TravelRecommendationOnthology_Class10087] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Hermitage")
	(SightSituatedIn [TravelRecommendationOnthology_Class10044]))

([TravelRecommendationOnthology_Class10088] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class12])
	(SightName "Teatro Mariinski")
	(SightSituatedIn [TravelRecommendationOnthology_Class10044]))

([TravelRecommendationOnthology_Class10089] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Partenon")
	(SightSituatedIn [TravelRecommendationOnthology_Class10045]))

([TravelRecommendationOnthology_Class10090] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class11])
	(SightName "Estadio del Panathinaikos")
	(SightSituatedIn [TravelRecommendationOnthology_Class10045]))

([TravelRecommendationOnthology_Class10091] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Museo de la Acropolis")
	(SightSituatedIn [TravelRecommendationOnthology_Class10045]))

([TravelRecommendationOnthology_Class10092] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Basilica de Santa Sofia")
	(SightSituatedIn [TravelRecommendationOnthology_Class10046]))

([TravelRecommendationOnthology_Class10093] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Hipodromo")
	(SightSituatedIn [TravelRecommendationOnthology_Class10046]))

([TravelRecommendationOnthology_Class10094] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Museo de las Artes Turcas e Islamicas")
	(SightSituatedIn [TravelRecommendationOnthology_Class10046]))

([TravelRecommendationOnthology_Class10095] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10017])
	(SightName "Parque de atracciones Odaiba")
	(SightSituatedIn [TravelRecommendationOnthology_Class10047]))

([TravelRecommendationOnthology_Class10096] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10018])
	(SightName "Torre Tokyo Skytree")
	(SightSituatedIn [TravelRecommendationOnthology_Class10047]))

([TravelRecommendationOnthology_Class10097] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class14])
	(SightName "Tokyo DisneySea")
	(SightSituatedIn [TravelRecommendationOnthology_Class10047]))

([TravelRecommendationOnthology_Class10098] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10018])
	(SightName "China Zun Tower")
	(SightSituatedIn [TravelRecommendationOnthology_Class10048]))

([TravelRecommendationOnthology_Class10099] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10018])
	(SightName "Sede de CCTV")
	(SightSituatedIn [TravelRecommendationOnthology_Class10048]))

([TravelRecommendationOnthology_Class10100] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class11])
	(SightName "Estadio Olimpico de Pequin")
	(SightSituatedIn [TravelRecommendationOnthology_Class10048]))

([TravelRecommendationOnthology_Class10101] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10018])
	(SightName "Shanghai World Financial Center")
	(SightSituatedIn [TravelRecommendationOnthology_Class10049]))

([TravelRecommendationOnthology_Class10102] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Jardin Yuyuan")
	(SightSituatedIn [TravelRecommendationOnthology_Class10049]))

([TravelRecommendationOnthology_Class10103] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10018])
	(SightName "Torre Perla Oriental")
	(SightSituatedIn [TravelRecommendationOnthology_Class10049]))

([TravelRecommendationOnthology_Class10105] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class14])
	(SightName "Hong Kong Disneyland")
	(SightSituatedIn [TravelRecommendationOnthology_Class10050]))

([TravelRecommendationOnthology_Class10106] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class14])
	(SightName "Ocean Park de Hong Kong")
	(SightSituatedIn [TravelRecommendationOnthology_Class10050]))

([TravelRecommendationOnthology_Class10107] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10017])
	(SightName "Cumbre Victoria")
	(SightSituatedIn [TravelRecommendationOnthology_Class10050]))

([TravelRecommendationOnthology_Class10108] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class11])
	(SightName "Estadio Olimpico de Seul")
	(SightSituatedIn [TravelRecommendationOnthology_Class10051]))

([TravelRecommendationOnthology_Class10109] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Palacio de Gyeongbokgung")
	(SightSituatedIn [TravelRecommendationOnthology_Class10051]))

([TravelRecommendationOnthology_Class10110] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10034])
	(SightName "N Seoul Tower")
	(SightSituatedIn [TravelRecommendationOnthology_Class10051]))

([TravelRecommendationOnthology_Class10111] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Monumento a Jan Sobieski III")
	(SightSituatedIn [TravelRecommendationOnthology_Class10052]))

([TravelRecommendationOnthology_Class10112] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10018])
	(SightName "Universidad Tecnologica de Gdansk")
	(SightSituatedIn [TravelRecommendationOnthology_Class10052]))

([TravelRecommendationOnthology_Class10115] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10015])
	(SightName "Park Oliwski")
	(SightSituatedIn [TravelRecommendationOnthology_Class10052]))

([TravelRecommendationOnthology_Class10116] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Rascacielos Burj Khalifa")
	(SightSituatedIn [TravelRecommendationOnthology_Class10053]))

([TravelRecommendationOnthology_Class10117] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Dubai Mall")
	(SightSituatedIn [TravelRecommendationOnthology_Class10053]))

([TravelRecommendationOnthology_Class10118] of  Sight

	(Importance 1)
	(SightInterest [TravelRecommendationOnthology_Class11])
	(SightName "Kite Beach")
	(SightSituatedIn [TravelRecommendationOnthology_Class10053]))

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
		[TravelRecommendationOnthology_Class10051]
		[TravelRecommendationOnthology_Class10053]
		[TravelRecommendationOnthology_Class10048])
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
		[TravelRecommendationOnthology_Class10111]
		[TravelRecommendationOnthology_Class10002]
		[TravelRecommendationOnthology_Class20005]
		[TravelRecommendationOnthology_Class20008]
		[TravelRecommendationOnthology_Class20011]
		[TravelRecommendationOnthology_Class30019])
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

([TravelRecommendationOnthology_Class2] of  Hotel

	(CostByNight 100.0)
	(HotelName "Prince Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10035])
	(HotelStars 2))

([TravelRecommendationOnthology_Class20003] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Plaza del Sol")
	(SightSituatedIn [TravelRecommendationOnthology_Class10036]))

([TravelRecommendationOnthology_Class20004] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Centro de Lisboa")
	(SightSituatedIn [TravelRecommendationOnthology_Class10039]))

([TravelRecommendationOnthology_Class20005] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Bundestag")
	(SightSituatedIn [TravelRecommendationOnthology_Class10040]))

([TravelRecommendationOnthology_Class20006] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Big Ben")
	(SightSituatedIn [TravelRecommendationOnthology_Class10068]))

([TravelRecommendationOnthology_Class20007] of  Sight

	(Importance 1)
	(SightInterest [TravelRecommendationOnthology_Class10015])
	(SightName "Jardin Botanico de Munich")
	(SightSituatedIn [TravelRecommendationOnthology_Class10041]))

([TravelRecommendationOnthology_Class20008] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Museo Nordico")
	(SightSituatedIn [TravelRecommendationOnthology_Class10042]))

([TravelRecommendationOnthology_Class20009] of  Sight

	(Importance 5)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Mausoleo de Lenin")
	(SightSituatedIn [TravelRecommendationOnthology_Class10043]))

([TravelRecommendationOnthology_Class20010] of  Sight

	(Importance 2)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Museo Faberge")
	(SightSituatedIn [TravelRecommendationOnthology_Class10044]))

([TravelRecommendationOnthology_Class20011] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Templo de Zeus")
	(SightSituatedIn [TravelRecommendationOnthology_Class10045]))

([TravelRecommendationOnthology_Class20012] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Mezquita Azul")
	(SightSituatedIn [TravelRecommendationOnthology_Class10046]))

([TravelRecommendationOnthology_Class20013] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10018])
	(SightName "Tokyo Tower")
	(SightSituatedIn [TravelRecommendationOnthology_Class10047]))

([TravelRecommendationOnthology_Class20014] of  Sight

	(Importance 4)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Plaza de Tiananmen")
	(SightSituatedIn [TravelRecommendationOnthology_Class10048]))

([TravelRecommendationOnthology_Class20015] of  Hotel

	(CostByNight 200.0)
	(HotelName "Legacy Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10048])
	(HotelStars 4))

([TravelRecommendationOnthology_Class20016] of  Hotel

	(CostByNight 250.0)
	(HotelName "Discovery Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10049])
	(HotelStars 5))

([TravelRecommendationOnthology_Class20017] of  Hotel

	(CostByNight 250.0)
	(HotelName "Lee Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10050])
	(HotelStars 5))

([TravelRecommendationOnthology_Class20018] of  Hotel

	(CostByNight 250.0)
	(HotelName "Dark Paradise Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10051])
	(HotelStars 5))

([TravelRecommendationOnthology_Class20019] of  Hotel

	(CostByNight 200.0)
	(HotelName "Centre Park Hotel")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10052])
	(HotelStars 4))

([TravelRecommendationOnthology_Class20020] of  Hotel

	(CostByNight 250.0)
	(HotelName "Future Resort")
	(HotelSituatedIn [TravelRecommendationOnthology_Class10053])
	(HotelStars 5))

([TravelRecommendationOnthology_Class3] of  Transport

	(BaseCost 20)
	(Distance corta)
	(TransportName coche))

([TravelRecommendationOnthology_Class30015] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "China Art Museum")
	(SightSituatedIn [TravelRecommendationOnthology_Class10049]))

([TravelRecommendationOnthology_Class30016] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10017])
	(SightName "Kowloon Island")
	(SightSituatedIn [TravelRecommendationOnthology_Class10050]))

([TravelRecommendationOnthology_Class30017] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10])
	(SightName "Museo Nacional de Corea")
	(SightSituatedIn [TravelRecommendationOnthology_Class10051]))

([TravelRecommendationOnthology_Class30018] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class10016])
	(SightName "Ski Dubai")
	(SightSituatedIn [TravelRecommendationOnthology_Class10053]))

([TravelRecommendationOnthology_Class30019] of  Sight

	(Importance 3)
	(SightInterest [TravelRecommendationOnthology_Class13])
	(SightName "Museo de la Liga Hanseatica")
	(SightSituatedIn [TravelRecommendationOnthology_Class10052]))

([TravelRecommendationOnthology_Class4] of  Transport

	(BaseCost 50)
	(Distance media)
	(TransportName tren))

([TravelRecommendationOnthology_Class5] of  Transport

	(BaseCost 100)
	(Distance larga)
	(TransportName avion))

([TravelRecommendationOnthology_Class6] of  Transport

	(BaseCost 90)
	(Distance larga)
	(TransportName barco))

)





















































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




;;; Useful functions for characterisation:
;;; Each of these define a question input, with allowed kinds of values.
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

;This function is useful for getting the best option from a list.
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

;;; Here go all the rules for question asking:

(defrule characterisation::budget "Asks for travel budget"
	(not (budget ?))
	=>
	(assert (budget (num-question "¿Cual es el presupuesto para el viaje? " 300 10000))) ;; TODO: change random values
)
(defrule characterisation::days "Asks for days of travel"
	(not (mindays ?))
	(not (maxdays ?))
	=>
	(bind ?min (num-question "¿Cual es el requisito de minimo de dias del viaje?" 1 30))
	(bind ?max (num-question "¿Cual es el requisito de maximo de dias del viaje?" 1 30)) ;; TODO:Check this, could be troublesome
	(while (> ?min ?max) do
		(printout t "El maximo debe ser mayor que el minimo" crlf)
		(bind ?min (num-question "¿Cual es el requisito de minimo de dias del viaje?" 1 30))
		(bind ?max (num-question "¿Cual es el requisito de maximo de dias del viaje?" 1 30)) ;; TODO:Check this, could be troublesome
	)
	(assert (mindays ?min))
	(assert (maxdays ?max))
)
(defrule characterisation::numberofcities "Asks for number of cities to visit"
	(not (minnumcities ?))
	(not (maxnumcities ?))
	=>
	(bind ?min (num-question "¿Cual es el numero minimo de ciudades a visitar?" 1 10))
	(bind ?max (num-question "¿Cual es el numero maximo de ciudades a visitar?" 1 10))
	(while (> ?min ?max) do
		(printout t "El maximo debe ser mayor que el minimo" crlf)
		(bind ?min (num-question "¿Cual es el numero minimo de ciudades a visitar?" 1 10))
		(bind ?max (num-question "¿Cual es el numero maximo de ciudades a visitar?" 1 10))
	)
	(assert (minnumcities ?min))
	(assert (maxnumcities ?max))
)
(defrule characterisation::numberofdaysincities "Asks for restriction of number of days in cities"
	(not (mindaysincities ?))
	(not (maxdaysincities ?))
	=>
	(bind ?min (num-question "¿Cual es el numero minimo de dias a pasar en una ciudad?" 1 10))
	(bind ?max (num-question "¿Cual es el numero maximo de dias a pasar en una ciudad?" 1 10))
	(while (> ?min ?max) do
		(printout t "El maximo debe ser mayor que el minimo" crlf)
		(bind ?min (num-question "¿Cual es el numero minimo de ciudades a visitar?" 1 10))
		(bind ?max (num-question "¿Cual es el numero maximo de ciudades a visitar?" 1 10))
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
(defrule characterisation::sacrificeQualityForBudgetAuto "If we want minimum 1 star hotels, we don't need to ask the user if he agrees to reducing the hotel quality"
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
) 
;; sacrificeforbudget should work like this: if it is true, we can 'unrestrict' the restrictions on quality of hotel, depending on the type of sacrifice
;; unrestrict should mean punishing those solutions but not discard them


;; Restrictions set above, now further characterisation

(defrule characterisation::age "Ask for user's age"
	(not (age ?))
	=>
	(assert (age (num-question "¿Que edad tiene?" 1 110)))
); This question is not really useful, but we could infer if he wants an imserso travel from this.

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
) ;This rule is not useful for processing/construction, but we can deduce things for caracterisation from here

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
) ; We deduce that a relax travel implies not visiting many monuments.

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
) ; We specifically ask the objective of the travel if we still don't know by now.

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

(defrule characterisation::DayChecker "Makes sure user is not asking impossible restrictions on days"
	(declare(salience 20))
	?f1<-(minnumcities ?minc)
	?f2<-(maxnumcities ?maxc)
	?f3<-(mindaysincities ?mindc)
	?f4<-(maxdaysincities ?maxdc)
	?f5<-(mindays ?mind)
	?f6<-(maxdays ?maxd)
	=>
	(bind ?good TRUE)
	(bind ?calcMinDays (* ?minc ?mindc))
	(if (< ?maxd ?calcMinDays)
	then
		(bind ?good FALSE)
		(printout t "No se puede construir un viaje con maximo " ?maxd " dias visitando " ?minc " ciudades y haciendo " ?mindc " noches en ellas!" crlf)
	)
	(bind ?calcMaxDays (* ?maxc ?maxdc))
	(if (< ?calcMaxDays ?mind)
	then
		(bind ?good FALSE)
		(printout t "No se puede construir un viaje con minimo " ?mind " dias visitando maximo " ?maxc " ciudades y haciendo maximo " ?maxdc " noches en ellas!" crlf)
	)
	(if (not ?good)
	then
		(retract ?f1 ?f2 ?f3 ?f4 ?f5 ?f6)
	)
)

(defrule characterisation::toProcessing "Switches focus to processing after nothing else to do"
	(declare(salience -20))
	=>
	(printout t "Processing..." crlf)
	(focus processing)
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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


(defrule processing::toConstruction "Switches to construction"
	(declare (salience -20))
	=>
	(printout t "Building travel 1..." crlf)
	(focus construction)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(deftemplate construction::visited 
	(slot city (type INSTANCE))
)

;Function for computing monetary cost of moving with a certain transport
(deffunction construction::transportCost (?transport ?city1 ?city2)
	(bind ?base (send ?transport get-BaseCost))
	(bind ?xdist (- (send ?city2 get-XCoord) (send ?city1 get-XCoord) ))
    (bind ?ydist (- (send ?city2 get-YCoord) (send ?city1 get-YCoord) ))
    (bind ?dist (sqrt (+ (* ?xdist ?xdist) (* ?ydist ?ydist) )))
    (bind ?result (+ ?base (* 0.01 ?base ?dist)))
    (return (/ ( round (* 100 ?result) ) 100))
)

;Function that computes the tota cost of a travel.
(deffunction construction::travelCost (?travel ?travelers)
	(bind $?stays (send ?travel get-Stays))
	(bind ?total 0)
	(progn$ (?stay ?stays)
		(bind ?hotelCost (* (send (send ?stay get-StayHotel) get-CostByNight) (* (send ?stay get-Days) ?travelers)))
		(bind ?total (+ ?total ?hotelCost))
	)
	(bind $?transports (send ?travel get-TravelTransports))
	(loop-for-count (?i 1 (length$ $?transports)) do
		(bind ?city1 (send (nth$ ?i $?stays) get-StayCity))
		(bind ?city2 (send (nth$ (+ ?i 1) $?stays) get-StayCity))
		(bind ?curr-transport (nth$ ?i $?transports))
		(bind ?total (+ ?total (transportCost ?curr-transport ?city1 ?city2)))
	)

	(return ?total)
)


; First solution generation, minimal cost with all other restrictions.
(defrule construction::Start "Initializes the solution with minimum requirements"
	(not (travelRecomendation ?))
	(not (BadTravel))
	(minnumcities ?mc)
	(mindaysincities ?dc)
	(maxdaysincities ?maxdc)
	(mindays ?mtd)
	(monumentsPerDay ?mpd)
	(budget ?budget)
	(travelers ?t)
	=>
	(bind ?good TRUE)
	(bind $?Unorderedlist (find-all-instances ((?inst City)) (> ?inst:Score 0)))
	(bind $?VisitFilter (create$ ))
	;Filter by not visited
	(do-for-all-facts ((?f visited)) TRUE 
		;(printout t ?f)
		(bind $?Unorderedlist (delete-member$ $?Unorderedlist ?f:city))
	)
	;Filter by valid hotel (positive score)
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

    ;PROBLEM: if we need minimum ?mtd days in total, but ?maxdc * ?mc is less than that, we need to visit more cities!
    ;SOLUTION: we change ?mc to accomodate the minimum number of cities
    (if (> ?mtd (* ?maxdc ?mc))
    then
    	(bind ?newcities (div ?mtd ?maxdc))
    	(if (not (eq ?mtd (* ?newcities ?maxdc)))
    	then (bind ?newcities (+ ?newcities 1)))
    	(bind ?mc ?newcities)
    )

    ;Preliminar selection of cities
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
			(assert (visited (city ?curr-obj)))
			(bind $?hotelList (send ?curr-obj get-HasHotel))

			; Now we get the cheapest hotel with positive score. We know it exists from before.
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
			(if (eq ?finalHotel nil)
			then ;This should be unreachable code, as it has been checked before.
				(printout t "Impossible travel: Could not find a Hotel in ")
				(format t "%s " (send ?curr-obj get-CityName))
				(bind ?good FALSE)
			else
				(bind $?stays (insert$ $?stays (+ (length$ $?stays) 1)  
					(make-instance (gensym) of Stay (Days ?dc) (StayCity ?curr-obj) (StayHotel ?finalHotel))  
				))
			)
		)
		; Here we should add a couple days to first city to get enough mindays, put in the next one if we exceed maxdaysincities, etc.
		(bind ?leftmindays (- ?mtd (* ?mc ?dc)))
		(bind ?i 1)
		(bind ?maximumAddition (- ?maxdc ?dc))
		(while (and (<= ?i (length$ $?stays)) (> ?leftmindays 0)) do
			(bind ?curr-obj (nth$ ?i ?stays))
			(if (< ?leftmindays ?maximumAddition)
			then
				(send ?curr-obj put-Days (+ ?dc ?leftmindays))
				(bind ?leftmindays 0)
			else
				(send ?curr-obj put-Days ?maxdc)
				(bind ?leftmindays (- ?leftmindays ?maximumAddition))
			)
			(bind ?i (+ ?i 1))
		)
		(if (> ?leftmindays 0)
		then
			; Take into account this code should be unreachable, since a function in characterisation checks this already + the previous increment in minimum cities here also prevents this from happening.
			(printout t "Impossible travel: Day restrictions make it impossible" crlf)
			(bind ?good FALSE)
			;
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

		(bind ?travel (make-instance (gensym) of Travel (Stays ?stays)))
		; Here we check the budget, in case we went overboard with the cheapest solution, and warn the user.
		(if (and (> (travelCost ?travel ?t) ?budget) ?good)
		then
			(printout t "Con las actuales restricciones no podemos ofrecerle un viaje con presupuesto " ?budget "$" crlf)
			(printout t "Le proponemos esta alternativa mas cara (reduzca los requisitos de hoteles y minimo de ciudades y dias para una experiencia mas asequible)" crlf)
		)
		(if ?good
		then
			(assert (travelRecomendation ?travel))
		else
			(assert (BadTravel)) ;Travel unbuildable, probably due to lack of instances in onthology, but it should never happen.
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
; Function that recomends heuristically the transport to use in a concrete move, more formally:
; given two cities returns the list of transports and their scores
(deffunction construction::recTransport (?city1 ?city2) 
    
    (bind $?scoredTransports (create$ ))
    (bind $?allTransports (find-all-instances ((?inst Transport)) TRUE))
    
    (progn$ (?curr $?allTransports)
        (bind $?scoredTransports 
            (insert$ $?scoredTransports (+ (length$ $?scoredTransports) 1) 
                (make-instance (gensym) of transportScoring (Transport ?curr) (Score 0))
            )
        )
    )
    
    (do-for-all-facts ((?f prefertransport)) TRUE ;Reward for prefered
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
    
    (do-for-all-facts ((?f avoidtransport)) TRUE ;Punishment for avoided (overwrites prefered)
        (bind ?trans ?f:trans)
        (progn$ (?curr $?scoredTransports)
            (if
                (eq ?trans (send (send ?curr get-Transport) get-TransportName) )
            then
                (send ?curr put-Score -10)
            )
        )
	)
    
    (bind ?xdist (- (send ?city2 get-XCoord) (send ?city1 get-XCoord) ))
    (bind ?ydist (- (send ?city2 get-YCoord) (send ?city1 get-YCoord) ))
    (bind ?dist (sqrt (+ (* ?xdist ?xdist) (* ?ydist ?ydist) )))

    ; Calculation of modifier of adequacy (if transport is good for the distance)
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
        
    (return $?scoredTransports)
    
)

;Rule for solution improvement
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
	; APPROXIMATE OF TRANSPORT COST, 125 is a 'magic number' that more or less helps the solution settle on an aproximated transport budget
	(bind ?leftOverMoney (- ?leftOverMoney (* (- (length$ (send ?travel get-Stays)) 1) 125) ) ) 
	(bind ?maxScoreImprovement 0)
	(bind ?bestOption nil)

	; IMPROVING A HOTEL (IMPROVEMENT = DAYS* (NEWHOTEL - PREVHOTEL)*travelers)
	; Only considers best hotel in the city. Checks if the change overflows the budget
	(bind ?i 1)
	(progn$ (?stay (send ?travel get-Stays))
		(bind ?prevHotel (send ?stay get-StayHotel))
		(bind ?days (send ?stay get-Days))
		(bind ?psc (send ?prevHotel get-Score))
		(bind ?hotelList (send (send ?stay get-StayCity) get-HasHotel))
		(bind ?newHotel (maximum-score ?hotelList))
		(bind ?improvement (* ?days (- (send ?newHotel get-Score) (send ?prevHotel get-Score) )))
		(bind ?extraCost (* (* ?days (- (send ?newHotel get-CostByNight) (send ?prevHotel get-CostByNight))) ?t))
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
	; Checks if we still have days available both in the travel and in the concrete stay, and if we can afford another night at the hotel.
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
	; Only considers next best city (with good hotel). Checks if we overflow the maximum days of the travel and the number of cities, and if the city has an 'adequate' hotel, and the budget.
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
	
	; After all the code above, we now have a 'reference' of the bestOption to apply. We will apply it if it exists
	(if (eq ?bestOption nil) 
	then
		(bind ?notEnd FALSE)
		(assert (ImprovementFinished))
	else
		;(printout t ?leftOverMoney " " (nth$ 1 ?bestOption) " " (nth$ 2 ?bestOption) crlf)
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

					(bind ?finalSightList (create$ ))
					(bind ?j 1)
					(while (and (<= ?j ?numberOfSights) (not (eq (length$ ?citySights) 0)) )
						(bind ?newSightToVisit (maximum-score $?citySights))
						(bind $?citySights (delete-member$ $?citySights ?newSightToVisit))
						(bind $?finalSightList (insert$ $?finalSightList (+ (length$ $?finalSightList) 1) ?newSightToVisit))
						(bind ?j (+ ?j 1))
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

	)
)


(defrule construction::AssignTransports "Assigns the travel transports"
	(declare (salience -9))
	(not (transportsAssigned))
	(travelRecomendation ?travel)
	=>
	(bind ?stays (send ?travel get-Stays))
	(bind ?city1 (send (nth$ 1 ?stays) get-StayCity))
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
			;(printout t ?sight )		
		)
	)
	(bind $?transports (send ?travel get-TravelTransports))
	(printout t crlf "Transport:")
	(loop-for-count (?i 1 (length$ $?transports)) do
		(bind ?city1 (send (send (nth$ ?i $?stays) get-StayCity) get-CityName ) )
		(bind ?city2 (send (send (nth$ (+ ?i 1) $?stays) get-StayCity) get-CityName ) )
		(bind ?curr-transport (send (nth$ ?i $?transports) get-TransportName))
		;(printout t crlf ?curr-transport)
		(printout t crlf ?city1 " - " ?curr-transport " - " ?city2  "[" (transportCost (nth$ ?i $?transports) (send (nth$ ?i $?stays) get-StayCity) (send (nth$ (+ ?i 1) $?stays) get-StayCity)) "$]")
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




