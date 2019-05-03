//
//  ViewController.swift
//  Counter
//
//  Created by Len van Zyl on 2019/05/03.
//  Copyright © 2019 LenX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    var startValueSteps: Double = 0
    let endValueSteps: Double = 1500
    let endValueCalories: Double = 2000
    let animationDuration : Double = 4.0
    let animationStartDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.layer.cornerRadius = 20
        secondView.layer.cornerRadius = 20
        firstLabel.textAlignment = .center
        firstLabel.font = UIFont.boldSystemFont(ofSize: 18)
        secondLabel.textAlignment = .center
        secondLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: RunLoop.Mode.default)
    }
    
    @objc func handleUpdate() {
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        if elapsedTime > animationDuration {
            self.firstLabel.text = "\(Int(endValueSteps))"
        }else{
            let percentage = elapsedTime / animationDuration
            let value = percentage * (endValueSteps - startValueSteps)
            self.firstLabel.text = "\(Int(value))"
        }
        if elapsedTime > animationDuration {
            self.secondLabel.text = "\(Int(endValueCalories))"
        }else{
            let percentage = elapsedTime / animationDuration
            let value = percentage * (endValueCalories - startValueSteps)
            self.secondLabel.text = "\(Int(value))"
        }
    }


}

