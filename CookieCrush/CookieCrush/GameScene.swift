//
//  GameScene.swift
//  CookieCrush
//
//  Created by Seab on 11/1/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) is not used in this app")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(imageNamed: "Background")
        background.size = size
        addChild(background)
        
    }
    
}
