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
    
    @IBOutlet weak var nowSecond : UILabel!
    @IBOutlet weak var nowMinute : UILabel!
    @IBOutlet weak var nowHour   : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let todayTime = Date()
        dateFormatter.dateFormat = "ss"
        let second = 60 - Int(dateFormatter.string(from: todayTime))!
        if second < 10 {
            nowSecond.text = "0"+String(second)
        }else{
            nowSecond.text = String(second)
        }
        
        dateFormatter.dateFormat = "mm"
        let minute = 59 - Int(dateFormatter.string(from: todayTime))!
        if minute < 10 {
            nowMinute.text = "0"+String(minute)
        }else{
            nowMinute.text = String(minute)
        }
        
        dateFormatter.dateFormat = "HH"
        let Hour = 24 - Int(dateFormatter.string(from: todayTime))!
        if Hour < 10 {
            nowHour.text = "0"+String(Hour)
        }else{
            nowHour.text = String(Hour)
        }
        
        startTimer()
    }
    
    func startTimer(){
        if let secondTimer = mTimer {
                    if !secondTimer.isValid {
                        mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(secondCallback), userInfo: nil, repeats: true)
                    }
                }else{
                    mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(secondCallback), userInfo: nil, repeats: true)
                }

    }
    
    @objc func secondCallback(){
        makeCATransitionLabel(nowSecond)
        let todayTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ss"
        let second = 60 - Int(dateFormatter.string(from: todayTime))!
        
        if second == 60{
            makeCATransitionLabel(nowMinute)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "mm"
            let minute = 59 - Int(dateFormatter.string(from: todayTime))!
            
            if minute == 59{
                makeCATransitionLabel(nowHour)
                dateFormatter.dateFormat = "HH"
                let Hour = 24 - Int(dateFormatter.string(from: todayTime))!
                if Hour < 10 {
                    nowHour.text = "0"+String(Hour)
                }else{
                    nowHour.text = String(Hour)
                }
            }
            if minute < 10 {
                nowMinute.text = "0"+String(minute)
            }else{
                nowMinute.text = String(minute)
            }
        }
        if second < 10 {
            nowSecond.text = "0"+String(second)
        }else{
            nowSecond.text = String(second)
        }
    }
    
    func makeCATransitionLabel(_ label: UILabel) {
        let transition = CATransition()
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.duration = 0.8
        transition.type = .push
        transition.subtype = .fromTop
        label.layer.add(transition, forKey: CATransitionType.push.rawValue)
        
    }
    
    @IBAction func touchUpStartNotificationButton(){
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
    }



}

