//
//  IssueViewControllerCollectionViewController.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 24/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class IssueViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var issue: Issue? {
        didSet {
            guard let issueItem = issue else { return }
            if let contexts = issueItem.contexts {
                if let browser = contexts.browser?.name {
                    print(browser)
                }
                if let os = contexts.os?.type {
                    print(os)
                }
            }
            if let dateRecived = issueItem.dateReceived {
                print(dateRecived)
            }
            if let tags = issueItem.tags {
                print(tags)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "issueValue", for: indexPath) as! IssueItemCollectionViewCell
        cell.name.text = "Hello"
        return cell
    }
    
    override func loadView() {
        super.loadView()
        collectionView.register(IssueItemCollectionViewCell.self, forCellWithReuseIdentifier: "issueValue")
    }
    
    override func viewDidLoad() {
        print("Hello world")
    }
    
}
