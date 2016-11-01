//
//  GameViewController.swift
//  CookieCrush
//
//  Created by Seab on 11/1/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var scene: GameScene!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait, .portraitUpsideDown]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure the view
        let skView = view as! SKView
        skView.isMultipleTouchEnabled = false
        
        // create and configure the scene
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFill
        
        // present the scene
        skView.presentScene(scene)
    }
    
    
}
