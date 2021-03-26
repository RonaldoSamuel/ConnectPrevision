//
//  APIClient.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 25/03/21.
//

import Foundation
import Alamofire

class APIClient {
    
//    static func pegarTemperatura(lat: Double,long: Double, completion: @escaping (TempoModel)->Void) {
//        AF.request(PegarTempo.pegarTemperatura(lat: lat,long: long))
//            .responseDecodable { (response: AFDataResponse<TempoModel>) in
//
//                switch response.result {
//                case .success( let tempo):
//                    completion(tempo)
//                    break
//                case .failure( let erro):
//                    print(erro)
//                    break
//                }
//            }
//    }
    
    static func pegarTemperaturaForeCast(lat: Double,long: Double, completion: @escaping (ForeCastModel)->Void) {
        AF.request(PegarTemperaturaForeCast.pegarTemperaturaForeCast(lat: lat,long: long))
            .responseDecodable { (response: AFDataResponse<ForeCastModel>) in
                
                switch response.result {
                case .success( let tempo):
                    completion(tempo)
                    break
                case .failure( let erro):
                    print(erro)
                    break
                }
            }
    }
    
}
