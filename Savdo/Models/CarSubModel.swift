//
//  CategoryModel.swift
//  Savdo
//
//  Created by My MAC on 7/1/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit

class CarSubModel : NSObject {
    
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func JSONResponse(array: NSArray) -> [CarSubModel]
    {
        var models:[CarSubModel] = []
        for item in array
        {
            models.append(CarSubModel(fromDictionary: (item as! NSDictionary) as! [String : Any]))
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

