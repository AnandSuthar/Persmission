//
//  ViewController.swift
//  Persmission
//
//  Created by SunarcMAC on 05/05/17.
//  Copyright © 2017 SunarcMAC. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func requestPermission() {
        
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
            
            
            if granted {
                print("granted")
            } else {
                
                // Open settings app
                let alrtController = UIAlertController(title: "Permission for Notifictions was denied", message: "Please enable access to Notifications in Settings app", preferredStyle: .alert)
                alrtController.addAction(UIAlertAction(title: "Show me", style: UIAlertActionStyle.default, handler: { (action) in
                    
                    
                    let url = URL(string: UIApplicationOpenSettingsURLString)
                    if UIApplication.shared.canOpenURL(url!) {
                        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                    }

                    
                }))
                self.present(alrtController, animated: true, completion: nil)
                
            }
            
        }
        UIApplication.shared.registerForRemoteNotifications()

        
    }


}

