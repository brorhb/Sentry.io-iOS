//
//  CustomTableViewCell.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 18/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let nameLabel = UILabel()
    let statusLabel = UILabel()
    let containerView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContainerView()
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

    func setupNameLabel () {
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupStatusLabel () {
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupContainerView () {
        setupContainerViewConstraint()
        setupNameLabel()
        setupStatusLabel()
        containerView.addSubview(nameLabel)
        containerView.addSubview(statusLabel)
        setupNameLabelConstraint()
    }
    
    func setupNameLabelConstraint () {
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
    }
    
    func setupContainerViewConstraint () {
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.containerView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
    }
    
}
