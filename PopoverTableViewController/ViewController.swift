//
//  ViewController.swift
//  PopoverTableViewController
//
//  Created by user on 7/1/15.
//  Copyright © 2015 someCompanyNameHere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var button:UIButton = {

        let frame = CGRectMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame), 100, 100)
        self.button = UIButton(frame: frame)
        self.button.addTarget(self, action: Selector("showPopover"), forControlEvents: UIControlEvents.TouchUpInside)
        self.button.backgroundColor = UIColor.blueColor()
        return self.button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showPopover() {
        print("buutton tapped")
        let tbvc = PracticeViewController()
        let nav = UINavigationController(rootViewController: tbvc)
        let popover = UIPopoverController(contentViewController: nav)

        popover.presentPopoverFromRect(button.frame, inView: view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
    }

}

