//
//  ViewController.swift
//  LinkCollectionOfProgrammingLanguages
//
//  Created by kokoki on 4/17/16.
//  Copyright © 2016 enomt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var changingView: UIView!
    
    // MARK: - Properties
    
    var tableViewController: UIViewController!
    var collectionViewController: UIViewController!
    var currentViewController: UIViewController!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButtonItem
        
        self.tableViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TableViewController")
        self.collectionViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CollectionViewController")
        
        addChildViewController(self.tableViewController)
        self.changingView.addSubview(self.tableViewController.view)
        self.tableViewController.didMoveToParentViewController(self)
        self.currentViewController = self.tableViewController
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.tableViewController.view.frame = self.changingView.bounds
        self.collectionViewController.view.frame = self.changingView.bounds
    }

    // MARK: - Action
    
    @IBAction func doChangeSegumented(sender: AnyObject) {
        let segmented = sender as! UISegmentedControl
        
        switch segmented.selectedSegmentIndex {
        case 0:
            if self.currentViewController == self.collectionViewController {
                self.currentViewController.willMoveToParentViewController(nil)
                self.currentViewController.view.removeFromSuperview()
                self.currentViewController.removeFromParentViewController()
                
                addChildViewController(self.tableViewController)
                self.changingView.addSubview(self.tableViewController.view)
                self.tableViewController.didMoveToParentViewController(self)
                self.currentViewController = self.tableViewController

            }
            break
            
        default:
            if self.currentViewController == self.tableViewController {
                self.currentViewController.willMoveToParentViewController(nil)
                self.currentViewController.view.removeFromSuperview()
                self.currentViewController.removeFromParentViewController()
                
                addChildViewController(self.collectionViewController)
                self.changingView.addSubview(self.collectionViewController.view)
                self.collectionViewController.didMoveToParentViewController(self)
                self.currentViewController = self.collectionViewController
                
            }
            break
        }
    }
}
