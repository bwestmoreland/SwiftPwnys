//
//  PwnyViewController.swift
//  SwiftPwnys
//
//  Created by Brent Westmoreland on 6/5/14.
//  Copyright (c) 2014 Brent Westmoreland. All rights reserved.
//

import UIKit

class PwnyViewController: UIViewController, UITableViewDataSource {
    
    let pwnys: String[] = ["Twilight Sparkle", "Applejack", "Fluttershy", "Rarity", "Pinkypie", "Rainbow Dash", "Spike"]
    
    @lazy var tableView: UITableView = {
        let _tableView = UITableView(frame:self.view.bounds, style:.Grouped)
        _tableView.dataSource = self
        _tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier:"UITableViewCell")
        return _tableView
    }()

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return pwnys.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel.text = pwnys[indexPath.row]
        return cell
    }
}
