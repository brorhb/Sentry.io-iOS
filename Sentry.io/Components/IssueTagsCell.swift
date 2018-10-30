//
//  IssueItemCollectionViewCell.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 26/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

class IssueItemTableViewCell: UITableViewCell {
    let grey = UIColor(red:0.47, green:0.47, blue:0.47, alpha:1.0)
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    let valueView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    let key = UILabel()
    let value = UILabel()
    
    var tagsFromIssue: Tags? {
        didSet {
            guard let tagItem = tagsFromIssue else { return }
            if let tagKey = tagItem.key {
                key.text = tagKey
                key.textColor = grey
                key.font = UIFont.systemFont(ofSize: 16, weight: .light)
            }
            if let tagValue = tagItem.value {
                value.text = tagValue
                value.font = UIFont.systemFont(ofSize: 16, weight: .bold)
                value.contentMode = .scaleToFill
                value.numberOfLines = 0
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerView)
        setContainerViewConstraints()
        containerView.addSubview(key)
        containerView.addSubview(valueView)
        containerView.addSubview(value)
        setKeyLabelConstraints()
        setValueViewConstraints()
        setValueLabelConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContainerViewConstraints () {
        containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
    
    func setKeyLabelConstraints () {
        key.translatesAutoresizingMaskIntoConstraints = false
        key.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        key.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
        key.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        key.trailingAnchor.constraint(equalTo: self.valueView.leadingAnchor, constant: -8)
    }
    
    func setValueViewConstraints () {
        valueView.translatesAutoresizingMaskIntoConstraints = false
        valueView.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        valueView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
        valueView.leadingAnchor.constraint(equalTo: self.key.trailingAnchor, constant: -8).isActive = true
        valueView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
    }
    
    func setValueLabelConstraints () {
        value.translatesAutoresizingMaskIntoConstraints = false
        value.topAnchor.constraint(equalTo: self.valueView.topAnchor).isActive = true
        value.bottomAnchor.constraint(equalTo: self.valueView.bottomAnchor).isActive = true
        value.trailingAnchor.constraint(equalTo: self.valueView.trailingAnchor).isActive = true
        value.leadingAnchor.constraint(equalTo: self.valueView.leadingAnchor, constant: 16).isActive = true
    }
}
