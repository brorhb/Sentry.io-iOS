//
//  IssueTabelViewCell.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 23/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

class IssueTableViewCell: UITableViewCell {
    
    let gold = UIColor(red:1.00, green:0.72, blue:0.00, alpha:1.0)
    let red = UIColor(red:1.00, green:0.25, blue:0.21, alpha:1.0)
    
    let platformLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateReceivedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var issue: Issue? {
        didSet {
            guard let issueItem = issue else { return }
            if let platform = issueItem.platform {
                platformLabel.text = platform
            }
            if let dateRecived = issueItem.dateReceived {
                dateReceivedLabel.text = dateRecived
            }
            if let type = issueItem.type {
                typeLabel.text = type
                if type == "error" {typeLabel.textColor = gold}
                if type == "fatal" {typeLabel.textColor = red}
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerView)
        setContainerViewConstraints()
        containerView.addSubview(platformLabel)
        containerView.addSubview(typeLabel)
        containerView.addSubview(dateReceivedLabel)
        setPlatformLabelContraints()
        setDateRecivedLabelConstraints()
        setTypeLabelConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setContainerViewConstraints () {
        containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    func setPlatformLabelContraints () {
        platformLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 0).isActive = true
        platformLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 10).isActive = true
        platformLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 10).isActive = true
        platformLabel.bottomAnchor.constraint(equalTo: self.typeLabel.topAnchor, constant: -2).isActive = true
    }
    
    func setDateRecivedLabelConstraints () {
        dateReceivedLabel.leadingAnchor.constraint(equalTo: self.platformLabel.leadingAnchor).isActive = true
        dateReceivedLabel.trailingAnchor.constraint(equalTo: self.platformLabel.trailingAnchor).isActive = true
        dateReceivedLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0).isActive = true
    }
    
    func setTypeLabelConstraints () {
        typeLabel.leadingAnchor.constraint(equalTo: self.platformLabel.leadingAnchor).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo: self.platformLabel.trailingAnchor).isActive = true
        typeLabel.bottomAnchor.constraint(equalTo: self.dateReceivedLabel.topAnchor, constant: -2).isActive = true
    }
    
}
