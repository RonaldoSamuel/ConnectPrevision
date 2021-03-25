//
//  File.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 25/03/21.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams? { get }
}
