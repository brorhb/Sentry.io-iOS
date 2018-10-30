//
//  GeneralIssueCell.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 30/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

class GeneralIssueCell: UITableViewCell {
    
    let dateLabel = UILabel()
    let eventIDLabel = UILabel()
    let browserLabel = UILabel()
    let osLabel = UILabel()
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var date: String? {
        didSet {
            if let dateString = date {
                dateLabel.text = dateString
            }
        }
    }
    var eventID: String? {
        didSet {
            if let id = eventID {
                eventIDLabel.text = id
            }
        }
    }
    var browserName: String? {
        didSet {
            if let browser = browserName {
                browserLabel.text = browser
            }
        }
    }
    var osName: String? {
        didSet {
            if let os = osName {
                osLabel.text = os
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerView)
        setContainerViewConstraints()
        containerView.addSubview(eventIDLabel)
        containerView.addSubview(osLabel)
        containerView.addSubview(browserLabel)
        containerView.addSubview(dateLabel)
        setEventIDLabelConstraints()
        setOsLabelConstraints()
        setBrowserLabelConstraints()
        setDateLabelConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContainerViewConstraints () {
        containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    func setEventIDLabelConstraints () {
        eventIDLabel.translatesAutoresizingMaskIntoConstraints = false
        eventIDLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        eventIDLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        eventIDLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
    }
    
    func setOsLabelConstraints () {
        osLabel.translatesAutoresizingMaskIntoConstraints = false
        osLabel.topAnchor.constraint(equalTo: self.eventIDLabel.bottomAnchor, constant: 8).isActive = true
        osLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        osLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
    }
    
    func setBrowserLabelConstraints () {
        browserLabel.translatesAutoresizingMaskIntoConstraints = false
        browserLabel.topAnchor.constraint(equalTo: self.osLabel.bottomAnchor, constant: 8).isActive = true
        browserLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        browserLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
    }
    
    func setDateLabelConstraints () {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: self.browserLabel.bottomAnchor, constant: 8).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
    }

}
