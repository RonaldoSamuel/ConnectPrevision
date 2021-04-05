//
//  ExtensionString.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 05/04/21.
//

import UIKit

extension String {
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
}
