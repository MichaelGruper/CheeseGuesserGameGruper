//
//  GameViewController.swift
//  CheeseGuesserGameGruper
//
//  Created by MICHAEL GRUPER on 2/26/25.
//

import UIKit
import SpriteKit
import GameplayKit

class Cheese{
    var name = String()
    var image = UIImage()
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}

class AppData{
    static var points = 0
    static var gravity = 0.0
    static var hide = true
}

class GameViewController: UIViewController {

    var cheeses = [Cheese]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cheeses.append(Cheese(name: "cheddar", image: UIImage(named: "cheddar")!))
        cheeses.append(Cheese(name: "brie", image: UIImage(named: "brie")!))
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    @IBAction func guessButton1Action(_ sender: UIButton) {
        //gouda button as of right now
        AppData.gravity = 100
        AppData.hide = false
    }
    @IBAction func guessButton2Action(_ sender: UIButton) {
        //brie button as of now
        AppData.gravity = 100
        AppData.hide = false
    }
    @IBAction func guessButton3Action(_ sender: UIButton) {
        //correct button for initial test/cheddar button
        AppData.gravity = -5
        AppData.points += 1
    }
    @IBAction func musicButtonAction(_ sender: UIButton) {
        
    }
}
