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
    var tableView: UITableView?

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame:self.view.bounds, style:.Grouped)
        tableView!.dataSource = self
        self.view.addSubview(tableView)
        tableView?.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier:"UITableViewCell")
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
