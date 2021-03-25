//
//  APIClient.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 25/03/21.
//

import Foundation
import Alamofire

class APIClient {
    static func pegarTemperatura(completion: @escaping (AFResult<TempoModel>)->Void) {
        AF.request(PegarTempo.pegarTemperatura(pais: "São Paulo")).responseDecodable { (response: AFDataResponse<TempoModel>) in completion(response.result)}
    }
}
