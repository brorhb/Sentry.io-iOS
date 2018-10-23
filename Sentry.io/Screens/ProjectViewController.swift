//
//  ProjectViewController.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 23/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

class ProjectViewController: UITableViewController {
    
    var name: String?
    var id: String?
    var orgSlug: String?
    var projectSlug: String?
    
    var issues: [Issue] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
        if let key = name {
            if let cachedIssues = UserDefaults.standard.data(forKey: key) {
                parseIssuesData(cachedIssues)
            } else {
                if let token = UserDefaults.standard.string(forKey: "token") {
                    HTTPHandler.getIssuesJSON(token: token, orgSlug: orgSlug!, projectSlug: projectSlug!, completionHandler: parseIssuesData)
                }
            }
        }
    }
    
    func parseIssuesData (_ issues: Data?) {
        if let data = issues {
            self.issues = JSONParser.parseIssues(data: data)!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}
