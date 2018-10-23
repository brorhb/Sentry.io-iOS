//
//  CustomTableViewCell.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 18/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let platformLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundar
        return view
    }()
    
    var project:Project? {
        didSet {
            guard let projectItem = project else {return}
            if let name = projectItem.name {
                nameLabel.text = name
            }
            if let status = projectItem.status {
                statusLabel.text = status
            }
            if let platform = projectItem.platform {
                platformLabel.text = platform
            }
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerView)
        setContainerViewConstraints()
        containerView.addSubview(nameLabel)
        containerView.addSubview(platformLabel)
        containerView.addSubview(statusLabel)
        setNameLabelContraints()
        setStatusLabelConstraints()
        setPlatformLabelConstraints()
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
    
    func setNameLabelContraints () {
        nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 10).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.platformLabel.topAnchor, constant: -2).isActive = true
    }
    
    func setStatusLabelConstraints () {
        statusLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor).isActive = true
        statusLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0).isActive = true
    }
 
    func setPlatformLabelConstraints () {
        platformLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor).isActive = true
        platformLabel.trailingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor).isActive = true
        platformLabel.bottomAnchor.constraint(equalTo: self.statusLabel.topAnchor, constant: -2).isActive = true
    }
    
}
