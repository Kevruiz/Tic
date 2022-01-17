//
//  Model.swift
//  Tic
//
//  Created by kevin on 11/01/2022.
//

import Foundation

enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardindex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}
