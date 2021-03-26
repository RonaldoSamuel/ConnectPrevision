//
//  PegarTempo.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 25/03/21.
//

import Foundation
import Alamofire

enum PegarTemperaturaForeCast: APIConfiguration {
    
    case pegarTemperaturaForeCast(lat: Double,long: Double)
    
    var method: HTTPMethod{
        switch self {
        default:
            return .get
        }
    }
    
    var parameters: RequestParams? {
        switch self {
        case .pegarTemperaturaForeCast(let lat, let long):
            return .url([
                ParameterKeys.keyP: WeatherAPI.key,
                ParameterKeys.q: "\(lat), \(long)",
                "days": 7,
                "aqi": "no",
                "alerts": "no"
            ])
        }
    }
    
    var path: String {
        switch self {
        case .pegarTemperaturaForeCast:
            return "/forecast.json"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try APIConstants.ProductionServer.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        switch parameters {
        
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            
        case .url(let params):
            let queryParams = params.map { pair  in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        case .none:
            break
        }
        
        return urlRequest
        
    }
    
}
