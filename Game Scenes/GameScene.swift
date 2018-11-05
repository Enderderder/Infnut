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
    static let DEFAULT: UInt32  = 1;
    static let PLAYER:  UInt32  = 2;
    static let ENEMY: UInt32    = 3;
    static let GROUND: UInt32   = 4;
	static let COLLISION: UInt32 = 5;
}

class GameScene: SKScene, SKPhysicsContactDelegate
{
	// Get the user default
	let userDefault = UserDefaults.standard;

	// Camera node
	var mainCamera: SKCameraNode!
	
	// Player variable
    var player: SPlayer?
	
	// Score variable
	var distanceMoved: Int = 0;
	var scoreLabel: SKLabelNode?
	
	// Labels
	var instructionLabel: SKLabelNode?
	
	// Background pieces
	var backgroundLeft: SBackground?
	var backgroundMid: SBackground?
	var backgroundRight: SBackground?
	
	// Global control variable
	var bGameRunning = false;
	
    override func didMove(to view: SKView)
	{
		// Get the node from the sks scene
        GetPlayer();
		GetLabels();
		GetBackground();
		
		// Reset the score to 0
		ResetScore();
		
		// Create the camera node that follow the player
		CreateCamera();
		
		// Set up delegate
		self.physicsWorld.contactDelegate = self;
    }
	
	override func update(_ currentTime: TimeInterval)
	{
		// Do the update function in player class
        player?.Update(currentTime);
		
		// Update the background position
		UpdateBackgrounds();
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		if (bGameRunning == false)
		{
			StartGame();
		}
		
		// Give thrust upwards
		player?.ToogleThrust(true);
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		// Turn off the thrust of the player ship
		player?.ToogleThrust(false);
	}
	
	func StartGame()
	{
		// Start the game
		bGameRunning = true;
		
		// Remove the instruction label
		instructionLabel?.run(SKAction.removeFromParent());
		
		// Start the movement of the background
		ToggleBackgroundsMovement(true);
		
		// Player start free fall without control
		player?.physicsBody?.affectedByGravity = true;
		
		// Start counting the score
		StartCountingScore();
		
		// Start spawn enemies
		StartSpawnEnemy();
	}
	
	func EndGame()
	{
		// End the game
		bGameRunning = false;
		
		// Stop the movement of the background
		ToggleBackgroundsMovement(false);
		
		// Set the score to user default
		userDefault.set(distanceMoved, forKey: "Score");
		if (distanceMoved > userDefault.integer(forKey: "HighScore"))
		{
			userDefault.set(distanceMoved, forKey: "HighScore");
		}
		let newScene = SKScene(fileNamed: "MainMenuScene");
		let transition = SKTransition.reveal(with: .up, duration: 2);
		self.view?.presentScene(newScene!, transition: transition);
		transition.pausesOutgoingScene = true;
		transition.pausesIncomingScene = false;
	}
	
	func SpawnEnemy()
	{
		// Create an enemy
		let newEnemy = SEnemy();
		self.addChild(newEnemy);
		
		// Decalre 3 spawn points
		let SpawnPoint_1 = CGPoint(x: 727.5, y: 288);
		let SpawnPoint_2 = CGPoint(x: 727.5, y: -288);
		let SpawnPoint_3 = CGPoint(x: 727.5, y: 0.0);
		
		// Move the enemy to the position
		let point = Int.random(in: 1...3);
		if (point == 1)
		{
			newEnemy.position = SpawnPoint_1;
		}
		else if (point == 2)
		{
			newEnemy.position = SpawnPoint_2;
			newEnemy.zRotation = 3.14;
		}
		else if (point == 3)
		{
			newEnemy.position = SpawnPoint_3;
		}
		
		// Start the movement of the enemy
		newEnemy.StartMovement();
	}
	
	func StartCountingScore()
	{
		if (bGameRunning)
		{
			let wait: SKAction = SKAction.wait(forDuration: 0.1);
			let finishTimer: SKAction = SKAction.run
			{
				self.distanceMoved += 1;
				self.scoreLabel?.text = String(self.distanceMoved);
				self.StartCountingScore();
			}
			
			let seq: SKAction = SKAction.sequence([wait, finishTimer]);
			self.run(seq);
		}
	}
	
