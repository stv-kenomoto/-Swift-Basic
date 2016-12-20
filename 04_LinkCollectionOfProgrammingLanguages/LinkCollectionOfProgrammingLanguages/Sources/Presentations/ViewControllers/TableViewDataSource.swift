//
//  TableViewDataSource.swift
//  LinkCollectionOfProgrammingLanguages
//
//  Created by kokoki on 2016/05/01.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    
    var programmingLanguageEntities: [ProgrammingLanguageEntity] = ProgrammingLanguageEntity.programmingLanguageEntitiesFromPlist()
    var didTapButton:((UIButton) -> ())?
    
    // MARK: - UITableViewDataSource
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programmingLanguageEntities.count
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let programmingLanguageEntity = self.programmingLanguageEntities[indexPath.row]
        let cell: TableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.label.text = programmingLanguageEntity.label
        cell.icon.image = programmingLanguageEntity.image
        cell.button.likable = programmingLanguageEntity.likable
        cell.button.addTarget(self, action: #selector(TableViewDataSource.doTapButton(_:)), forControlEvents: .TouchUpInside)
        
        if programmingLanguageEntity.likable {
            cell.backgroundColor = UIColor.redColor()
        } else {
            cell.backgroundColor = UIColor.whiteColor()
        }
        
        return cell
    }
    
    // MARK: - Action
    
    func doTapButton(sender: UIButton) {
        self.didTapButton?(sender)
    }
}
