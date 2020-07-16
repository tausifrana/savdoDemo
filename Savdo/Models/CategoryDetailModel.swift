//
//  CategoryDetailModel.swift
//  Savdo
//
//  Created by My MAC on 10/1/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit

public class CategoryDetailModel : NSObject {
    
    var id : Int!
    var category_id : Int!
    var name : String!
    var status : Int!
    var count : Int!

    
    override init()
    {
        id = 0
        category_id = 0
        name = ""
        status = 1
    }
    
    public class func JSONResponse(array: NSArray) -> [CategoryDetailModel]
    {
        var models:[CategoryDetailModel] = []
        for item in array
        {
            models.append(CategoryDetailModel(fromDictionary: (item as! NSDictionary) as! [String : Any]))
        }
        return models
    }
    
    init(fromDictionary dictionary: [String:Any])
    {
        id = dictionary["id"] as? Int
        category_id = dictionary["category_id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
        count = dictionary["count"] as? Int

        
    }
}
