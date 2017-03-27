//
//  ViewController.swift
//  SherpanyGermain
//
//  Created by Guillaume Germain on 24.03.17.
//  Copyright © 2017 Germain. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
/*
 let user:User = NSEntityDescription.insertNewObject(forEntityName: "User", into: DBController.getContext()) as! User
        user.email = "bla@bla.com"
        user.id = 121
        user.username = "TheBigPhatBlackBear21"
        
        DBController.saveContext()
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let searchResult = try DBController.getContext().fetch(fetchRequest)
            print("number of results: \(searchResult.count)")
            
            for result in searchResult as [User] {
                if let email = result.email, let username = result.username {
                    print("\(result.id) \(email) \(username)")
                }
            }
        } catch {
            print(error)
        }
 */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

