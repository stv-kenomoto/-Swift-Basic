//
//  TableViewController.swift
//  LinkCollectionOfProgrammingLanguages
//
//  Created by kokoki on 2016/05/01.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate {

    // MARK: - Views
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var dataSource: TableViewDataSource!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(TableViewCell.self)
        self.dataSource = TableViewDataSource()
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self
        self.dataSource.didTapButton = { (button: UIButton) -> () in
            let cell = button.superview?.superview as? TableViewCell
            let row = self.tableView.indexPathForCell(cell!)?.row
            var programmingLanguageEntity = self.dataSource.programmingLanguageEntities[row!]
        
            if programmingLanguageEntity.likable {
                programmingLanguageEntity.likable = false
            } else {
                programmingLanguageEntity.likable = true
            }
            
            self.dataSource.programmingLanguageEntities[row!] = programmingLanguageEntity
            self.tableView.reloadData()
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
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