	func StartSpawnEnemy()
	{
		if (bGameRunning)
		{
			let wait: SKAction = SKAction.wait(forDuration: 3);
			let finishTimer: SKAction = SKAction.run
			{
				self.SpawnEnemy();
				self.StartSpawnEnemy();
			}
			
			let seq: SKAction = SKAction.sequence([wait, finishTimer]);
			self.run(seq);
		}
	}
	
	func ResetScore()
	{
		distanceMoved = 0;
		scoreLabel?.text = String(distanceMoved);
	}
	
	func UpdateBackgrounds()
	{
		if (backgroundLeft!.position.x <= -backgroundLeft!.size.width)
		{
			backgroundLeft?.position =
				CGPoint(x: backgroundMid!.position.x + backgroundMid!.size.width, y: backgroundLeft!.position.y);
		}
		
		if (backgroundMid!.position.x <= -backgroundMid!.size.width)
		{
			backgroundMid?.position =
				CGPoint(x: backgroundRight!.position.x + backgroundRight!.size.width, y: backgroundMid!.position.y);
		}
		
		if (backgroundRight!.position.x <= -backgroundRight!.size.width)
		{
			backgroundRight?.position =
				CGPoint(x: backgroundLeft!.position.x + backgroundLeft!.size.width, y: backgroundRight!.position.y);
		}
	}
	
    func GetBackground()
    {
		backgroundLeft = self.childNode(withName: "BackgroundLeft") as? SBackground
		backgroundMid = self.childNode(withName: "BackgroundMid") as? SBackground
		backgroundRight = self.childNode(withName: "BackgroundRight") as? SBackground
		
		let bgUp = self.childNode(withName: "BackgroundUp") as! SKSpriteNode
		bgUp.physicsBody?.categoryBitMask = CategoryBitMask.DEFAULT;
		bgUp.physicsBody?.collisionBitMask = CategoryBitMask.DEFAULT;
		bgUp.physicsBody?.contactTestBitMask = CategoryBitMask.GROUND;
		
		let bgBottom = self.childNode(withName: "BackgroundBottom") as! SKSpriteNode
		bgBottom.physicsBody?.categoryBitMask = CategoryBitMask.DEFAULT;
		bgBottom.physicsBody?.collisionBitMask = CategoryBitMask.DEFAULT;
		bgBottom.physicsBody?.contactTestBitMask = CategoryBitMask.GROUND;
		
    }
	
	/* Make backfground move or not **/
	func ToggleBackgroundsMovement(_ b: Bool)
	{
		backgroundLeft?.ToggleBackgroundMoving(b);
		backgroundMid?.ToggleBackgroundMoving(b);
		backgroundRight?.ToggleBackgroundMoving(b);
	}

	/* Get the player node from the sks scene **/
    func GetPlayer()
    {
		player = self.childNode(withName: "Player") as? SPlayer;
    }
	
	/* Get all the label node from the sks scene **/
	func GetLabels()
	{
		scoreLabel = self.childNode(withName: "ScoreCount") as? SKLabelNode;
		instructionLabel = self.childNode(withName: "InstructionLabel") as? SKLabelNode;
	}
	
	/* Contact listener **/
	func didBegin(_ contact: SKPhysicsContact)
	{
		guard let nodeA = contact.bodyA.node else { return }
		guard let nodeB = contact.bodyB.node else { return }
		
		if (nodeA.name == "Player" && nodeB.name == "Enemy")
		{
			EndGame();
		}
		else if (nodeA.name == "Enemy" && nodeB.name == "Player")
		{
			EndGame();
		}
	}
	
	/* Create the camera node **/
	func CreateCamera()
	{
		mainCamera = SKCameraNode();
		mainCamera.setScale(1);
		mainCamera.position = CGPoint(x: 0, y: 0);
		self.camera = mainCamera;
		self.addChild(mainCamera);
	}
}
