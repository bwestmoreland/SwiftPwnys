//
//  PwnyViewController.swift
//  SwiftPwnys
//
//  Created by Brent Westmoreland on 6/3/14.
//  Copyright (c) 2014 Brent Westmoreland. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //Here we load a label using a closure without needing to specify lazy, nowhere in the lexical scope is self captured
    let myLabel: UILabel = {
        let _myLabel = UILabel(frame: CGRectMake(10, 20, 300, 44))
        _myLabel.text = "Hello"
        _myLabel.textAlignment = .Center
        return _myLabel
    }()
    
    let height: CGFloat = CGFloat(44.0)
    
    //Here we are referring to `self` inside the body, there appears to be a race on initialization that 
    //if we don't load self lazily then we lose the race and self doesn't exist, the compiler won't let us continue
    @lazy var myButton: UIButton = {
        let _myButton = UIButton.buttonWithType(.System) as UIButton
        _myButton.frame = CGRect(
            x:CGRectGetMinX(self.view.bounds),
            y:CGRectGetMidY(self.view.bounds) - self.height / 2,
            width:CGRectGetWidth(self.view.bounds),
            height:self.height)
        _myButton.setTitle("Push me!", forState:.Normal)
        _myButton.addTarget(self, action: "buttonPressed", forControlEvents:.TouchUpInside)
        return _myButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.myButton)
        self.view.addSubview(self.myLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonPressed(){
        self.navigationController.pushViewController(PwnyViewController(nibName: nil, bundle: nil), animated: true)
    }
    
    func animateMyButton () {
        UIView.animateWithDuration(1,
            animations: {
                self.myButton.frame = CGRect(
                    x: self.myButton.frame.origin.x,
                    y: self.myButton.frame.origin.y + 120,
                    width: self.myButton.frame.size.width,
                    height: self.myButton.frame.size.height)
            },
            completion: { (finished: Bool) in
                UIView.animateWithDuration(1,
                    animations: {
                        self.myButton.frame = CGRect(
                            x: self.myButton.frame.origin.x,
                            y: self.myButton.frame.origin.y - 120,
                            width: self.myButton.frame.size.width,
                            height: self.myButton.frame.size.height)
                        self.myButton.tintColor = UIColor.blackColor()
                    })
            })
    }
    
    
    //UIAlertViewController
    func showAlert(){
        let alert = UIAlertController(title: "Alert", message: "You clicked the button", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil);
    }
    

}
