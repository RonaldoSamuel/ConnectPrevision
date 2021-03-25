//
//  PegarTempo.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 25/03/21.
//

import Foundation
import Alamofire

enum PegarTempo: APIConfiguration {
    case pegarTemperatura(pais: String)
    var method: HTTPMethod{
        switch self {
        default:
            return .get
        }
    }
    
    var parameters: RequestParams? {
        switch self {
        case .pegarTemperatura(let pais):
            return .body([
                "key": WeatherAPI.key,
                ParameterKeys.q: pais
            ])
        }
    }
    
    var path: String {
        switch self {
        case .pegarTemperatura:
            return "/current.json"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try APIConstants.ProductionServer.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
     
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            }
        }
    
        return urlRequest
        
    }
   
}
