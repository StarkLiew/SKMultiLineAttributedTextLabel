//
//  SKMultiLineAttributedLabel.swift
//
//
//  Created by StarkLiew on 23/1/17.
//  Copyright © 2017 StarkLiew. All rights reserved.
//

import SpriteKit


class SKMultiLineAttributedLabel: SKNode{
   
    public var text:String
    private var texts:[String] = []
    public var attibutedTexts:[SKLabelNode] = []
    public var spriteNode: SKSpriteNode

    
    init(text: String, width: CGFloat, height: CGFloat, color: UIColor){
          self.spriteNode = SKSpriteNode(color: color, size: CGSize(width: width, height: height))
          self.text = text
          self.texts = self.text.characters.split{$0 == " "}.map(String.init)
        
        
          self.spriteNode.anchorPoint = CGPoint(x: 0.5, y: 1)
          self.spriteNode.zPosition = 0
          super.init()
          self.addChild(self.spriteNode)
          self.makeLabel()
        
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeLabel(){
        
        //let TextWrap:SKShapeNode = SKShapeNode(rect: CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height))
        
        //TextWrap.fillColor = self.spriteNode.color
        
        //self.addChild(TextWrap)
        
        for text in texts{
            
            let label = SKLabelNode(text: text)
            label.color = UIColor.black
            label.fontSize = 60
            label.fontName = "Avenir-Heavy"
            label.fontColor = UIColor.white
            label.zPosition = 1
            label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
            self.attibutedTexts.append(label)
            
        }
        
        
        let initialX = self.spriteNode.frame.minX + 20
        let initialY = self.spriteNode.frame.maxY - self.attibutedTexts[0].frame.height - 10
        var nextX = initialX
        var nextY = initialY
        var widths = CGFloat(0.0)
        
        
        for i in 0..<self.attibutedTexts.count{
            let item = self.attibutedTexts[i]
            
            widths = widths + item.frame.width
            
            if(widths > (self.spriteNode.frame.width/1.5)){
                nextX = initialX
                nextY = nextY - self.attibutedTexts[0].frame.height - 10
                widths = CGFloat(0.0)
                
            }

            
            let box = SKSpriteNode(color: UIColor.clear, size: CGSize(width: item.frame.size.width, height: item.frame.height))
            
            box.position = CGPoint(x: nextX, y: nextY)
            box.addChild(item)
            box.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            
            self.spriteNode.addChild(box)
            nextX = nextX + item.frame.width + CGFloat(10)
            
            
            
            
        }
        

    }



 
}

