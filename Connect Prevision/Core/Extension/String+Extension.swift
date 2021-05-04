//
//  String+Extension.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import Foundation

extension String {
    
    var translate: String {
        get {
            return TranslateHelper.translate(self)
        }
    }
    
    var isValidEmail: Bool {
        get {
            
            let textRegx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let textPred = NSPredicate(format:"SELF MATCHES %@", textRegx)
            
            if textPred.evaluate(with: self) {
                return true
            }else {
                return false
            }
        }
    }
    
    var isSenhaForte: Bool {
        get {
            
            let textRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
            let textPred = NSPredicate(format:"SELF MATCHES %@", textRegx)
            
            if textPred.evaluate(with: self) {
                return true
            }else {
                return false
            }
        }
    }

    
    func printValue(){
        print(self)
    }
    
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }

}
