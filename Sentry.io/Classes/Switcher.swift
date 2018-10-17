//
//  Switcher.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 15/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

class Switcher {
    static func updateRootViewController () {
        let status = UserDefaults.standard.bool(forKey: "status")
        var rootViewController: UIViewController
        if status == true {
            rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNavigationController") as! MainNavigationController
        } else {
            rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginViewController") as! LoginController
        }
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootViewController
    }
}
