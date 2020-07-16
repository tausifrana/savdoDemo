//
//  City.swift
//  Savdo
//
//  Created by My MAC on 5/2/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import Foundation

class City : NSObject {
    
    var id : Int!
    var name : String!
    var status : Int!

    override init()
    {
        id = 0
        name = ""
        status = 1
    }
    
    public class func JSONResponse(array: NSArray) -> [City]
    {
        var models:[City] = []
        for item in array
        {
            models.append(City(fromDictionary: (item as! NSDictionary) as! [String : Any]))
        }
        return models
    }
    
    init(fromDictionary dictionary: [String:Any])
    {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }
}
