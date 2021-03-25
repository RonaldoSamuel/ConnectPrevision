//
//  APIConstants.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 25/03/21.
//

import Foundation
import Alamofire

struct WeatherAPI {
    static let key = "8974a760da614befbc4135308212503"
}

struct APIConstants {
    struct ProductionServer {
        static let baseURL = "http://api.weatherapi.com/v1"
    }
}

struct ParameterKeys {
    static let q = "q"
    static let keyP = "key"
}

enum HTTPHeaderField: String {
    
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case string = "String"
}

enum ContentType: String {
    
    case json = "Application/json"
}
 
enum RequestParams {
    
    case body(_:Parameters)
    case url(_:Parameters)
}
