//
//  NetworkDataHelper.swift
//  SherpanyGermain
//
//  Created by Guillaume Germain on 24.03.17.
//  Copyright © 2017 Germain. All rights reserved.
//

import Foundation
import CoreData

enum DataKind:String {
    case post = "posts"
    case user = "users"
    case album = "albums"
    case photo = "photos"
}

class NetworkDataHelper {
    
    let postUrlPath = "http://jsonplaceholder.typicode.com/posts/"
    let userUrlPath = "http://jsonplaceholder.typicode.com/users/"
    let albumUrlPath = "http://jsonplaceholder.typicode.com/albums/"
    let photoUrlPath = "http://jsonplaceholder.typicode.com/photos/"
    
    var postData: Data?
    var userData: Data?
    var albumData: Data?
    var photoData: Data?

    var AppData = [DataKind:Data]()
    
    
    func loadAllData() {
        self.loadData(dataKind: .post)
        self.loadData(dataKind: .user)
        self.loadData(dataKind: .album)
        self.loadData(dataKind: .photo)
    }
    
    
    func loadData(dataKind: DataKind) {
        let urlPath = "http://jsonplaceholder.typicode.com/\(dataKind.rawValue)/"
        
        let url = URL(string: urlPath)
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let responseVar = response, let dataVar = data {
                
                //Debugging
//                print("***********") //response status
//                print(responseVar)
                if false {
                    let returnString = String(data: dataVar, encoding: .utf8)!
                    print("***********")
                    print(dataKind.rawValue)
                    print("***********")
                    print(returnString)
                }
                
                self.AppData[dataKind] = dataVar
                
                print(dataKind.rawValue + " loaded!")
                self.loadJSON(dataKind: dataKind)
            } else if let error = error {
                print(error)
            }
        }
        task.resume()
    }


    //Process JSON data to objects
    //
    func loadJSON(dataKind: DataKind) {
        print("loading JSON of \(dataKind.rawValue)!")
        if let theData = self.AppData[dataKind] {
            //let readOptions = JSONSerialization.ReadingOptions.mutableContainers
            do {
                let theResult = try JSONSerialization.jsonObject(with: theData, options: []) as! [AnyObject]
                print("------------")
                print(theResult)
                saveData(dataKind: dataKind, JSONObject: theResult)
            } catch {
                print(error)
            }
            
        }
    }

    
    //TODO save first level of data
    func saveData(dataKind: DataKind, JSONObject: [AnyObject]) {
        
        switch dataKind {
        case .user:
            //JSONObject is an array of AnyObjects, each being a dictionary
            for aDict in JSONObject {
                let phone = aDict["phone"]
                let email = aDict["email"]
                let name = aDict["name"]
                let website = aDict["website"]
                
                let aUser:User = NSEntityDescription.insertNewObject(forEntityName: "User", into: DBController.getContext()) as! User
                aUser.phone = phone as? String
                aUser.email = email as? String
                aUser.name = name as? String
                aUser.website = website as? String
            }
        case .post:
            for aDict in JSONObject {
                let aUserPost:UserPost = NSEntityDescription.insertNewObject(forEntityName: "UserPost", into: DBController.getContext()) as! UserPost
                aUserPost.body = aDict["body"] as? String
//                aUserPost.id = aDict["id"]
                aUserPost.title = aDict["title"]  as? String
//                aUserPost.userID = aDict["UserId"]
            }
        case .photo:
            break
        case .album:
            for aDict in JSONObject {
                let anAlbum:Album = NSEntityDescription.insertNewObject(forEntityName: "Album", into: DBController.getContext()) as! Album
//                anAlbum.id = aDict["id"]
                anAlbum.title = aDict["title"] as? String
//                anAlbum.userId = aDict["userId"]
            }
        }
        
//Code to fetch data
        /*
         
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
    
    func saveUser() {
        
    }
    

}


