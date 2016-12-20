//
//  CollectionViewDataSource.swift
//  LinkCollectionOfProgrammingLanguages
//
//  Created by kokoki on 2016/05/05.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - Properties
    
    var programmingLanguageEntities: [ProgrammingLanguageEntity] = ProgrammingLanguageEntity.programmingLanguageEntitiesFromPlist()
    var didTapButton:((UIButton) -> ())?
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return programmingLanguageEntities.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let programmingLanguageEntity = self.programmingLanguageEntities[indexPath.row]
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.label.text = programmingLanguageEntity.label
        cell.icon.image = programmingLanguageEntity.image
        cell.button.likable = programmingLanguageEntity.likable
        cell.button.addTarget(self, action: #selector(TableViewDataSource.doTapButton(_:)), forControlEvents: .TouchUpInside)
        
        return cell

    }
    
    // MARK: - Action
    
    func doTapButton(sender: UIButton) {
        self.didTapButton?(sender)
    }
}
