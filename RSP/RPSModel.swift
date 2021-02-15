//
//  RPSModel.swift
//  RSP
//
//  Created by Niels Taatgen on 16/6/20.
//  Copyright © 2020 Niels Taatgen. All rights reserved.
//

import Foundation

enum Action: CustomStringConvertible {
    case rock
    case paper
    case scissors
    case none
    var description: String {
        switch self {
        case .rock: return "rock"
        case .paper: return "paper"
        case .scissors: return "scissors"
        case .none: return "question"
        }
    }
}

enum Emotion: CustomStringConvertible {
    
    case happy
    case sad
    case neutral
    var description: String {
        switch self {
        case .happy: return "😀"
        case .sad: return "😟"
        case .neutral: return "😐"
        }
    }
}

struct RPSModel {
    let model = Model()
    var playerAction: Action = .none
    var modelAction: Action = .none
    var playerScore = 0
    var modelScore = 0
    var playerMood = Emotion.neutral
    var modelMood = Emotion.neutral
    init() {
        model.loadModel(fileName: "rps")
        model.run()
    }
    
    mutating func playerChoosesAction(_ action: Action) {
        guard action != .none else { print("Error in model") ; return }
        playerAction = action
        if let modelActionString = model.lastAction(slot: "choice") {
            switch modelActionString {
            case "rock": modelAction = .rock
            case "paper": modelAction = .paper
            case "scissors": modelAction = .scissors
            default: print("Error in model")
            modelAction = .none
                return
            }
            switch (playerAction, modelAction) {
            case (.rock, .rock), (.scissors, .scissors), (.paper, .paper):
                playerMood = .neutral
                modelMood = .neutral
            case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
                playerScore += 1
                playerMood = .happy
                modelMood = .sad
            case (.scissors, .rock), (.paper, .scissors), (.rock, .paper):
                modelScore += 1
                modelMood = .happy
                playerMood = .sad
            default:
                print("This should not happen")
            }
            model.modifyLastAction(slot: "opponent", value: playerAction.description)
            model.run()
        }
        
        
    }
    
}

