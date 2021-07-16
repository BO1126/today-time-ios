//
//  ViewController.swift
//  TodayTime
//
//  Created by 이정우 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {
    
    var mTimer : Timer?
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var nowTime : UILabel!

    override func viewDidLoad() {
        let todayTime = Date()
        dateFormatter.dateFormat = "HH : mm : ss"
        super.viewDidLoad()
        nowTime.text = dateFormatter.string(from: todayTime)
        startTimer()
    }
    
    func startTimer(){
        if let timer = mTimer {
                    if !timer.isValid {
                        mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCallback), userInfo: nil, repeats: true)
                    }
                }else{
                    mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCallback), userInfo: nil, repeats: true)
                }

    }
    
    @objc func timeCallback(){
        let todayTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH : mm : ss"
        makeCATransitionLabel(nowTime)
        nowTime.text = dateFormatter.string(from: todayTime)
    }
    
    func makeCATransitionLabel(_ label: UILabel) {
        let transition = CATransition()
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.duration = 0.8
        transition.type = .push
        transition.subtype = .fromTop
        nowTime.layer.add(transition, forKey: CATransitionType.push.rawValue)
        
    }
    
    @IBAction func touchUpStartNotificationButton(){
        
    }



}

