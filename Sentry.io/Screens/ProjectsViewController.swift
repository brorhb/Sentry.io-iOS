//
//  ProjectsViewController.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 18/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

class ProjectsViewController: UITableViewController {
    
    let logoutButton: UIBarButtonItem = UIBarButtonItem()
    var projects: [Project] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLogoutButton()
        
        if let cachedProjects = UserDefaults.standard.data(forKey: "projects") {
            parseProjectsData(cachedProjects)
        } else {
            if let token = UserDefaults.standard.string(forKey: "token") {
                HTTPHandler.getProjectsJSON(token: token, completionHandler: parseProjectsData)
            }
        }
    }
    
    func parseProjectsData (_ projects: Data?) {
        if let data = projects {
            self.projects = JSONParser.parse(data: data)!
            DispatchQueue.main.async {
                // self.projectsTableView.reload()
            }
        }
    }
    
    @objc func logoutButtonOnClick() {
        UserDefaults.standard.set(false, forKey: "loginStatus")
        Switcher.updateRootViewController()
    }
    
    func setupLogoutButton() {
        logoutButton.title = "Log out"
        logoutButton.target = self
        logoutButton.action = #selector(logoutButtonOnClick)
        self.navigationItem.rightBarButtonItem = logoutButton
    }

}
