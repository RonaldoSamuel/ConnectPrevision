//
//  DirectionHelper.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 15/04/21.
//

import Foundation

enum DircooesBussulaEnum {
    case N, NNE, NE, ENE, E, ESE, SE, SSE, S, SSW, SW, WSW, W, WNW, NW, NNW, VAR, CLM, ALL
}

class DirectionHelper {
    
    func retornarDirecaoString(sigla: DircooesBussulaEnum)-> String{
        var direcao: String
        switch sigla {
        case .N:
            direcao = "north".translate
            break
        case .NNE:
            direcao = "noth_northeast".translate
            break
        case .NE:
            direcao = "northeast".translate
            break
        case .ENE:
            direcao = "east_north".translate
            break
        case .E:
            direcao = "east".translate
            break
        case .ESE:
            direcao = "east_southeast".translate
            break
        case .SE:
            direcao = "southeast".translate
            break
        case .SSE:
            direcao = "south_southeast".translate
            break
        case .S:
            direcao = "south".translate
            break
        case .SSW:
            direcao = "south_southwest".translate
            break
        case .SW:
            direcao = "southwest".translate
            break
        case .WSW:
            direcao = "west_southwest".translate
            break
        case .W:
            direcao = "west".translate
            break
        case .WNW:
            direcao = "west_northwest".translate
            break
        case .NW:
            direcao = "northwest".translate
            break
        case .NNW:
            direcao = "north_northwest".translate
            break
        case .VAR:
            direcao = "variable_wind".translate
            break
        case .CLM:
            direcao = "calm_winds".translate
            break
        case .ALL:
            direcao = "all_directions".translate
            break
        }
        return direcao
    }
    
}
