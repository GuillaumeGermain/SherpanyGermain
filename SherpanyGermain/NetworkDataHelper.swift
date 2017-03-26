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
    
    static var postJsonString = ""
    static var userJsonString = ""
    static var albumJsonString = ""
    static var photoJsonString = ""

    static var postData = [Dictionary]
    static var userData = [Dictionary]
    static var albumData = [Dictionary]
    static var photoData = [Dictionary]

    
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
        
        var returnString: String = ""

        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let responseVar = response, let dataVar = data {
//                print("***********") //response status
//                print(responseVar)
                returnString = String(data: dataVar, encoding: .utf8)!
                print("***********")
                print(returnData)
                
                switch dataKind {
                case .Post:
                    self.postJsonString = returnString
                case .User:
                    self.userJsonString = returnString
                case .Album:
                    self.albumJsonString = returnString
                case .Photo:
                    self.photoJsonString = returnString
                }
                print(dataKind.rawValue + " loaded!")
            } else if let error = error {
                print(error)
            }
        }
        task.resume()
        
    }
 
    static func processJson(dataKind: DataKind) {
        switch dataKind {
        case .Post:
            self.postJsonString = returnString
        case .User:
            self.userJsonString = returnString
        case .Album:
            self.albumJsonString = returnString
        case .Photo:
            self.photoJsonString = returnString
        }
    }


}


