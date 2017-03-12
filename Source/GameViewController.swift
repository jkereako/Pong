//
//  GameViewController.swift
//  Pong
//
//  Created by Jeff Kereakoglow on 3/12/17.
//  Copyright © 2017 Alexis Digital. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let sceneView = view as? SKView else {
            assertionFailure("Expected an SKView")
            return
        }

        if let scene = SKScene(fileNamed: "GameScene") {
            scene.scaleMode = .aspectFill
            sceneView.presentScene(scene)
        }

        sceneView.ignoresSiblingOrder = true
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        guard UIDevice.current.userInterfaceIdiom == .phone else { return .all }
        return .allButUpsideDown
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
