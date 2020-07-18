//
//  WebServiceManager.swift
//  Demo-Wipro
//
//  Created by Vineeta on 18/07/20.
//  Copyright © 2020 Vineeta. All rights reserved.
//

import Foundation

let baseUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

class WebServiceManager {
    class func requestService(completion:@escaping (_ error:Error?, _ data:Data?)-> Void) {
        guard let url = URL(string: baseUrl) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
       
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            // Check the response
            print(response)
            
            if error != nil {
                completion(error, nil)
            }
            if let data = data {
                completion(nil, data)
            }
        })
        task.resume()
        
    }
}
