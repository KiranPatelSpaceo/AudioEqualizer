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
    override func viewDidLoad() {
        super.viewDidLoad()
               // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
        viewEqualizer.backgroundColor = UIColor.clearColor()
        viewEqualizer.barColor = UIColor.purpleColor()
        viewEqualizer.barBGColor = UIColor.grayColor()
        viewEqualizer.initWithDirection(Direction.leftToRight)
        
    }
    @IBAction func btnStartPressed(sender: AnyObject) {
        viewEqualizer.start()
    }
    @IBAction func btnStopPressed(sender: AnyObject) {
        viewEqualizer.stop()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

