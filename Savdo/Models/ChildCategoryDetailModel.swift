//
//  ChildCategoryDetailModel.swift
//  Savdo
//
//  Created by My MAC on 23/1/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit

public class ChildCategoryDetailModel : NSObject {
    
    var id : Int!
    var category_id : Int!
    var sub_category_id : Int!
    var name : String!
    var count : Int!
    var status : Int!
    
    override init()
    {
        id = 0
        category_id = 0
        sub_category_id = 0
        name = ""
        count = 0
        status = 1
    }
    
    public class func JSONResponse(array: NSArray) -> [ChildCategoryDetailModel]
    {
        var models:[ChildCategoryDetailModel] = []
        for item in array
        {
            models.append(ChildCategoryDetailModel(fromDictionary: (item as! NSDictionary) as! [String : Any]))
        }
        return models
    }
    
    init(fromDictionary dictionary: [String:Any])
    {
        id = dictionary["id"] as? Int
        category_id = dictionary["category_id"] as? Int
        sub_category_id = dictionary["sub_category_id"] as? Int
        name = dictionary["name"] as? String
        count = dictionary["count"] as? Int
        status = dictionary["status"] as? Int
    }
}
