//
//  Dados.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/03/21.
//

import Foundation

    struct Dados: Codable {
        let last_updated_epoch: Int
        let ast_updated: String
        let temp_c: Int
        let temp_f: Double
        let is_day: Int
        let condition: Condition
        let wind_mph: Double
        let wind_kph, wind_degree: Int
        let wind_dir: String
        let pressure_mb: Int
        let pressure_in: Double
        let precipMm, precipIn, humidity, cloud: Int
        let feelslike_c, feelslike_f: Double
        let vis_km, vis_miles, uv: Int
        let gust_mph, gust_kph: Double
        let air_quality: [String: Double]

    }


