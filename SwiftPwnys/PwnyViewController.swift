//
//  PwnyViewController.swift
//  SwiftPwnys
//
//  Created by Brent Westmoreland on 6/5/14.
//  Copyright (c) 2014 Brent Westmoreland. All rights reserved.
//

import UIKit

class PwnyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let pwnys: String[] = ["Twilight Sparkle", "Applejack", "Fluttershy", "Rarity", "Pinkypie", "Rainbow Dash", "Spike"]
    let cellClass: AnyClass! = UITableViewCell.classForCoder()
    
    @lazy var tableView: UITableView = {
        let _tableView = UITableView(frame:self.view.bounds, style:.Grouped)
        _tableView.dataSource = self
        _tableView.delegate = self
        _tableView.registerClass(self.cellClass, forCellReuseIdentifier:NSStringFromClass(self.cellClass))
        return _tableView
    }()
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil);
    }

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
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(self.cellClass), forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = pwnys[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        tableView.deselectRowAtIndexPath(indexPath, animated:true);
        let message = "You selected \(pwnys[indexPath.row])!"
        showAlert(message)
    }
}
