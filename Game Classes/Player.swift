//
//  Player.swift
//  Infnut_New
//
//  Created by Richard Wulansari on 5/11/18.
//  Copyright © 2018 Richard Wulansari. All rights reserved.
//

import SpriteKit
import GameplayKit

class SPlayer: SKSpriteNode
{
	// Does the ship able to control by the player
	var m_bPlayerControl: Bool = true;
	
	// Is the ship thrusting up
	var m_bThrusting: Bool = false;
	
	// The thrusting speed of the ship
	let m_thrustingForce = 500.0;
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize)
    {
        super.init(texture: texture, color: color, size: size);
        SetupPlayer();
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
        SetupPlayer();
    }
    
    func SetupPlayer()
    {
        // Set the physics property
		self.physicsBody?.categoryBitMask = CategoryBitMask.PLAYER;
		self.physicsBody?.contactTestBitMask = CategoryBitMask.COLLISION;
    }
    
    func Update(_ currentTime: TimeInterval)
    {
        if (m_bThrusting && m_bPlayerControl)
		{
			self.physicsBody?.applyForce(CGVector(dx: 0.0, dy: m_thrustingForce));
		}
    }
    
	func ToogleThrust(_ b: Bool)
	{
		m_bThrusting = b;
	}
    
}
