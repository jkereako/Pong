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
    private var playerScore: SKLabelNode!
    private var opponent: SKSpriteNode!
    private var opponentScore: SKLabelNode!
    private var playerController: PlayerController!
    private var score: Score!

    override func sceneDidLoad() {
        super.sceneDidLoad()

        let scoreNode = childNode(withName: "Score")
        player = childNode(withName: "Player") as? SKSpriteNode
        opponent = childNode(withName: "Opponent") as? SKSpriteNode
        playerScore = scoreNode?.childNode(withName: "PlayerScore") as? SKLabelNode
        opponentScore = scoreNode?.childNode(withName: "OpponentScore") as? SKLabelNode
        ball = childNode(withName: "Ball") as? SKSpriteNode
        playerController = PlayerController(scene: self, player: player)
        score = Score(player: 0, opponent: 0)
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))

        let border = SKPhysicsBody(edgeLoopFrom: frame)
        border.friction = 0
        border.restitution = 1

        physicsBody = border
    }

    override func update(_ currentTime: TimeInterval) {
        opponent.run(SKAction.moveTo(x: ball.position.x, duration: 1))

        let scoreController = ScoreController(score: score)

        switch ball.position.y {
        case let y where y <= player.position.y - 50:
            score = scoreController.incrementPlayerScore()
            playerScore.text = String(score.player)
            ball.position = CGPoint.zero
            ball.physicsBody?.velocity = CGVector.zero
            ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        case let y where y >= opponent.position.y - 50:
            score = scoreController.incrementOpponentScore()
            opponentScore.text = String(score.opponent)
            ball.position = CGPoint.zero
            ball.physicsBody?.velocity = CGVector.zero
            ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        default:
            break
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        playerController.handle(touches: touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        playerController.handle(touches: touches)
    }
}
