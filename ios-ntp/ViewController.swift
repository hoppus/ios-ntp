//
//  ViewController.swift
//  ios-ntp
//
//  Created by Eugeniy Popov on 12.04.16.
//  Copyright © 2016 Eugeniy Popov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var timerLabel: UILabel!
  
  let clock = NetworkClock.sharedNetworkClock()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let timer = NSTimer(fireDate: NSDate(timeIntervalSinceNow: 1.0), interval: 1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)
    
  }
  
  func update() {
    
    let networkTime = clock.networkTime
    let trust = clock.trustMe
    
    if trust {
      timerLabel.text = "Internet time \(networkTime)"
    }
    
  }
  
  
  
}

