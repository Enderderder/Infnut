//
//  SButton.swift
//  Infnut_New
//
//  Created by Richard Wulansari on 3/11/18.
//  Copyright © 2018 Richard Wulansari. All rights reserved.
//

import SpriteKit
import GameplayKit

typealias ButtonActionFunc = () -> Void

class SButton : SKSpriteNode
{
	var m_buttonTouchBeginAct: ButtonActionFunc?
	var m_buttonTouchEndAct: ButtonActionFunc?
	var m_buttonTouchMoveAct: ButtonActionFunc?
	
	override init(texture: SKTexture?, color: UIColor, size: CGSize)
	{
		super.init(texture: texture, color: color, size: size);
		ButtonSetup();
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder);
		ButtonSetup();
	}
	
	func ButtonSetup()
	{
		self.isUserInteractionEnabled = true;
	}
	
	func SetupActionBegin(_ touchBeginAction: @escaping ButtonActionFunc)
	{
		m_buttonTouchBeginAct = touchBeginAction;
	}
	
	func SetupActionEnd(_ touchEndAction: @escaping ButtonActionFunc)
	{
		m_buttonTouchEndAct = touchEndAction;
	}
	
	func SetupActionMove(_ touchMoveAction: @escaping ButtonActionFunc)
	{
		m_buttonTouchMoveAct = touchMoveAction;
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		if (m_buttonTouchBeginAct != nil)
		{
			m_buttonTouchBeginAct!();
		}
        
        // Scale down the button
        self.setScale(0.9);
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		if (m_buttonTouchEndAct != nil)
		{
			m_buttonTouchEndAct!();
		}
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		if (m_buttonTouchMoveAct != nil)
		{
			m_buttonTouchMoveAct!();
		}
        
        
	}
}
