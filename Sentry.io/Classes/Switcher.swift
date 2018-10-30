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
        DispatchQueue.main.async {
            let loginStatus = UserDefaults.standard.bool(forKey: "loginStatus")
            let loginViewController = LoginViewController()
            let projectsViewController = ProjectsViewController()
            projectsViewController.title = "Projects"
            let navigationController = UINavigationController(rootViewController: projectsViewController)
            var rootViewController: UIViewController
            if loginStatus == true {
                rootViewController = navigationController
            } else {
                rootViewController = loginViewController
            }
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = rootViewController
            appDelegate.window?.makeKeyAndVisible()
        }
    }
}
