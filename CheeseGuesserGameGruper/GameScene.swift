//
//  GameScene.swift
//  CheeseGuesserGameGruper
//
//  Created by MICHAEL GRUPER on 2/26/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var cheeses = [SKSpriteNode]()
    
//    var cheese : SKSpriteNode!
    var losslabel : SKLabelNode!
    var scorelabel : SKLabelNode!
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        cheeses.append(createAlphaMaskedSprite(size: CGSize(width: 175, height: 175), imageName: "cheddar"))
        cheeses.append(createAlphaMaskedSprite(size: CGSize(width: 175, height: 175), imageName: "brie"))
        losslabel = self.childNode(withName: "lossLabel") as! SKLabelNode
        scorelabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "cheese" || contact.bodyA.node?.name == "bottomPlank"{
            //if contact.bodyB.node?.name == "bottomPlank" || contact.bodyB.node?.name == "cheese"{
                //cheeses.append(self.childNode(withName: "cheese") as! SKSpriteNode)
                //add child node to the scene when the previous one contacts the bottom plank
                print("contact")
            cheeses[1].removeFromParent()
            cheeses[1].position = CGPoint(x: 0, y: 407.5)
            cheeses[1].physicsBody = SKPhysicsBody(rectangleOf: cheeses[1].size)
            cheeses[1].physicsBody = SKPhysicsBody(texture: cheeses[1].texture!, alphaThreshold: 1.0, size: cheeses[1].size)
            cheeses[1].physicsBody?.isDynamic = true
            AppData.gravity = 0
            cheeses[1].constraints = []
            cheeses[1].physicsBody?.affectedByGravity = true
            cheeses[1].physicsBody?.allowsRotation = true
            cheeses[1].physicsBody?.categoryBitMask = 1
            cheeses[1].physicsBody?.contactTestBitMask = 1
            self.addChild(cheeses[1])
            }
        //}
        
    }
    
    func createAlphaMaskedSprite(size: CGSize, imageName: String) -> SKSpriteNode {
        // Combine the color image with the mask
        let maskedImage = UIImage(named: imageName)!
        // Create a texture from the masked image
        let texture = SKTexture(image: maskedImage)
        
        // Create the sprite node with the texture
        let sprite = SKSpriteNode(texture: texture)
        sprite.size = size
        return sprite
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        scene?.physicsWorld.gravity = CGVector(dx: 0, dy: AppData.gravity)
        if !AppData.hide{
            losslabel.isHidden = AppData.hide
        }
        scorelabel.text = "Score: \(AppData.points)"
    }
}
