//
//  ViewController.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 11/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var tokenInputField: UITextField!
    
    @IBAction func LoginBtn(_ sender: UIButton) {
        guard let token: String = tokenInputField.text else { return }
        UserDefaults.standard.set(token, forKey: "token")
        HTTPHandler.getProjectsJSON(token: token, completionHandler: validateUser)
    }
    
    func validateUser (_ data: Data?) -> Void {
        let alert: UIAlertController = UIAlertController(title: "Error", message: "Invalid token", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        if data != nil{
            UserDefaults.standard.set(true, forKey: "status")
            UserDefaults.standard.set(data, forKey: "projects")
            Switcher.updateRootViewController()
        } else {
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

