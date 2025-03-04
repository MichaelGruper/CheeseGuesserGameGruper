//
//  GameScene.swift
//  CheeseGuesserGameGruper
//
//  Created by MICHAEL GRUPER on 2/26/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var cheeses = [SKSpriteNode]()
    
    var cheese : SKSpriteNode!
    var losslabel : SKLabelNode!
    var scorelabel : SKLabelNode!
    override func didMove(to view: SKView) {
        cheeses.append(self.childNode(withName: "cheese") as! SKSpriteNode)
        losslabel = self.childNode(withName: "lossLabel") as! SKLabelNode
        scorelabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        scene?.physicsWorld.gravity = CGVector(dx: 0, dy: AppData.gravity)
        if !AppData.hide{
            losslabel.isHidden = AppData.hide
        }
        scorelabel.text = "Score: \(AppData.points)"
//        if cheese.physicsBody?.velocity.dy == 0 && cheese.physicsBody?.velocity.dx == 0{
//            Cheese.gravity = 0
//        }
    }
}
