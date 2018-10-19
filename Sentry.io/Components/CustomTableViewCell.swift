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
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
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
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(statusLabel)
        setContentViewConstraints()
        setNameLabelContraints()
        //setStatusLabelConstraints()
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
    
    func setContentViewConstraints () {
        containerView.centerYAnchor.constraint(equalTo:contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:contentView.leadingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
    }
    
    func setNameLabelContraints () {
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
    }
    
    func setStatusLabelConstraints () {
        statusLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor, constant: 0).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        statusLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0)
    }
    
}
