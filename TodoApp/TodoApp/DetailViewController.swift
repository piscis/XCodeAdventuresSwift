//
//  DetailViewController.swift
//  TodoApp
//
//  Created by Alexander Pirsig on 18.07.14.
//  Copyright (c) 2014 IworxIT. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet strong var titleTextfield: UITextField = UITextField()
    @IBOutlet strong var notesTextView: UITextView = UITextView()
    
    
    var toDoData:NSDictionary = NSDictionary()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextfield.userInteractionEnabled = false
        notesTextView.userInteractionEnabled = false
        
        titleTextfield.text = toDoData.objectForKey("itemTitle") as String
        notesTextView.text = toDoData.objectForKey("itemNote") as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteItem(sender: AnyObject) {
        
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemListArray:NSMutableArray = userDefaults.objectForKey("itemList") as NSMutableArray
        
        var mutableItemList:NSMutableArray = NSMutableArray()
        
        for dict:AnyObject in itemListArray {
            mutableItemList.addObject(dict as NSDictionary)
        }
        
        mutableItemList.removeObject(toDoData)
        
        userDefaults.removeObjectForKey("itemList")
        
        userDefaults.setObject(mutableItemList, forKey: "itemList")
        userDefaults.synchronize()
        
        self.navigationController.popToRootViewControllerAnimated(true)
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
