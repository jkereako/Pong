//
//  PlayerController.swift
//  Pong
//
//  Created by Jeff Kereakoglow on 3/12/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import SpriteKit
import GameplayKit

struct PlayerController {
    let scene: SKScene
    let player: SKSpriteNode

    func handle(touches: Set<UITouch>) {
        for touch in touches {
            let location = touch.location(in: scene)

            player.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
}
