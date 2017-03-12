//
//  GameScene.swift
//  Pong
//
//  Created by Jeff Kereakoglow on 3/12/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    private var ball: SKSpriteNode!
    private var player: SKSpriteNode!
    private var opponent: SKSpriteNode!
    private var playerController: PlayerController!

    override func didMove(to view: SKView) {
        player = childNode(withName: "Player") as? SKSpriteNode
        opponent = childNode(withName: "Opponent") as? SKSpriteNode
        ball = childNode(withName: "Ball") as? SKSpriteNode
        playerController = PlayerController(scene: self, player: player)

        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))

        let border = SKPhysicsBody(edgeLoopFrom: frame)
        border.friction = 0
        border.restitution = 1

        physicsBody = border
    }
    
    override func update(_ currentTime: TimeInterval) {
        opponent.run(SKAction.moveTo(x: ball.position.x, duration: 1))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        playerController.handle(touches: touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        playerController.handle(touches: touches)
    }
}
