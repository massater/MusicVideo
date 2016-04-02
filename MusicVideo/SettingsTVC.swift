//
//  SettingsTVC.swift
//  MusicVideo
//
//  Created by ravizza on 3/31/16.
//  Copyright © 2016 reliability. All rights reserved.
//

import UIKit

class SettingsTVC: UITableViewController {

    
    @IBOutlet weak var aboutDisplay: UILabel!
    @IBOutlet weak var feedbackDisplay: UILabel!
    @IBOutlet weak var securityDisplay: UILabel!
    @IBOutlet weak var touchID: UISwitch!
    @IBOutlet weak var bestImageDisplay: UILabel!
    @IBOutlet weak var APICount: UILabel!
    @IBOutlet weak var sliderCount: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.alwaysBounceVertical = false
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(preferredFontChanged), name: UIContentSizeCategoryDidChangeNotification, object: nil)
        
        title = "Settings"
        
        touchID.on = NSUserDefaults.standardUserDefaults().boolForKey("SecuritySetting")
        
        if(NSUserDefaults.standardUserDefaults().objectForKey("APICount") != nil){
            let theValue = NSUserDefaults.standardUserDefaults().objectForKey("APICount") as! Int
             APICount.text = ("\(theValue)")
            sliderCount.value = Float(theValue)
        }
    }

    
    @IBAction func valueChanged(sender: AnyObject) {
        print("Value Changed")
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(Int(sliderCount.value), forKey: "APICount")
        APICount.text = ("\(Int(sliderCount.value))")
    }
    @IBAction func touchIdSecurity(sender: UISwitch) {
        let defaults = NSUserDefaults.standardUserDefaults()
        if touchID.on {
            defaults.setBool(touchID.on, forKey: "SecuritySetting")
        }
        else{
            defaults.setBool(false, forKey: "SecuritySetting")

        }
        
    }
    
    
  
    
    
    func preferredFontChanged(){
        print("The preferred Font has changed")
        aboutDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        feedbackDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        securityDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        bestImageDisplay.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        APICount.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        
    }

    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
        
    }
}
