//
//  GameScene.swift
//  Infnut_New
//
//  Created by Richard Wulansari on 3/11/18.
//  Copyright © 2018 Richard Wulansari. All rights reserved.
//

import SpriteKit
import GameplayKit

// Configurate the physic contact layer
enum CategoryBitMask
{
    static let DEFAULT: UInt32  = 0b0001;
    static let PLAYER:  UInt32  = 0b0010;
    static let ENEMY: UInt32    = 0b0100;
    static let GROUND: UInt32   = 0b1000;
}

class GameScene: SKScene, SKPhysicsContactDelegate
{
    var player: SPlayer?
    
    override func didMove(to view: SKView)
	{
        CreatePlayer();
    }
	
	override func update(_ currentTime: TimeInterval)
	{
        player?.Update(currentTime);
	}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		
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
    
    func CreateBackground()
    {
        
    }
    
    func CreatePlayer()
    {
        player = SPlayer();
        player!.position = CGPoint(x: self.frame.midX - 150, y: self.frame.midY);
        self.addChild(player!);
    }
    
    
}
