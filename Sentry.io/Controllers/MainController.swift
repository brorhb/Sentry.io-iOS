//
//  ViewController.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 11/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

class MainController: UITableViewController {
    
    var projects: [Project] = []
    
    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
        UserDefaults.standard.set(false, forKey: "status")
        Switcher.updateRootViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cachedProjects = UserDefaults.standard.data(forKey: "projects") {
            parseProjectsData(projects: cachedProjects)
        } else {
            if let token = UserDefaults.standard.string(forKey: "token") {
                HTTPHandler.getProjectsJSON(token: token, completionHandler: parseProjectsData)
            }
        }
    }
    
    func parseProjectsData (projects: Data?) {
        if let data = projects {
            self.projects = ProjectsDataProcessor.mapJSONToProjects(data: data)!
            DispatchQueue.main.async {
                // self.projectsTableView.reload()
            }
        }
    }

}

