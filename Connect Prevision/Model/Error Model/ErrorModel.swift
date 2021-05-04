//
//  ErrorModel.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 03/05/21.
//

import Foundation

struct ErrorModel<T: TypeErrorModel> {
    
    var typeError: T
    var message: String
    
    var description: String {
        return "<\(type(of: self)): type = \(typeError) message = \(message)>"
    }
}

protocol TypeErrorModel { }

