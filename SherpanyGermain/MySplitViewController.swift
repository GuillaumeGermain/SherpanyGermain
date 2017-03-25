//
//  MySplitViewController.swift
//  SherpanyGermain
//
//  Created by Guillaume Germain on 25.03.17.
//  Copyright © 2017 Germain. All rights reserved.
//

import UIKit

class MySplitViewController: UISplitViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the Primary column always visible and with a fix size
        self.preferredDisplayMode = UISplitViewControllerDisplayMode.allVisible
        self.minimumPrimaryColumnWidth = 320
        self.maximumPrimaryColumnWidth = 320
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
