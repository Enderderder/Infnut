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
	var PlayeButton =  SButton();
	var ExitButton = SButton();
	
	override func didMove(to view: SKView)
	{
		if let playButton = self.childNode(withName: "PlayeButton") as? SButton
		{
			self.PlayeButton = playButton;
		}
		//PlayeButton.SetupActionBegin {}
		
		
		
		if let exitButton = self.childNode(withName: "ExitButton") as? SButton
		{
			self.ExitButton = exitButton;
		}
		ExitButton.SetupActionBegin { exit(0); }
		
		
	}
	
	override func update(_ currentTime: TimeInterval)
	{
		
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		//let touch = touches.first;
		//let touchLocation = touch!.location(in: self);
		
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		
	}
	
	override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		
	}
}
