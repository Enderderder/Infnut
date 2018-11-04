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
    var m_bPlayerControl: Bool = false;
    
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
        // Config
        self.name = "Player";
        
        // Set the texture of the player
        self.texture = SKTexture(imageNamed: "SpaceShip");
        
        // Set the physics property
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size);
        self.physicsBody?.categoryBitMask = CategoryBitMask.PLAYER;
        self.physicsBody?.collisionBitMask = CategoryBitMask.PLAYER;
        self.physicsBody?.contactTestBitMask = CategoryBitMask.PLAYER;
        self.physicsBody?.affectedByGravity = true;
        self.physicsBody?.allowsRotation = false;
        self.physicsBody?.restitution = 0.0;
        self.physicsBody?.linearDamping = 0.5;
        self.physicsBody?.mass = 1.0;
    }
    
    func Update(_ currentTime: TimeInterval)
    {
        
    }
    
    
    
}
