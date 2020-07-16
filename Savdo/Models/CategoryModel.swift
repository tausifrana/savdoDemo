//
//  CategoryModel.swift
//  Savdo
//
//  Created by My MAC on 7/1/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit

class CategoryModel : NSObject {
    
    var created_at : String!
    var id : Int!
    var imageURL : String!
    var name : String!
    var status : Int!
    var updated_at : String!
    var adscount : Int!

    override init()
    {
        created_at = ""
        id = 0
        imageURL = ""
        name = ""
        status = 1
        updated_at = ""
        adscount = 0
    }
    
    public class func JSONResponse(array: NSArray) -> [CategoryModel]
    {
        var models:[CategoryModel] = []
        for item in array
        {
            models.append(CategoryModel(fromDictionary: (item as! NSDictionary) as! [String : Any]))
        }
        return models
    }
    
    init(fromDictionary dictionary: [String:Any])
    {
        created_at = dictionary["created_at"] as? String
        id = dictionary["id"] as? Int
        imageURL = dictionary["image"] as? String
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
        updated_at = dictionary["updated_at"] as? String
        updated_at = dictionary["updated_at"] as? String
        adscount = dictionary["count"] as? Int
    }
}

