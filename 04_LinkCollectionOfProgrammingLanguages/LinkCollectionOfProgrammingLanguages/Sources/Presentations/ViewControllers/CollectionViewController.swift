//
//  CollectionViewController.swift
//  LinkCollectionOfProgrammingLanguages
//
//  Created by kokoki on 2016/05/05.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - Views

    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    var dataSource: CollectionViewDataSource!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(CollectionViewCell.self)
        self.dataSource = CollectionViewDataSource()
        self.collectionView.dataSource = self.dataSource
        self.collectionView.delegate = self
        self.dataSource.didTapButton = { (button: UIButton) -> () in
            let cell = button.superview?.superview as? CollectionViewCell
            let row = self.collectionView.indexPathForCell(cell!)?.row
            var programmingLanguageEntity = self.dataSource.programmingLanguageEntities[row!]
            
            if programmingLanguageEntity.likable {
                programmingLanguageEntity.likable = false
            } else {
                programmingLanguageEntity.likable = true
            }
            
            self.dataSource.programmingLanguageEntities[row!] = programmingLanguageEntity
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            let cellWidth = floor(collectionView.bounds.width / 2)
            
            layout.itemSize = CGSizeMake(cellWidth, cellWidth)
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
        }
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let programmingLanguageEntity = self.dataSource.programmingLanguageEntities[indexPath.row]
        let webViewController: WebViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("WebViewController")) as! WebViewController
        webViewController.urlTitle = programmingLanguageEntity.label
        
        if let url = NSURL(string: programmingLanguageEntity.url) {
            let urlRequest = NSURLRequest.init(URL: url)
            webViewController.urlRequest = urlRequest
        }
        
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
    
}
