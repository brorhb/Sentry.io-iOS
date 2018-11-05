//
//  ProjectsViewController.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 18/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

class ProjectsViewController: UITableViewController {
    
    let red = UIColor(red:1.00, green:0.25, blue:0.21, alpha:1.0)
    
    let logoutButton: UIBarButtonItem = UIBarButtonItem()
    var projects: [Project] = []
    var bookmarks: [Project] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return bookmarks.count
        }
        return projects.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Bookmarked Projects"
        } else {
            return "Others"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath) as! ProjectTableViewCell
        let bookmarkedCell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath) as! ProjectTableViewCell
        cell.project = projects[indexPath.row]
        if indexPath.section == 0 {
            bookmarkedCell.project = bookmarks[indexPath.row]
            return bookmarkedCell
        } else {
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if #available(iOS 10, *) {
            let feedback = UISelectionFeedbackGenerator.init()
            feedback.selectionChanged()
        }
        let nextScreen = ProjectViewController()
        nextScreen.name = projects[indexPath.row].name
        nextScreen.id = projects[indexPath.row].id
        nextScreen.title = projects[indexPath.row].name
        nextScreen.projectSlug = projects[indexPath.row].slug
        nextScreen.orgSlug = projects[indexPath.row].organization?.slug
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
        tableView.register(ProjectTableViewCell.self, forCellReuseIdentifier: "projectCell")
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
    
    @objc func refresh(_ refreshControl:UIRefreshControl) {
        print("refreshing")
        refreshControl.endRefreshing()
    }
    
    func parseProjectsData (_ projects: Data?) {
        if let data = projects {
            self.projects = JSONParser.parseProjects(data: data)!
            self.bookmarks = self.projects.filter() {
                if let bookmarked = ($0 as Project).isBookmarked {
                    return bookmarked
                } else { return false }
            }
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

}
