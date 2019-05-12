//
//  ViewController.swift
//  asterisk
//
//  Created by t450sMAC on 2019/5/10.
//  Copyright © 2019 t450sMAC. All rights reserved.
//

import UIKit
import SafariServices
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet var highscore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let wow=UserDefaults.standard.string(forKey: "highscore")
        if wow==nil{
            highscore.text="0"
        }
        else{
            highscore.text=wow
        }
    }

    @IBAction func pressurl(_ sender: Any) {
        if let url=URL(string: "https://medium.com/@jack940197"){
            let safari=SFSafariViewController(url: url)
            present(safari, animated: true, completion: nil)
           
        }
    }
    
    @IBAction func notibutton(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "搖飲料"
        content.subtitle = "搖飲料"
        content.body = "搖飲料搖飲料搖飲料搖飲料搖飲料搖飲料搖飲料搖飲料搖飲料搖飲料搖飲料搖飲料搖飲料搖飲料搖飲料搖飲料搖飲料"
        content.badge = 1
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

