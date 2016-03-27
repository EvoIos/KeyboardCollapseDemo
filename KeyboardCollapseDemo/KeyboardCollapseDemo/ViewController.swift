//
//  ViewController.swift
//  KeyboardCollapseDemo
//
//  Created by zhenglanchun on 16/3/27.
//  Copyright © 2016年 AI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardHideAction:", name: UIKeyboardWillHideNotification, object: nil)
    }

    
    @IBAction func submitAction(sender: UIButton) {
        textField.resignFirstResponder()
        //延时0.5秒
        let time: NSTimeInterval = 0.5
        let delay = dispatch_time(DISPATCH_TIME_NOW,
            Int64(time * Double(NSEC_PER_SEC)))
        dispatch_after(delay, dispatch_get_main_queue()) {
            let alertView = UIAlertView.init(title: "Alert View", message: "test keyboard collapse", delegate: self, cancelButtonTitle: "cancel")
            alertView.show()

        }
//        let alertViewController = UIAlertController.init(title: "Alert Show", message: "test keyboard collapse ", preferredStyle: .Alert)
//        let alertAction = UIAlertAction(title: "cancel", style: .Default, handler: nil)
//        alertViewController.addAction(alertAction)
//        presentViewController(alertViewController, animated: true, completion: nil)
    }
    
    @IBAction func tapAction(sender: UITapGestureRecognizer) {
        //textField.resignFirstResponder()
        view.endEditing(true)
        UIApplication.sharedApplication().keyWindow?.endEditing(true)
    }
    
    func keyboardHideAction(noti: NSNotification) {
        let userInfo = noti.userInfo
        if let animationDuration = userInfo!["UIKeyboardAnimationDurationUserInfoKey"] {
            print("\(animationDuration)")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

