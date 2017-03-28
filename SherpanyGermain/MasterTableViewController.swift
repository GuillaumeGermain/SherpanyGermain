//
//  MasterTableViewController.swift
//  SherpanyGermain
//
//  Created by Guillaume Germain on 27.03.17.
//  Copyright © 2017 Germain. All rights reserved.
//

import UIKit
import CoreData

class MasterTableViewController: UITableViewController{

    //This main table displays user posts
    // Data has to be fetched from the DB
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        var count = 0
        //Code to fetch data
        let fetchRequest: NSFetchRequest<UserPost> = UserPost.fetchRequest()
        do {
            let searchResult = try DBController.getContext().fetch(fetchRequest)
            print("number of results: \(searchResult.count)")
            count = searchResult.count
        } catch {
            print(error)
        }
        return count

    }

//TODO
    /*            for result in searchResult as [UserPost] {
     body
     id
     title
     userId
     //                if let email = result.email, let username = result.username {
     //                    print("\(result.id) \(email) \(username)")
     //                }
     }
     */

    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserPostCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = "hop"
/*        if indexPath.row == 0 {
            cell.textLabel?.text = "hop"
        } else {
            cell.textLabel?.text = "aie"
        }
*/

        return cell
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
