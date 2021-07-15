//
//  ViewController.swift
//  TodayTime
//
//  Created by 이정우 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {
    
    var mTimer : Timer?
    
    @IBOutlet weak var nowTime : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        // Do any additional setup after loading the view.
    }
    
    func startTimer(){
        if let timer = mTimer {
                    if !timer.isValid {
                        mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
                    }
                }else{
                    mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
                }

    }
    
    @objc func timerCallback(){
        let todayTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH : mm : ss"
        nowTime.text = dateFormatter.string(from: todayTime)
        }




}

