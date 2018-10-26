//
//  IssueViewControllerCollectionViewController.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 24/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class IssueViewController: UICollectionViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.backgroundColor = .white
        print(issue as Any)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        return cell
    }
    
}
