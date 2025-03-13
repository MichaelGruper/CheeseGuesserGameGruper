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
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}

class AppData{
    static var points = 0
    static var gravity = 0.0
    static var hide = true
    static var contactCount = 0
    static var cheeseArrCount = 0
    static var isGrav = false
}

class GameViewController: UIViewController {
    //button array
    @IBOutlet var buttons: [UIButton]!
    
    var gs : GameScene!
    
    var correct1 = false
    var correct2 = false
    var correct3 = false
    
    
    var cheeses = [Cheese]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //correct3 = true
          cheeses.append(Cheese(name: "Cheddar", image: UIImage(named: "cheddar")!))
          cheeses.append(Cheese(name: "Brie", image: UIImage(named: "brie")!))
          cheeses.append(Cheese(name: "Asiago", image: UIImage(named: "asiago")!))
          cheeses.append(Cheese(name: "Burrata", image: UIImage(named: "burrata")!))
          cheeses.append(Cheese(name: "Edan", image: UIImage(named: "edan")!))
          cheeses.append(Cheese(name: "Emmental", image: UIImage(named: "emmental")!))
          cheeses.append(Cheese(name: "Fontina", image: UIImage(named: "fontina")!))
          cheeses.append(Cheese(name: "Gouda", image: UIImage(named: "gouda")!))
          cheeses.append(Cheese(name: "Mozzarella", image: UIImage(named: "mozzarella")!))
        generateNames()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                gs = scene as! GameScene
                gs.gvc = self
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
    
    func generateNames(){
        let correctAnswer = Int.random(in: 0..<buttons.count)
        if correctAnswer == 0{
            correct1 = true
        }
        else if correctAnswer == 1{
            correct2 = true
        }
        else{
            correct3 = true
        }
        let correctButton = buttons[correctAnswer]
        var cheeseNameArray = [String]()
        for cheese in cheeses{
            cheeseNameArray.append(cheese.name)
        }
      
            buttons[correctAnswer].titleLabel?.text = cheeseNameArray[AppData.cheeseArrCount]
            //print(cheeseNameArray)
            cheeseNameArray.remove(at: AppData.cheeseArrCount)
        
        //print(cheeseNameArray)
//        buttons[correctAnswer].titleLabel?.text = cheeseNameArray[AppData.points]
        var incorrectButtonsArray = buttons
        incorrectButtonsArray?.remove(at: correctAnswer)
        for i in incorrectButtonsArray!{
            var randomIndex = Int.random(in: 0..<cheeseNameArray.count)
            i.titleLabel?.text = cheeseNameArray[randomIndex]
        }
    }
    
    
    
    @IBAction func guessButton1Action(_ sender: UIButton) {
        //gouda button as of right now
//        AppData.gravity = 100
//        AppData.hide = false
        print("button 1")
        if correct1{
            gs.cheeses[AppData.cheeseArrCount].physicsBody?.affectedByGravity = true
            AppData.gravity = -5
            AppData.isGrav = true
            correct1 = false
        }
        else{
            AppData.gravity = 100
            AppData.hide = false
        }
        
    }
    @IBAction func guessButton2Action(_ sender: UIButton) {
        print("button 2")
        //brie button as of now
        if correct2{
            gs.cheeses[AppData.cheeseArrCount].physicsBody?.affectedByGravity = true
            AppData.gravity = -5
            AppData.isGrav = true
            correct2 = false
            
        }
        else{
            AppData.gravity = 100
            AppData.hide = false
        }
    }
    @IBAction func guessButton3Action(_ sender: UIButton) {
        print("button 3")
        //correct button for initial test/cheddar button
        if correct3{
            gs.cheeses[AppData.cheeseArrCount].physicsBody?.affectedByGravity = true
            AppData.gravity = -5
            AppData.isGrav = true
            correct3 = false
        }
        else{
            AppData.gravity = 100
            AppData.hide = false
        }
    }
    @IBAction func musicButtonAction(_ sender: UIButton) {
        
    }
}
