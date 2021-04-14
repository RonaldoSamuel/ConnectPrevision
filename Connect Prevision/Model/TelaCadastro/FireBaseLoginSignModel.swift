//
//  FireBaseLoginSignModel.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import Foundation

struct FireBaseLoginSignModel: Codable {
    
    var email: String
    var password: String
}

extension FireBaseLoginSignModel {
    init() {
        self.email = ""
        self.password = ""
    }
}
