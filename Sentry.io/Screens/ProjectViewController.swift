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
    
    let red = UIColor(red:1.00, green:0.25, blue:0.21, alpha:1.0)
    
    var issues: [Issue] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issues.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "issueCell", for: indexPath) as! IssueTableViewCell
        cell.issue = issues[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if #available(iOS 10, *) {
            let feedback = UISelectionFeedbackGenerator.init()
            feedback.selectionChanged()
        }
        let nextScreen = IssueViewController()
        nextScreen.issue = issues[indexPath.row]
        nextScreen.title = issues[indexPath.row].eventID
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
        tableView.register(IssueTableViewCell.self, forCellReuseIdentifier: "issueCell")
        if let key = name {
            if let cachedIssues = UserDefaults.standard.data(forKey: key) {
                parseIssuesData(cachedIssues)
            } else {
                fetchIssues()
            }
        }
    }
    
    @objc func refresh(_ refreshControl: UIRefreshControl) {
        print("refreshing")
        fetchIssues()
        refreshControl.endRefreshing()
    }
    
    func fetchIssues () {
        if let token = UserDefaults.standard.string(forKey: "token") {
            HTTPHandler.getIssuesJSON(token: token, orgSlug: orgSlug!, projectSlug: projectSlug!, completionHandler: parseIssuesData)
        }
    }
    
    func parseIssuesData (_ issues: Data?) {
        if UserDefaults.standard.data(forKey: name!) == nil || UserDefaults.standard.data(forKey: name!) != issues  {
            UserDefaults.standard.set(issues, forKey: name!)
        }
        if let data = issues {
            self.issues = JSONParser.parseIssues(data: data)!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}
