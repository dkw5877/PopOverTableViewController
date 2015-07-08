//
//  PopoverTableViewController.swift
//  PopoverTableViewController
//
//  Created by user on 7/1/15.
//  Copyright © 2015 someCompanyNameHere. All rights reserved.
//

import UIKit

class PopoverTableViewController: UITableViewController, UINavigationControllerDelegate {

    var navigationControllerPreferredContentSize:CGSize?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        let frame = self.navigationController?.navigationBar.frame

        if let frame = frame {
            if self.navigationController != nil {
                if var contentSize = self.navigationController?.preferredContentSize {
                    contentSize.height -= frame.height;
                    self.navigationControllerPreferredContentSize = contentSize
                }
            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        print("super viewWillAppear table content size \(tableView.contentSize)")
        if self.navigationController != nil {
            self.navigationController?.preferredContentSize = calculatePreferredContentSize()
        }
    }

    func calculatePreferredContentSize() -> CGSize {
        let windowSize = UIApplication.sharedApplication().windows.first?.frame.size
        var height = tableView.contentSize.height
        if let windowSize = windowSize{
            if  height > windowSize.height * 0.60 {
                height = windowSize.height * 0.60
            }
        }

        let size = CGSizeMake(self.tableView.contentSize.width, height)
        preferredContentSize = size
        self.tableView.flashScrollIndicators()
//        print("table content size \(tableView.contentSize)")
//        print("preferred content size \(preferredContentSize)")
        return size;

    }

    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        calculatePreferredContentSize()
    }

}
