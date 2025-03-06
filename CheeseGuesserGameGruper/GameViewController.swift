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
    var funFact = String()
    
    init(name: String, image: UIImage, funFact: String) {
        self.name = name
        self.image = image
        self.funFact = funFact
    }
}

class AppData{
    static var points = 0
    static var gravity = 0.0
    static var hide = true
    static var contactCount = 0
    static var cheeseArrCount = 0
}

class GameViewController: UIViewController {
    //button array
    @IBOutlet var buttons: [UIButton]!
    
    //i will need this for later when I display the cheese names, i want parallel with points so that I can correspond a point value to a cheese
    //var cheeses = [Cheese]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        cheeses.append(Cheese(name: "cheddar", image: UIImage(named: "cheddar")!))
//        cheeses.append(Cheese(name: "brie", image: UIImage(named: "brie")!))
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
        if AppData.points == 1{
            AppData.gravity = -5
            AppData.points += 1
        }
        else{
            AppData.gravity = 100
            AppData.hide = false
        }
    }
    @IBAction func guessButton3Action(_ sender: UIButton) {
        //correct button for initial test/cheddar button
        if AppData.points == 0{
            AppData.gravity = -5
            AppData.points += 1
        }
        else{
            AppData.gravity = 100
            AppData.hide = false
        }
    }
    @IBAction func musicButtonAction(_ sender: UIButton) {
        
    }
}
