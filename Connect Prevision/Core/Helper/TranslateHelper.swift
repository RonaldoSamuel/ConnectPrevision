//
//  TranslateHelper.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 08/04/21.
//

import Foundation

class TranslateHelper {
    
    class func translate(_ key: String) -> String
    {
        return NSLocalizedString(key, comment: "")
    }
}
