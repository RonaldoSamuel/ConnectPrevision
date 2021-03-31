// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let foreCastModel = try? newJSONDecoder().decode(ForeCastModel.self, from: jsonData)

import Foundation

// MARK: - ForeCastModel
struct ForeCastModel: Codable {
    let location: Location?
    let current: Current?
    let forecast: Forecast?
}

extension ForeCastModel {
    init(){
        self.location = nil
        self.current = nil
        self.forecast = nil
    }
}

// MARK: - Current
struct Current: Codable {
    
    let lastUpdatedEpoch: Double
    let lastUpdated: String
    let tempC: Double
    let tempF: Double
    let isDay: Double
    let condition: Condition
    let windMph, windKph: Double
    let windDegree: Double
    let pressureMB: Double
    let pressureIn, precipMm, precipIn: Double
    let humidity, cloud: Double
    let feelslikeC, feelslikeF: Double
    let visKM, visMiles, uv: Double
    let gustMph: Double
    let gustKph: Double

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text, icon: String
    let code: Double
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String
    let dateEpoch: Double
    let day: Day
    let astro: Astro
    let hour: [Hour]

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}

// MARK: - Astro
struct Astro: Codable {
    let sunrise, sunset, moonrise, moonset: String
    let moonPhase, moonIllumination: String

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
    }
}

// MARK: - Day
struct Day: Codable {
    let maxtempC, maxtempF, mintempC: Double
    let mintempF: Double
    let avgtempC, avgtempF, maxwindMph, maxwindKph: Double
    let totalprecipMm, totalprecipIn, avgvisKM: Double
    let avgvisMiles, avghumidity, dailyWillItRain: Double
    let dailyChanceOfRain: String
    let dailyWillItSnow: Double
    let dailyChanceOfSnow: String
    let condition: Condition
    let uv: Double

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition, uv
    }
}

// MARK: - Hour
struct Hour: Codable {
    let timeEpoch: Double?
    let time: String?
    let tempC, tempF: Double?
    let isDay: Double?
    let condition: Condition?
    let windMph, windKph: Double?
    let windDegree: Double?
    let pressureMB: Double?
    let pressureIn, precipMm, precipIn: Double?
    let humidity, cloud: Double?
    let feelslikeC, feelslikeF, windchillC, windchillF: Double?
    let heatindexC, heatindexF, dewpointC, dewpointF: Double?
    let willItRain: Double?
    let chanceOfRain: String?
    let visKM: Double?
    let gustMph, gustKph: Double?
    let uv: Double?

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case visKM = "vis_km"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
    }
}
extension Hour {
    init(){
        timeEpoch = nil
        self.time = nil
        self.tempC = nil
        self.tempF = nil
        self.isDay = nil
        self.condition = nil
        self.windMph = nil
        self.windKph = nil
        self.windDegree = nil
        self.pressureMB = nil
        self.pressureIn = nil
        self.precipMm = nil
        self.precipIn = nil
        self.humidity = nil
        self.cloud = nil
        self.feelslikeC = nil
        self.feelslikeF = nil
        self.windchillC = nil
        self.windchillF = nil
        self.heatindexC = nil
        self.heatindexF = nil
        self.dewpointC = nil
        self.dewpointF = nil
        self.willItRain = nil
        self.chanceOfRain = nil
        self.visKM = nil
        self.gustMph = nil
        self.gustKph = nil
        self.uv = nil
    }
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String
    let lat, lon: Double
    let tzID: String
    let localtimeEpoch: Double
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
