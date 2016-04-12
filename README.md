#ios-ntp
An application testbed and a network time protocol client for iOS. This is a work in progress.

Created by Gavin Eadie on Oct 17, 2010


#What's the Difference
Better quality results

#How to use
class ViewController: UIViewController {
  
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
