//
//  DataManager.swift
//  Demo-Wipro
//
//  Created by Vineeta on 18/07/20.
//  Copyright © 2020 Vineeta. All rights reserved.
//

import Foundation

class DataManager {
    static let sharedInstance = DataManager()
    private init () {
        
    }
    
    func getDataForRow(completion: @escaping (_ error: Error?, _ response: DataModel?) -> Void){
        WebServiceManager.requestService { (error, data) in
            if error != nil {
                completion(error, nil)
            }
            if let data = data {
                if let response = JsonParser.sharedInstance.parseDataModelResponse(from: data) {
                    completion(nil, response)
                } else {
                    completion(error, nil)
                }
            }
        }
    }
}

class JsonParser {
    static let sharedInstance = JsonParser()
    private init () {
        
    }
    
    func parseDataModelResponse( from data: Data) -> DataModel? {
        do {
            let response = try JSONDecoder().decode(DataModel.self, from: data)
            return response
        }
        catch let error {
            print(error)
            return nil
            
        }
    }
}
