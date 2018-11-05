//
//  MainMenuScene.swift
//  Infnut_New
//
//  Created by Richard Wulansari on 3/11/18.
//  Copyright © 2018 Richard Wulansari. All rights reserved.
//

import SpriteKit
import GameplayKit

class MainMenuScene: SKScene
{
    // Initialize an access to the user default storage
    let userDefault = UserDefaults.standard;
	
	// Gesture
	var tapGesture = UITapGestureRecognizer();
	
	override func didMove(to view: SKView)
	{
		SetUpTapGesture();
		
		// Set the score and high score from storage
		let scoreLabel = self.childNode(withName: "ScoreCount") as! SKLabelNode;
		scoreLabel.text = String(userDefault.integer(forKey: "Score"));
		let highScoreLabel = self.childNode(withName: "HighScoreCount") as! SKLabelNode;
		highScoreLabel.text = String(userDefault.integer(forKey: "HighScore"));
	}
    
    func LoadGameScene()
    {
		view?.removeGestureRecognizer(tapGesture);
		let newScene = SKScene(fileNamed: "GameScene");
        let transition = SKTransition.reveal(with: .down, duration: 2);
        self.view?.presentScene(newScene!, transition: transition);
        transition.pausesOutgoingScene = true;
        transition.pausesIncomingScene = false;
    }
	
	// Bind the action when player tap the screen
	func SetUpTapGesture()
	{
		guard let view = view else {return;}
		tapGesture = UITapGestureRecognizer(target: self, action: #selector(TapAction));
		tapGesture.numberOfTapsRequired = 1;
		view.addGestureRecognizer(tapGesture);
	}
	
	@objc func TapAction(sender: UITapGestureRecognizer)
	{
		var tapLocation = sender.location(in: self.view);
		// map tap location
		tapLocation.y = abs(self.frame.height - tapLocation.y);
		
		// Load game scene when click
		self.LoadGameScene();
	}
}
