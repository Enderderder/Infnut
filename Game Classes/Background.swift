//
//  Background.swift
//  Infnut_New
//
//  Created by Richard Wulansari on 5/11/18.
//  Copyright © 2018 Richard Wulansari. All rights reserved.
//

import SpriteKit
import GameplayKit

class SBackground: SKSpriteNode
{
	let moveSpeed: Float = 30.0;
	
	var moveLeftAction: SKAction?
	
	override init(texture: SKTexture?, color: UIColor, size: CGSize)
	{
		super.init(texture: texture, color: color, size: size);
		SetupBackground();
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder);
		SetupBackground();
	}
	
	func SetupBackground()
	{
		moveLeftAction = SKAction.repeatForever(SKAction.moveBy(x: -frame.width, y: 0.0, duration: 5.0));
		
		// Physics set up
		self.physicsBody?.categoryBitMask = CategoryBitMask.GROUND;
		self.physicsBody?.collisionBitMask = CategoryBitMask.GROUND;
		self.physicsBody?.contactTestBitMask = CategoryBitMask.GROUND;
	}
	
	func ToggleBackgroundMoving(_ b: Bool)
	{
		if (b)
		{
			self.run(moveLeftAction!, withKey: "BackgroundMove");
		}
		else
		{
			self.removeAction(forKey: "BackgroundMove");
		}
	}
	
	
	
}
