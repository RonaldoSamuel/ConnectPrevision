//
//  CadastroErroType.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 03/05/21.
//

import Foundation

enum CadastroErrorType: TypeErrorModel {
    case nomeVazio
    case emailVazio, emailInvalido
    case telefoneVazio, telefoneInvalido
    case senhaVazia, senhaCurta, senhaFraca
    case confirmarSenhaVazia
    case senhasDivergentes
}
