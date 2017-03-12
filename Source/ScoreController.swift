//
//  ScoreController.swift
//  Pong
//
//  Created by Jeff Kereakoglow on 3/12/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import Foundation

struct ScoreController {
    let score: Score

    func incrementPlayerScore() -> Score {
        return Score(player: score.player + 1, opponent: score.opponent)
    }

    func incrementOpponentScore() -> Score {
        return Score(player: score.player, opponent: score.opponent + 1)
    }
}
