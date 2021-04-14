//
//  String+Extension.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import Foundation

extension String {
    
    func printValue(){
        print(self)
    }
    
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
    
    var translate: String {
        get {
            return TranslateHelper.translate(self)
        }
    }
    
}
