//
//  Enemy.swift
//  Infnut_New
//
//  Created by Richard Wulansari on 5/11/18.
//  Copyright © 2018 Richard Wulansari. All rights reserved.
//

import SpriteKit
import GameplayKit

class SEnemy: SKSpriteNode
{
	
	// The moving speed of the enemy
	let m_movingSpeed = 300.0;
	
	override init(texture: SKTexture?, color: UIColor, size: CGSize)
	{
		super.init(texture: texture, color: color, size: size);
		SetupEnemy();
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder);
		SetupEnemy();
	}
	
	func SetupEnemy()
	{
		// Config
		self.name = "Enemy";
		
		// Texture Setup
		self.texture = SKTexture(imageNamed: "Block");
		self.size = CGSize(width: 89, height: 445);
		
		// Set the physics property
		self.physicsBody = SKPhysicsBody(rectangleOf: self.size);
		self.physicsBody?.mass = 1.0;
		self.physicsBody?.affectedByGravity = false;
		self.physicsBody?.allowsRotation = false;
		self.physicsBody?.friction = 0.0;
		self.physicsBody?.linearDamping = 0.0;
		self.physicsBody?.restitution = 0.0;
		self.physicsBody?.categoryBitMask = CategoryBitMask.ENEMY;
		self.physicsBody?.contactTestBitMask = CategoryBitMask.COLLISION
	}
	
	func StartMovement()
	{
		self.physicsBody?.velocity = CGVector(dx: -m_movingSpeed, dy: 0);
	}
	
}
