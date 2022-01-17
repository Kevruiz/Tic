//
//  Alerts.swift
//  Tic
//
//  Created by kevin on 11/01/2022.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let buttonMessage: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You win!"),
                                    message: Text("You beat the ai"),
                                    buttonMessage: Text("Continue"))
    
    static let computerWin = AlertItem(title: Text("You Lost!"),
                                       message: Text("You lost to the ai"),
                                       buttonMessage: Text("Rematch"))
    
    static let draw = AlertItem(title: Text("You drew!"),
                                message: Text("You drew with the ai"),
                                buttonMessage: Text("Try again"))
}
