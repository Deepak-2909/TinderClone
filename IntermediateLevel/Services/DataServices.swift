//
//  DataServices.swift
//  IntermediateLevel
//
//  Created by Deepak on 03/06/21.
//

import Foundation

class DataServices {
    static func getLocalData() -> [ChatModel] {
        // Parse local json file
        
        // Get a url path to json file
        let pathString = Bundle.main.path(forResource: "UserInfo", ofType: "json")
        
        //Unwrap the optional
        guard pathString != nil else {
            return [ChatModel]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let userData = try decoder.decode([ChatModel].self, from: data)
                
                // Add unique ids
                for x in userData {
                    x.id = UUID()
                }
                
                return userData
            }
            catch {
                print(error)
            }
            
            
        }
        catch {
            print(error)
        }
        
        return [ChatModel]()
    }
}
