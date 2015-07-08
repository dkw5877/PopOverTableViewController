//
//  TitleViewController.swift
//  PopoverTableViewController
//
//  Created by user on 7/7/15.
//  Copyright © 2015 someCompanyNameHere. All rights reserved.
//

import UIKit

class TitleViewController: PopoverTableViewController {

    var dataSource = [String]()
    static let reuseIdentifier = "reuseIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    func createData() {

        for var i = 0; i < 10; i++ {
            let value = "Title \(i)"
            dataSource.append(value)
        }
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
}
