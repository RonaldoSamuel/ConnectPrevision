//
//  ExtensionAlerts.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 04/05/21.
//

import Foundation
import MaterialComponents

extension TelaCadastroViewModel{
    
    func snackbar(message: String){
        let action = MDCSnackbarMessage()
        action.text = message
        
        MDCSnackbarManager.default.show(action)
    }
}
