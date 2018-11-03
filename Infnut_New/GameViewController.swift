//
//  GameViewController.swift
//  Infnut_New
//
//  Created by Richard Wulansari on 3/11/18.
//  Copyright © 2018 Richard Wulansari. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController
{
    override func viewDidLoad()
	{
		super.viewDidLoad();
        
        if let view = self.view as! SKView?
		{
            // Load the SKScene from 'GameScene.sks'
			let scene = SKScene(fileNamed: "MainMenuScene");
			
			// Set the scale mode to scale to fit the window
			scene?.scaleMode = .aspectFill;
			view.presentScene(scene);
			view.ignoresSiblingOrder = true;
			view.showsFPS = true;
			view.showsNodeCount = true;
        }
    }
	
	override var supportedInterfaceOrientations: UIInterfaceOrientationMask
	{
		if UIDevice.current.userInterfaceIdiom == .phone
		{
			return .landscape;
		}
		else
		{
			return .landscape;
		}
	}
}
