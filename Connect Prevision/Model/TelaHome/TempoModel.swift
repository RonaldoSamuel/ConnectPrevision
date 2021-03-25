//
//  TempoModel.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 01/03/21.
//
import Foundation

// MARK: - TempoModel
struct TempoModel: Codable {
    let location: Location
    let current: Current
}
// MARK: - Current
struct Current: Codable {
    let last_updated_epoch: Int
    let last_updated: String
    let temp_c, temp_f, is_day: Int
    let wind_mph: Double
    let wind_kph, wind_degree: Int
    let wind_dir: String
    let pressure_mb: Int
    let pressure_in: Double
    let precip_mm, precip_in, humidity, cloud: Int
    let feelslike_c, feelslike_f: Double
    let vis_km, vis_miles, uv: Int
    let gust_mph, gust_kph: Double

}

extension Current {
    
    init() {
        self.last_updated_epoch = 0
        self.last_updated = ""
        self.temp_c = 0
        self.temp_f = 0
        self.is_day = 0
        self.wind_mph = 0
        self.wind_kph = 0
        self.wind_degree = 0
        self.wind_dir = ""
        self.pressure_mb = 0
        self.pressure_in = 0
        self.precip_mm = 0
        self.precip_in = 0
        self.humidity = 0
        self.cloud = 0
        self.feelslike_c = 0
        self.feelslike_f = 0
        self.vis_km = 0
        self.vis_miles = 0
        self.uv = 0
        self.gust_mph = 0
        self.gust_kph = 0
    }
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String
    let lat, lon: Double
    let tz_id: String
    let localtime_epoch: Int
    let localtime: String

   
}

extension Location {
    
    init(){
        self.name = ""
        self.region = "'"
        self.country = ""
        self.lat = 0
        self.lon = 0
        self.tz_id = ""
        self.localtime_epoch = 0
        self.localtime = ""
    }
}
