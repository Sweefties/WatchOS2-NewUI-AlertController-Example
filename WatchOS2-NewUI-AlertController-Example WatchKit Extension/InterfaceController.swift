//
//  InterfaceController.swift
//  WatchOS2-NewUI-AlertController-Example WatchKit Extension
//
//  Created by Wlad Dicario on 25/08/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    // MARK: - IB Interfaces
    @IBOutlet var DefaultAlert: WKInterfaceButton!
    @IBOutlet var SideBySideAlert: WKInterfaceButton!
    @IBOutlet var SheetAlert: WKInterfaceButton!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        DefaultAlert.setTitle("Default")
        SideBySideAlert.setTitle("Side By Side")
        SheetAlert.setTitle("Action Sheet")
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    // MARK: - IB Actions
    @IBAction func showAlert() {
        self.showAlertWithStyle(WKAlertControllerStyle.alert)
    }
    
    @IBAction func showSideBySideAlertBtn() {
        self.showAlertWithStyle(WKAlertControllerStyle.sideBySideButtonsAlert)
    }
    
    @IBAction func showActionSheetAlert() {
        self.showAlertWithStyle(WKAlertControllerStyle.actionSheet)
    }
    
}

//MARK: Interface Controller extension
extension InterfaceController {
    
    // prepare Alert with setted style
    func showAlertWithStyle(_ style: WKAlertControllerStyle) {
        // init the Alert Actions
        let cancel = WKAlertAction(title: "Cancel", style: WKAlertActionStyle.cancel, handler: { () -> Void in
            print("cancel")
        })
        
        let action = WKAlertAction(title: "Action", style: WKAlertActionStyle.default, handler: { () -> Void in
            print("default action method..")
        })
        
        let destructive = WKAlertAction(title: "Destructive", style: WKAlertActionStyle.destructive, handler: { () -> Void in
            print("destructive")
        })
        // populate an array of actions
        var actions = NSArray()
        if style == WKAlertControllerStyle.sideBySideButtonsAlert {
            actions = [action, cancel]
        }else{
            actions = [action, cancel, destructive]
        }
        // presented Alert Controller
        self.presentAlert(withTitle: "watchOS 2", message: "Alert Controller", preferredStyle: style, actions: actions as! [WKAlertAction])
    }
    
}
