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
    
    static var postData = ""
    static var userData = ""
    static var albumData = ""
    static var photoData = ""

    
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
        
        var returnData: String = ""

        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let responseVar = response, let dataVar = data {
/*                print("***********")
                print(responseVar)
                returnData = String(data: dataVar, encoding: .utf8)!
                print("***********")
                print(returnData)
*/
                switch dataKind {
                case .Post:
                    self.postData = returnData
                case .User:
                    self.userData = returnData
                case .Album:
                    self.albumData = returnData
                case .Photo:
                    self.photoData = returnData
                }
                print(dataKind.rawValue + " loaded!")
            } else if let error = error {
                print(error)
            }
        }
        task.resume()
        
     }
    
}
 

 
 
/*
func getFilm(filmID: Int) -> String {
    
    print("getFilm")
    
    let url = URL(string: "https://api.kinopoisk.cf/getFilm?filmID=\(filmID)")!
    var request = URLRequest(url: url)
    
    var returnData: String = ""
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if var responseVar = response, var dataVar = data {
            print(responseVar)
            returnData = String(data: dataVar, encoding: .utf8)
        } else {
            print(error)
        }
    }
    
    task.resume()
    
    return returnData
}
*/
