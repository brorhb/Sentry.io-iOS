//
//  IssueViewController.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 24/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class IssueViewController: UITableViewController {
    
    var tagsArray: [Tags] = []
    var date: String?
    var browserName: String?
    var osName: String?
    var idString: String?
    
    var issue: Issue? {
        didSet {
            guard let issueItem = issue else { return }
            if let contexts = issueItem.contexts {
                print(contexts)
                if let browser = contexts.browser?.name {
                    browserName = "Browser name: \(browser)"
                }
                if let os = contexts.os?.name {
                    osName = "OS name: \(os)"
                }
            }
            if let dateRecived = issueItem.dateReceived {
                date = "Date recived: \(dateRecived)"
            }
            if let id = issueItem.eventID {
                idString = "Event ID: \(id)"
            }
            if let tags = issueItem.tags {
                tagsArray = tags
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "General"
        } else {
            return "Meta tags"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return tagsArray.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tagsCell = tableView.dequeueReusableCell(withIdentifier: "issueValueCell", for: indexPath) as! IssueItemTableViewCell
        let generalCell = tableView.dequeueReusableCell(withIdentifier: "generalCell", for: indexPath) as! GeneralIssueCell
        if indexPath.section == 0 {
            if date != nil {
                generalCell.date = date
            }
            if browserName != nil {
                generalCell.browserName = browserName
            }
            if idString != nil {
                generalCell.eventID = idString
            }
            if osName != nil {
                generalCell.osName = osName
            }
            return generalCell
        } else {
            tagsCell.tagsFromIssue = tagsArray[indexPath.row]
            return tagsCell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(IssueItemTableViewCell.self, forCellReuseIdentifier: "issueValueCell")
        tableView.register(GeneralIssueCell.self, forCellReuseIdentifier: "generalCell")
        tableView.separatorColor = .white
    }
    
}
