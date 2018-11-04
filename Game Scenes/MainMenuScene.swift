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
    
	var PlayeButton =  SButton();
	var ExitButton = SButton();
	
	override func didMove(to view: SKView)
	{
		if let playButton = self.childNode(withName: "PlayeButton") as? SButton
		{
			self.PlayeButton = playButton;
		}
        PlayeButton.SetupActionEnd { self.LoadGameScene(); }
		
		if let exitButton = self.childNode(withName: "ExitButton") as? SButton
		{
			self.ExitButton = exitButton;
		}
		ExitButton.SetupActionEnd { exit(0); }
		
	}
	
	override func update(_ currentTime: TimeInterval)
	{
		
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{
        let touch = touches.first;
        let touchLocation = touch!.location(in: self);
        let touchedNode = self.atPoint(touchLocation);
        
        touchedNode.touchesBegan(touches, with: event);
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
	{
        let touch = touches.first;
        let touchLocation = touch!.location(in: self);
        let touchedNode = self.atPoint(touchLocation);
        
        touchedNode.touchesMoved(touches, with: event);
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
	{
        let touch = touches.first;
        let touchLocation = touch!.location(in: self);
        let touchedNode = self.atPoint(touchLocation);
        
        touchedNode.touchesEnded(touches, with: event);
	}
	
	override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
	{
        let touch = touches.first;
        let touchLocation = touch!.location(in: self);
        let touchedNode = self.atPoint(touchLocation);
        
        touchedNode.touchesCancelled(touches, with: event);
	}
    
    func LoadGameScene()
    {
        let newScene = GameScene(size: (self.view?.bounds.size)!);
        let transition = SKTransition.reveal(with: .down, duration: 2);
        self.view?.presentScene(newScene, transition: transition);
        transition.pausesOutgoingScene = true;
        transition.pausesIncomingScene = false;
    }
    
}
