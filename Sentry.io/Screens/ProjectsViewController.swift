//
//  ProjectsViewController.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 18/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let red = UIColor(red:1.00, green:0.25, blue:0.21, alpha:1.0)
    
    
    let logoutButton: UIBarButtonItem = UIBarButtonItem()
    var projects: [Project] = []
    let projectsTableView = UITableView()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath) as! ProjectTableViewCell
        cell.project = projects[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        projectsTableView.register(ProjectTableViewCell.self, forCellReuseIdentifier: "projectCell")
        view.backgroundColor = .white
        setupProjectsTableView()
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
                //self.projectsTableView.reloadData()
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
    
    func setupProjectsTableView () {
        projectsTableView.dataSource = self
        self.view.addSubview(projectsTableView)
        setupProjectsTableViewConstraints()
    }
    
    func setupProjectsTableViewConstraints () {
        projectsTableView.translatesAutoresizingMaskIntoConstraints = false
        projectsTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        projectsTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        projectsTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        projectsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

}
