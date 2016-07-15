//
//  ViewController.swift
//  EqaulizerDemo
//
//  Created by Kiran Patel on 7/7/16.
//  Copyright © 2016  SOTSYS175. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewEqualizer: kEqualizerView!
    @IBOutlet var viewEqualizerHorizontal: kEqualizerView!
    override func viewDidLoad() {
        super.viewDidLoad()
               // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
     //   viewEqualizer = kEqualizerView(frame: viewEqualizer.frame)
        viewEqualizer.backgroundColor = UIColor.clearColor()
        viewEqualizer.barColor = UIColor.purpleColor()
        viewEqualizer.barBGColor = UIColor.grayColor()
        viewEqualizer.initWithDirection(Direction.leftToRight)
        
      //  viewEqualizerHorizontal = kEqualizerView(frame: viewEqualizerHorizontal.frame)
        viewEqualizerHorizontal.backgroundColor = UIColor.clearColor()
        viewEqualizerHorizontal.barColor = UIColor.blackColor()
        viewEqualizerHorizontal.barBGColor = UIColor.clearColor()
        viewEqualizerHorizontal.initWithDirection(Direction.bottomToTop)
        
    }
    @IBAction func btnStartPressed(sender: AnyObject) {
        viewEqualizer.start()
          viewEqualizerHorizontal.start()
    }
    @IBAction func btnStopPressed(sender: AnyObject) {
        viewEqualizer.stop()
        viewEqualizerHorizontal.stop()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

