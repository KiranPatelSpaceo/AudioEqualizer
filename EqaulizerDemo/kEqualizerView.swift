//
//  kEqualizerView.swift
//  EqaulizerDemo
//
//  Created by Kiran Patel on 7/7/16.
//  Copyright © 2016  SOTSYS175. All rights reserved.
//

import UIKit
enum Direction {
    case leftToRight
    case bottomToTop
}
class kEqualizerView: UIView {
    
    var timer = NSTimer()
    var arryBar = NSArray()
    var numberOfBars : Int = 0
    var barHeight  : UInt32 = 0
    var widthOfBar : Int = 0
    var direction : Direction = Direction.leftToRight
    var barColor : UIColor = UIColor.redColor()
    var barBGColor : UIColor = UIColor.blackColor()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    internal func initWithDirection(direction:Direction){
        self.direction = direction
        let widthOfBar : Int = 5
        let kPadding : Int = 8
        let arrayTemp  = NSMutableArray()
         if self.direction == Direction.leftToRight {
            
            self.numberOfBars = Int(self.frame.height/CGFloat((widthOfBar+kPadding)))
            
         }else{
            
            self.numberOfBars = Int(self.frame.width/CGFloat((widthOfBar+kPadding)))

        }
        for i in 0 ... numberOfBars{
            
            let xPos : CGFloat = CGFloat((i*widthOfBar)+(i*kPadding))
            let width : CGFloat = CGFloat(widthOfBar)
            
            if self.direction == Direction.leftToRight {
                
                let imgViewBG : UIImageView = UIImageView.init(frame: CGRectMake(0, xPos,self.frame.width, width))
                imgViewBG.backgroundColor = barBGColor
                let imgView : UIImageView = UIImageView.init(frame: CGRectMake(0, xPos, 1, width))
                imgView.backgroundColor = barColor
                self.addSubview(imgViewBG)
                self.addSubview(imgView)
                imgViewBG.clipsToBounds = true
                imgView.clipsToBounds = true
                arrayTemp.addObject(imgView)
                
            }else{
                
                let imgViewBG : UIImageView = UIImageView.init(frame: CGRectMake(xPos, 0,width, self.frame.height))
                imgViewBG.backgroundColor = barBGColor
                let imgView : UIImageView = UIImageView.init(frame: CGRectMake(xPos, 0, width, 1))
                imgView.backgroundColor = barColor
                self.addSubview(imgViewBG)
                self.addSubview(imgView)
                imgViewBG.clipsToBounds = true
                imgView.clipsToBounds = true
                arrayTemp.addObject(imgView)
            }
            
        }
        if self.direction == Direction.leftToRight {
            
            self.barHeight = UInt32(self.frame.width)
            
        }else{
            
            self.barHeight = UInt32(self.frame.height)
             self.layer.transform = CATransform3DConcat(self.layer.transform, CATransform3DMakeRotation(CGFloat(M_PI), 1.0, 0.0, 0.0))
        }
        
        self.arryBar = arrayTemp as NSArray
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(kEqualizerView.stop), name: "StopTimer", object: nil)
    }
    func stop() {
        
        self.timer.invalidate()
    }
    func start() {
        
        self.hidden = false
        self.timer.invalidate()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.35, target: self, selector: #selector(kEqualizerView.animation), userInfo: nil, repeats: true)
    }
    func animation() {
        
        UIView.animateWithDuration(0.35) {
            
            for  bar  in self.arryBar {
                let barNew : UIImageView = bar as! UIImageView
                var rect : CGRect = barNew.frame
                if self.direction == Direction.leftToRight {
                    rect.size.width = CGFloat((arc4random() % self.barHeight) + 1)
                }else{
                    rect.size.height = CGFloat((arc4random() % self.barHeight) + 1)
                }
                barNew.frame = rect
            }
        }
    }
}
