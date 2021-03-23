//
//  TempoModel.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 01/03/21.
//

import Foundation

// MARK: - TempoModel
struct TempoModel: Codable {
    let by: String
    let validKey: Bool
    let results: Results
    let executionTime: Int
    let fromCache: Bool

    enum CodingKeys: String, CodingKey {
        case by
        case validKey = "valid_key"
        case results
        case executionTime = "execution_time"
        case fromCache = "from_cache"
    }
}

// MARK: - Results
struct Results: Codable {
    let temp: Int
    let date, time, conditionCode, resultsDescription: String
    let currently, cid, city, imgID: String
    let humidity: Int
    let windSpeedy, sunrise, sunset, conditionSlug: String
    let cityName: String
    let forecast: [Forecast]

    enum CodingKeys: String, CodingKey {
        case temp, date, time
        case conditionCode = "condition_code"
        case resultsDescription = "description"
        case currently, cid, city
        case imgID = "img_id"
        case humidity
        case windSpeedy = "wind_speedy"
        case sunrise, sunset
        case conditionSlug = "condition_slug"
        case cityName = "city_name"
        case forecast
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    let date, weekday: String
    let max, min: Int
    let forecastDescription: String
    let condition: Condition

    enum CodingKeys: String, CodingKey {
        case date, weekday, max, min
        case forecastDescription = "description"
        case condition
    }
}

enum Condition: String, Codable {
    case cloud = "cloud"
    case storm = "storm"
}
