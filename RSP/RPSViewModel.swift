//
//  RPSViewModel.swift
//  RSP
//
//  Created by Niels Taatgen on 16/6/20.
//  Copyright © 2020 Niels Taatgen. All rights reserved.
//

import Foundation

class RPSViewModel: ObservableObject {
    @Published private var model = RPSModel()
    
    // MARK: - Access to the Model
    
    var modelChoice: String {
        model.modelAction.description
    }
    
    var playerChoice: String {
        model.playerAction.description
    }
    
    var playerMood: String {
        model.playerMood.description
    }
    
    var modelMood: String {
        model.modelMood.description
    }
    
    var playerScore: String {
        String(model.playerScore)
    }
    
    var modelScore: String {
        String(model.modelScore)
    }
    
    // MARK: - Intent(s)
    
    func choose(card: String) {
        switch card {
        case "rock": model.playerChoosesAction(.rock)
        case "scissors": model.playerChoosesAction(.scissors)
        case "paper": model.playerChoosesAction(.paper)
        default: print("Error in player choices")
        }
    }
    
}
