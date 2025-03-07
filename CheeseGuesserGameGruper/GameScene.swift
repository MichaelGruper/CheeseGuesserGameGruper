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
        cheeses[0].removeFromParent()
        cheeses[0].position = CGPoint(x: 0, y: 407.5)
       // cheeses[0].physicsBody = SKPhysicsBody(rectangleOf: cheeses[0].size)
        
        cheeses[0].physicsBody?.isDynamic = true
        //cheeses[1].constraints = []
        cheeses[0].physicsBody?.affectedByGravity = true
        cheeses[0].physicsBody?.pinned = false
        cheeses[0].physicsBody?.allowsRotation = true
        cheeses[0].physicsBody?.categoryBitMask = 1
        cheeses[0].physicsBody?.contactTestBitMask = 1
        cheeses[0].physicsBody?.restitution = 0.0
        cheeses[0].name = "cheese"
        self.addChild(cheeses[0])
        cheeses.append(createAlphaMaskedSprite(size: CGSize(width: 175, height: 175), imageName: "brie"))
        cheeses.append(createAlphaMaskedSprite(size: CGSize(width: 175, height: 175), imageName: "asiago"))
        cheeses.append(createAlphaMaskedSprite(size: CGSize(width: 175, height: 175), imageName: "burrata"))
        cheeses.append(createAlphaMaskedSprite(size: CGSize(width: 175, height: 175), imageName: "colby"))
        cheeses.append(createAlphaMaskedSprite(size: CGSize(width: 175, height: 175), imageName: "edan"))
        cheeses.append(createAlphaMaskedSprite(size: CGSize(width: 175, height: 175), imageName: "emmental"))
        cheeses.append(createAlphaMaskedSprite(size: CGSize(width: 175, height: 175), imageName: "fontina"))
        cheeses.append(createAlphaMaskedSprite(size: CGSize(width: 175, height: 175), imageName: "gouda"))
        cheeses.append(createAlphaMaskedSprite(size: CGSize(width: 175, height: 175), imageName: "mozzarella"))
        losslabel = self.childNode(withName: "lossLabel") as! SKLabelNode
        scorelabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "cheese" || contact.bodyB.node?.name == "cheese"{
            if contact.bodyA.node?.name == "bottomPlank" || contact.bodyB.node?.name == "bottomPlank"{
                //cheeses.append(self.childNode(withName: "cheese") as! SKSpriteNode)
                //add child node to the scene when the previous one contacts the bottom plank
                print("contact")
                AppData.contactCount += 1
                
                if AppData.contactCount == 1{
                    AppData.cheeseArrCount += 1
                    print("happening")
                    cheeses[AppData.cheeseArrCount].removeFromParent()
                    cheeses[AppData.cheeseArrCount].position = CGPoint(x: 0, y: 407.5)
                    cheeses[AppData.cheeseArrCount].physicsBody?.isDynamic = true
                    //cheeses[1].constraints = []
                    cheeses[AppData.cheeseArrCount].physicsBody?.affectedByGravity = true
                    cheeses[AppData.cheeseArrCount].physicsBody?.pinned = false
                    cheeses[AppData.cheeseArrCount].physicsBody?.allowsRotation = true
                    cheeses[AppData.cheeseArrCount].physicsBody?.categoryBitMask = 1
                    cheeses[AppData.cheeseArrCount].physicsBody?.contactTestBitMask = 1
                    cheeses[AppData.cheeseArrCount].physicsBody?.restitution = 0.0
                    cheeses[AppData.cheeseArrCount].name = "cheese"
                    cheeses[AppData.cheeseArrCount].physicsBody?.affectedByGravity = false
                    self.addChild(cheeses[AppData.cheeseArrCount])
                }
            }
        }
        
    }
    
    func createAlphaMaskedSprite(size: CGSize, imageName: String) -> SKSpriteNode {
        // Combine the color image with the mask
        let maskedImage = UIImage(named: imageName)!
        // Create a texture from the masked image
        let texture = SKTexture(image: maskedImage)
        
        // Create the sprite node with the texture
        let sprite = SKSpriteNode(texture: texture)
        sprite.size = size
        sprite.physicsBody = SKPhysicsBody(texture: texture, size: size)
        return sprite
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        scene?.physicsWorld.gravity = CGVector(dx: 0, dy: AppData.gravity)
        if !AppData.hide{
            losslabel.isHidden = AppData.hide
        }
        scorelabel.text = "Score: \(AppData.points)"
        
        if AppData.points == 2{
            cheeses[1].physicsBody?.affectedByGravity = true
        }
//        if AppData.contactCount >= 1{
//            cheeses[0].physicsBody?.velocity = CGVector(dx: 0, dy: -60)
//        }
        
    }
}
