//
//  GameScene.swift
//  AngryBirdCN
//
//  Created by Andrea Hernandez on 1/15/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var bird = SKSpriteNode()
    
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var box6 = SKSpriteNode()
    
    var gameStarter = false
    
    var originalPosition: CGPoint?
    
    enum ColliderTypes: UInt32 {
        
        case Bird = 1
        case Box = 2
//        case Ground = 3
//        case Tree = 8
        
    }
    
    override func didMove(to view: SKView) {
        
//        let texture = SKTexture(imageNamed: "bird")
//        bird = SKSpriteNode(texture: texture)
//        bird.position = CGPoint(x: 0, y: 0)
//        bird.size = CGSize(width: self.frame.width / 16, height: self.frame.height / 12)
//        bird.zPosition = 1
//        self.addChild(bird)
                
        //Physics Body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
        //bird
        bird = childNode(withName: "bird") as! SKSpriteNode
        
        let birdTexture = SKTexture(imageNamed: "bird")
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 13)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.15
        originalPosition = bird.position
        
        bird.physicsBody?.contactTestBitMask = ColliderTypes.Bird.rawValue
        bird.physicsBody?.categoryBitMask = ColliderTypes.Bird.rawValue
        bird.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        //Box
        let boxTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: boxTexture.size().width / 11, height: boxTexture.size().height / 11)
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 0.3
        
        box1.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 0.3
        
        box2.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.3
        
        box3.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.3
        
        box4.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.3
        
        box5.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
        box6 = childNode(withName: "box6") as! SKSpriteNode
        box6.physicsBody = SKPhysicsBody(rectangleOf: size)
        box6.physicsBody?.isDynamic = true
        box6.physicsBody?.affectedByGravity = true
        box6.physicsBody?.allowsRotation = true
        box6.physicsBody?.mass = 0.3
        
        box6.physicsBody?.collisionBitMask = ColliderTypes.Bird.rawValue
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.collisionBitMask == ColliderTypes.Bird.rawValue || contact.bodyB.collisionBitMask == ColliderTypes.Bird.rawValue {
            
            print("contact")
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /*
        bird.physicsBody?.applyImpulse(CGVector(dx: 100, dy: 200))
        bird.physicsBody?.affectedByGravity = true
        */
        if gameStarter == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                            bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarter == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                            bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarter == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
//                                bird.position = touchLocation
                                
                                let dx = -(touchLocation.x - originalPosition!.x)
                                let dy = -(touchLocation.y - originalPosition!.y)
                                
                                let impulse = CGVector(dx: dx, dy: dy)
                                
                                bird.physicsBody?.applyImpulse(impulse)
                                bird.physicsBody?.affectedByGravity = true
                                
                                gameStarter = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if let birdPhysicsBody = bird.physicsBody {
            
            if birdPhysicsBody.velocity.dx <= 0.1 && birdPhysicsBody.velocity.dy <= 0.1 && birdPhysicsBody.angularVelocity <= 0.1 && gameStarter == true {
                
                bird.physicsBody?.affectedByGravity = false
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                bird.zPosition = 1
                bird.position = originalPosition!
                gameStarter = false
            }
        }
    }
}
