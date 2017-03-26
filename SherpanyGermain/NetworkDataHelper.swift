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
    
    var postData: Data?
    var userData: Data?
    var albumData: Data?
    var photoData: Data?

    var AppData = [DataKind:Data]()
    
    
    func loadAllData() {
        self.loadData(dataKind: .Post)
        self.loadData(dataKind: .User)
        self.loadData(dataKind: .Album)
        self.loadData(dataKind: .Photo)
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


    //Process album JSON
    //
    func loadJSON(dataKind: DataKind) {
        print("loading JSON of \(dataKind.rawValue)!")
        if let theData = self.AppData[dataKind] {
            //let readOptions = JSONSerialization.ReadingOptions.mutableContainers
            do {
                let theResult = try JSONSerialization.jsonObject(with: theData, options: []) as! [AnyObject]
                print("------------")
                print(theResult)
                
            } catch {
                print(error)
            }
            
        }
    }
    

}


