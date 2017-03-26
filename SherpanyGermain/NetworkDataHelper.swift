//
//  NetworkDataHelper.swift
//  SherpanyGermain
//
//  Created by Guillaume Germain on 24.03.17.
//  Copyright © 2017 Germain. All rights reserved.
//

import Foundation


enum DataKind:String {
    case Post = "posts"
    case User = "users"
    case Album = "albums"
    case Photo = "photos"
}

class NetworkDataHelper {
    
    let postUrlPath = "http://jsonplaceholder.typicode.com/posts/"
    let userUrlPath = "http://jsonplaceholder.typicode.com/users/"
    let albumUrlPath = "http://jsonplaceholder.typicode.com/albums/"
    let photoUrlPath = "http://jsonplaceholder.typicode.com/photos/"
    
    static var postData: Data?
    static var userData: Data?
    static var albumData: Data?
    static var photoData: Data?

//    static var AppData = [DataKind:Data]()
    
    
    static func loadAllData() {
        self.loadData(dataKind: .Post)
        self.loadData(dataKind: .User)
        self.loadData(dataKind: .Album)
        self.loadData(dataKind: .Photo)
    }
    
    
    static func loadData(dataKind: DataKind) {
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
                switch dataKind {
                case .Post:
                    self.postData = dataVar
                case .User:
                    self.userData = dataVar
                case .Album:
                    self.albumData = dataVar
                    self.loadAlbums()
                case .Photo:
                    self.photoData = dataVar
                }
                print(dataKind.rawValue + " loaded!")
            } else if let error = error {
                print(error)
            }
        }
        task.resume()
    }

/*
     static var postData = [Any]()
     static var userData = [Any]()
     static var albumData = [Any]()
     static var photoData = [Any]()
*/

    //Process album JSON
    //
    static func loadAlbums() {
        if let albumData = self.albumData {
            //let readOptions = JSONSerialization.ReadingOptions.mutableContainers
            do {
                let theResult = try JSONSerialization.jsonObject(with: albumData, options: []) as! [AnyObject]
                print("------------")
                print(theResult)
                
            } catch {
                print(error)
            }
            
        }
    }
    

}


