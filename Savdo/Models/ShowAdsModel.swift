//
//  ShowAdsModel.swift
//  Savdo
//
//  Created by My MAC on 22/2/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//


// ALL CATEGORY ID


/*
 1. REAL ESTATE
 2. SHOP
 3.
 4. MARKETS
 5. Building & Material
 */

import Foundation

public class ShowAdsModel : NSObject {
    public var success : Bool?
    public var code : Int?
    public var message : String?
    
    public var real_estate : Real_estate?
    public var motor : Motor?
    
    public var market : Market?
    public var building : Building?
    public var job : Job?
    public var kid_clothe : Kid_clothe?
    public var electronics : Electronics?

    public var commonAds : CommonAds?
    public var basic : Basic?

   public class func modelsFromDictionaryArray(dic:NSDictionary) -> [ShowAdsModel]
    {
        var models:[ShowAdsModel] = []
        models.append(ShowAdsModel(dictionary: dic)!)
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        success = dictionary["success"] as? Bool
        code = dictionary["code"] as? Int
        message = dictionary["message"] as? String
        
        if Globals.globalCategoryID == Constant.CategoryID.RealEstateID
        {
            if (dictionary["real_estate"] != nil) { real_estate = Real_estate(dictionary: dictionary["real_estate"] as! NSDictionary) }
        }
        else if Globals.globalCategoryID == Constant.CategoryID.MotorsID
        {
            if (dictionary["motor"] != nil) { motor = Motor(dictionary: dictionary["motor"] as! NSDictionary) }
        }
        else if Globals.globalCategoryID == Constant.CategoryID.MarketID
        {
            if (dictionary["market"] != nil) { market = Market(dictionary: dictionary["market"] as! NSDictionary) }
        }
        else if Globals.globalCategoryID == Constant.CategoryID.BuildingMaterialID
        {
            if (dictionary["building"] != nil) { building = Building(dictionary: dictionary["building"] as! NSDictionary) }
        }
        else if Globals.globalCategoryID == Constant.CategoryID.JobsID
        {
            if (dictionary["job"] != nil) { job = Job(dictionary: dictionary["job"] as! NSDictionary) }
        }
        else if Globals.globalCategoryID == Constant.CategoryID.MobileCommunicationID
        {
            if (dictionary["basic"] != nil) { basic = Basic(dictionary: dictionary["basic"] as! NSDictionary) }
        }
        else if Globals.globalCategoryID == Constant.CategoryID.KidsID
        {
            if (dictionary["kid_clothe"] != nil) { kid_clothe = Kid_clothe(dictionary: dictionary["kid_clothe"] as! NSDictionary) }
        }
        else if Globals.globalCategoryID == Constant.CategoryID.ClothsFootwearID
        {
            if (dictionary["kids_clothe"] != nil) { kid_clothe = Kid_clothe(dictionary: dictionary["kids_clothe"] as! NSDictionary) }
        }
        else if Globals.globalCategoryID == Constant.CategoryID.ElectronicsID
        {
            if (dictionary["electronic"] != nil) { electronics = Electronics(dictionary: dictionary["electronic"] as! NSDictionary) }
        }
        else
        {
            if (dictionary["basic"] != nil) { commonAds = CommonAds(dictionary: dictionary["basic"] as! NSDictionary) }
        }
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.success, forKey: "success")
        dictionary.setValue(self.code, forKey: "code")
        dictionary.setValue(self.message, forKey: "message")
        
        if Globals.globalCategoryID == Constant.CategoryID.RealEstateID
        {
            dictionary.setValue(self.real_estate?.dictionaryRepresentation(), forKey: "real_estate")
        }
        else if Globals.globalCategoryID == Constant.CategoryID.MotorsID
        {
            dictionary.setValue(self.motor?.dictionaryRepresentation(), forKey: "motor")
        }
        else if Globals.globalCategoryID == Constant.CategoryID.MarketID
        {
            dictionary.setValue(self.market?.dictionaryRepresentation(), forKey: "market")
        }
        else if Globals.globalCategoryID == Constant.CategoryID.BuildingMaterialID
        {
            dictionary.setValue(self.building?.dictionaryRepresentation(), forKey: "building")
        }
        else if Globals.globalCategoryID == Constant.CategoryID.JobsID
        {
            dictionary.setValue(self.job?.dictionaryRepresentation(), forKey: "job")
        }
        else if Globals.globalCategoryID == Constant.CategoryID.MobileCommunicationID
        {
            dictionary.setValue(self.basic?.dictionaryRepresentation(), forKey: "basic")
        }
        else if Globals.globalCategoryID == Constant.CategoryID.KidsID
        {
            dictionary.setValue(self.kid_clothe?.dictionaryRepresentation(), forKey: "kid_clothe")
        }
        else if Globals.globalCategoryID == Constant.CategoryID.ClothsFootwearID
        {
            dictionary.setValue(self.kid_clothe?.dictionaryRepresentation(), forKey: "kids_clothe")
        }
        else if Globals.globalCategoryID == Constant.CategoryID.ElectronicsID
        {
            dictionary.setValue(self.electronics?.dictionaryRepresentation(), forKey: "electronic")
        }
        else
        {
            dictionary.setValue(self.commonAds?.dictionaryRepresentation(), forKey: "basic")
        }
        return dictionary
    }
}

/* <<<<<<<<<< MOTOR START >>>>>>>>>> */
public class Motor {
    public var current_page : Int?
    public var data : Array<MotorData>?
    public var first_page_url : String?
    public var from : Int?
    public var last_page : Int?
    public var last_page_url : String?
    public var next_page_url : String?
    public var path : String?
    public var per_page : Int?
    public var prev_page_url : String?
    public var to : Int?
    public var total : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Motor]
    {
        var models:[Motor] = []
        for item in array
        {
            models.append(Motor(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    
    required public init?(dictionary: NSDictionary) {

        current_page = dictionary["current_page"] as? Int
        if (dictionary["data"] != nil) { data = MotorData.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
        first_page_url = dictionary["first_page_url"] as? String
        from = dictionary["from"] as? Int
        last_page = dictionary["last_page"] as? Int
        last_page_url = dictionary["last_page_url"] as? String
        next_page_url = dictionary["next_page_url"] as? String
        path = dictionary["path"] as? String
        per_page = dictionary["per_page"] as? Int
        prev_page_url = dictionary["prev_page_url"] as? String
        to = dictionary["to"] as? Int
        total = dictionary["total"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.current_page, forKey: "current_page")
        dictionary.setValue(self.first_page_url, forKey: "first_page_url")
        dictionary.setValue(self.from, forKey: "from")
        dictionary.setValue(self.last_page, forKey: "last_page")
        dictionary.setValue(self.last_page_url, forKey: "last_page_url")
        dictionary.setValue(self.next_page_url, forKey: "next_page_url")
        dictionary.setValue(self.path, forKey: "path")
        dictionary.setValue(self.per_page, forKey: "per_page")
        dictionary.setValue(self.prev_page_url, forKey: "prev_page_url")
        dictionary.setValue(self.to, forKey: "to")
        dictionary.setValue(self.total, forKey: "total")

        return dictionary
    }

}

public class MotorData {
    public var id : Int?
    public var user_id : Int?
    public var category_name : String?
    public var sub_category_name : String?
    public var child_sub_category_name : String?
    public var title : String?
    public var city_name : String?
    public var price : Int?
    public var description : String?
    public var phone_flag : Int?
    public var chat_flag : Int?
    public var feature_flag : Int?
    public var date : String?
    public var motor_condition_id : Int?
    public var year_id : Int?
    public var fuel_type_id : Int?
    public var engine_size_id : Int?
    public var clearance : Int?
    public var body_work_id : String?
    public var transmission_id : Int?
    public var drive_unit_id : Int?
    public var color_id : Int?
    public var image : Array<Image>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [MotorData]
    {
        var models:[MotorData] = []
        for item in array
        {
            models.append(MotorData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        user_id = dictionary["user_id"] as? Int
        category_name = dictionary["category_name"] as? String
        sub_category_name = dictionary["sub_category_name"] as? String
        child_sub_category_name = dictionary["child_sub_category_name"] as? String
        title = dictionary["title"] as? String
        city_name = dictionary["city_name"] as? String
        price = dictionary["price"] as? Int
        description = dictionary["description"] as? String
        phone_flag = dictionary["phone_flag"] as? Int
        chat_flag = dictionary["chat_flag"] as? Int
        feature_flag = dictionary["feature_flag"] as? Int
        date = dictionary["date"] as? String
        motor_condition_id = dictionary["motor_condition_id"] as? Int
        year_id = dictionary["year_id"] as? Int
        fuel_type_id = dictionary["fuel_type_id"] as? Int
        engine_size_id = dictionary["engine_size_id"] as? Int
        clearance = dictionary["clearance"] as? Int
        body_work_id = dictionary["body_work_id"] as? String
        transmission_id = dictionary["transmission_id"] as? Int
        drive_unit_id = dictionary["drive_unit_id"] as? Int
        color_id = dictionary["color_id"] as? Int
        if (dictionary["image"] != nil) { image = Image.modelsFromDictionaryArray(array: dictionary["image"] as! NSArray) }
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.user_id, forKey: "user_id")
        dictionary.setValue(self.category_name, forKey: "category_name")
        dictionary.setValue(self.sub_category_name, forKey: "sub_category_name")
        dictionary.setValue(self.child_sub_category_name, forKey: "child_sub_category_name")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.city_name, forKey: "city_name")
        dictionary.setValue(self.price, forKey: "price")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.phone_flag, forKey: "phone_flag")
        dictionary.setValue(self.chat_flag, forKey: "chat_flag")
        dictionary.setValue(self.feature_flag, forKey: "feature_flag")
        dictionary.setValue(self.date, forKey: "date")
        dictionary.setValue(self.motor_condition_id, forKey: "motor_condition_id")
        dictionary.setValue(self.year_id, forKey: "year_id")
        dictionary.setValue(self.fuel_type_id, forKey: "fuel_type_id")
        dictionary.setValue(self.engine_size_id, forKey: "engine_size_id")
        dictionary.setValue(self.clearance, forKey: "clearance")
        dictionary.setValue(self.body_work_id, forKey: "body_work_id")
        dictionary.setValue(self.transmission_id, forKey: "transmission_id")
        dictionary.setValue(self.drive_unit_id, forKey: "drive_unit_id")
        dictionary.setValue(self.color_id, forKey: "color_id")

        return dictionary
    }
}


/* <<<<<<<<<< MOTOR END >>>>>>>>>> */



/* <<<<<<<<<< ELECTRONICS START >>>>>>>>>> */
public class Electronics {
    public var current_page : Int?
    public var data : Array<ElectronicsData>?
    public var first_page_url : String?
    public var from : Int?
    public var last_page : Int?
    public var last_page_url : String?
    public var next_page_url : String?
    public var path : String?
    public var per_page : Int?
    public var prev_page_url : String?
    public var to : Int?
    public var total : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Electronics]
    {
        var models:[Electronics] = []
        for item in array
        {
            models.append(Electronics(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        current_page = dictionary["current_page"] as? Int
        if (dictionary["data"] != nil) { data = ElectronicsData.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
        first_page_url = dictionary["first_page_url"] as? String
        from = dictionary["from"] as? Int
        last_page = dictionary["last_page"] as? Int
        last_page_url = dictionary["last_page_url"] as? String
        next_page_url = dictionary["next_page_url"] as? String
        path = dictionary["path"] as? String
        per_page = dictionary["per_page"] as? Int
        prev_page_url = dictionary["prev_page_url"] as? String
        to = dictionary["to"] as? Int
        total = dictionary["total"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.current_page, forKey: "current_page")
        dictionary.setValue(self.first_page_url, forKey: "first_page_url")
        dictionary.setValue(self.from, forKey: "from")
        dictionary.setValue(self.last_page, forKey: "last_page")
        dictionary.setValue(self.last_page_url, forKey: "last_page_url")
        dictionary.setValue(self.next_page_url, forKey: "next_page_url")
        dictionary.setValue(self.path, forKey: "path")
        dictionary.setValue(self.per_page, forKey: "per_page")
        dictionary.setValue(self.prev_page_url, forKey: "prev_page_url")
        dictionary.setValue(self.to, forKey: "to")
        dictionary.setValue(self.total, forKey: "total")

        return dictionary
    }
}
public class ElectronicsData {
    public var id : Int?
    public var user_id : Int?
    public var category_name : String?
    public var sub_category_name : String?
    public var child_sub_category_name : String?
    public var title : String?
    public var city_name : String?
    public var price : Int?
    public var description : String?
    public var phone_flag : Int?
    public var chat_flag : Int?
    public var feature_flag : Int?
    public var date : String?
    public var electronic_condition_id : Int?
    public var image : Array<Image>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [ElectronicsData]
    {
        var models:[ElectronicsData] = []
        for item in array
        {
            models.append(ElectronicsData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        user_id = dictionary["user_id"] as? Int
        category_name = dictionary["category_name"] as? String
        sub_category_name = dictionary["sub_category_name"] as? String
        child_sub_category_name = dictionary["child_sub_category_name"] as? String
        title = dictionary["title"] as? String
        city_name = dictionary["city_name"] as? String
        price = dictionary["price"] as? Int
        description = dictionary["description"] as? String
        phone_flag = dictionary["phone_flag"] as? Int
        chat_flag = dictionary["chat_flag"] as? Int
        feature_flag = dictionary["feature_flag"] as? Int
        date = dictionary["date"] as? String
        electronic_condition_id = dictionary["electronic_condition_id"] as? Int
        if (dictionary["image"] != nil) { image = Image.modelsFromDictionaryArray(array: dictionary["image"] as! NSArray) }
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.user_id, forKey: "user_id")
        dictionary.setValue(self.category_name, forKey: "category_name")
        dictionary.setValue(self.sub_category_name, forKey: "sub_category_name")
        dictionary.setValue(self.child_sub_category_name, forKey: "child_sub_category_name")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.city_name, forKey: "city_name")
        dictionary.setValue(self.price, forKey: "price")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.phone_flag, forKey: "phone_flag")
        dictionary.setValue(self.chat_flag, forKey: "chat_flag")
        dictionary.setValue(self.feature_flag, forKey: "feature_flag")
        dictionary.setValue(self.date, forKey: "date")
        dictionary.setValue(self.electronic_condition_id, forKey: "electronic_condition_id")

        return dictionary
    }
}
/* <<<<<<<<<< ELECTRONICS END >>>>>>>>>> */


/* <<<<<<<<<< BASIC ADS START >>>>>>>>>> */
public class CommonAds {
    public var current_page : Int?
    public var data : Array<CommonData>?
    public var first_page_url : String?
    public var from : Int?
    public var last_page : Int?
    public var last_page_url : String?
    public var next_page_url : String?
    public var path : String?
    public var per_page : Int?
    public var prev_page_url : String?
    public var to : Int?
    public var total : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [CommonAds]
    {
        var models:[CommonAds] = []
        for item in array
        {
            models.append(CommonAds(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {

        current_page = dictionary["current_page"] as? Int
        if (dictionary["data"] != nil) { data = CommonData.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
        first_page_url = dictionary["first_page_url"] as? String
        from = dictionary["from"] as? Int
        last_page = dictionary["last_page"] as? Int
        last_page_url = dictionary["last_page_url"] as? String
        next_page_url = dictionary["next_page_url"] as? String
        path = dictionary["path"] as? String
        per_page = dictionary["per_page"] as? Int
        prev_page_url = dictionary["prev_page_url"] as? String
        to = dictionary["to"] as? Int
        total = dictionary["total"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.current_page, forKey: "current_page")
        dictionary.setValue(self.first_page_url, forKey: "first_page_url")
        dictionary.setValue(self.from, forKey: "from")
        dictionary.setValue(self.last_page, forKey: "last_page")
        dictionary.setValue(self.last_page_url, forKey: "last_page_url")
        dictionary.setValue(self.next_page_url, forKey: "next_page_url")
        dictionary.setValue(self.path, forKey: "path")
        dictionary.setValue(self.per_page, forKey: "per_page")
        dictionary.setValue(self.prev_page_url, forKey: "prev_page_url")
        dictionary.setValue(self.to, forKey: "to")
        dictionary.setValue(self.total, forKey: "total")

        return dictionary
    }
}

public class CommonData {
    public var id : Int?
    public var user_id : Int?
    public var category_name : String?
    public var sub_category_name : String?
    public var child_sub_category_name : String?
    public var title : String?
    public var city_name : String?
    public var price : Int?
    public var description : String?
    public var phone_flag : Int?
    public var chat_flag : Int?
    public var feature_flag : Int?
    public var date : String?
    public var image : Array<Image>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [CommonData]
    {
        var models:[CommonData] = []
        for item in array
        {
            models.append(CommonData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        user_id = dictionary["user_id"] as? Int
        category_name = dictionary["category_name"] as? String
        sub_category_name = dictionary["sub_category_name"] as? String
        child_sub_category_name = dictionary["child_sub_category_name"] as? String
        title = dictionary["title"] as? String
        city_name = dictionary["city_name"] as? String
        price = dictionary["price"] as? Int
        description = dictionary["description"] as? String
        phone_flag = dictionary["phone_flag"] as? Int
        chat_flag = dictionary["chat_flag"] as? Int
        feature_flag = dictionary["feature_flag"] as? Int
        date = dictionary["date"] as? String
        if (dictionary["image"] != nil) { image = Image.modelsFromDictionaryArray(array: dictionary["image"] as! NSArray) }
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.user_id, forKey: "user_id")
        dictionary.setValue(self.category_name, forKey: "category_name")
        dictionary.setValue(self.sub_category_name, forKey: "sub_category_name")
        dictionary.setValue(self.child_sub_category_name, forKey: "child_sub_category_name")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.city_name, forKey: "city_name")
        dictionary.setValue(self.price, forKey: "price")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.phone_flag, forKey: "phone_flag")
        dictionary.setValue(self.chat_flag, forKey: "chat_flag")
        dictionary.setValue(self.feature_flag, forKey: "feature_flag")
        dictionary.setValue(self.date, forKey: "date")

        return dictionary
    }
}
/* <<<<<<<<<< COMMON ADS END >>>>>>>>>> */



/* <<<<<<<<<< KIDS START >>>>>>>>>> */
public class Kid_clothe {
    public var current_page : Int?
    public var data : Array<KidsClothData>?
    public var first_page_url : String?
    public var from : Int?
    public var last_page : Int?
    public var last_page_url : String?
    public var next_page_url : String?
    public var path : String?
    public var per_page : Int?
    public var prev_page_url : String?
    public var to : Int?
    public var total : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Kid_clothe]
    {
        var models:[Kid_clothe] = []
        for item in array
        {
            models.append(Kid_clothe(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        current_page = dictionary["current_page"] as? Int
        if (dictionary["data"] != nil) { data = KidsClothData.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
        first_page_url = dictionary["first_page_url"] as? String
        from = dictionary["from"] as? Int
        last_page = dictionary["last_page"] as? Int
        last_page_url = dictionary["last_page_url"] as? String
        next_page_url = dictionary["next_page_url"] as? String
        path = dictionary["path"] as? String
        per_page = dictionary["per_page"] as? Int
        prev_page_url = dictionary["prev_page_url"] as? String
        to = dictionary["to"] as? Int
        total = dictionary["total"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.current_page, forKey: "current_page")
        dictionary.setValue(self.first_page_url, forKey: "first_page_url")
        dictionary.setValue(self.from, forKey: "from")
        dictionary.setValue(self.last_page, forKey: "last_page")
        dictionary.setValue(self.last_page_url, forKey: "last_page_url")
        dictionary.setValue(self.next_page_url, forKey: "next_page_url")
        dictionary.setValue(self.path, forKey: "path")
        dictionary.setValue(self.per_page, forKey: "per_page")
        dictionary.setValue(self.prev_page_url, forKey: "prev_page_url")
        dictionary.setValue(self.to, forKey: "to")
        dictionary.setValue(self.total, forKey: "total")

        return dictionary
    }
}

public class KidsClothData {
    public var id : Int?
    public var user_id : Int?
    public var category_name : String?
    public var sub_category_name : String?
    public var child_sub_category_name : String?
    public var title : String?
    public var city_name : String?
    public var price : Int?
    public var description : String?
    public var phone_flag : Int?
    public var chat_flag : Int?
    public var feature_flag : Int?
    public var date : String?
    public var size_id : Int?
    public var image : Array<Image>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [KidsClothData]
    {
        var models:[KidsClothData] = []
        for item in array
        {
            models.append(KidsClothData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        user_id = dictionary["user_id"] as? Int
        category_name = dictionary["category_name"] as? String
        sub_category_name = dictionary["sub_category_name"] as? String
        child_sub_category_name = dictionary["child_sub_category_name"] as? String
        title = dictionary["title"] as? String
        city_name = dictionary["city_name"] as? String
        price = dictionary["price"] as? Int
        description = dictionary["description"] as? String
        phone_flag = dictionary["phone_flag"] as? Int
        chat_flag = dictionary["chat_flag"] as? Int
        feature_flag = dictionary["feature_flag"] as? Int
        date = dictionary["date"] as? String
        size_id = dictionary["size_id"] as? Int
        if (dictionary["image"] != nil) { image = Image.modelsFromDictionaryArray(array: dictionary["image"] as! NSArray) }
    }
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.user_id, forKey: "user_id")
        dictionary.setValue(self.category_name, forKey: "category_name")
        dictionary.setValue(self.sub_category_name, forKey: "sub_category_name")
        dictionary.setValue(self.child_sub_category_name, forKey: "child_sub_category_name")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.city_name, forKey: "city_name")
        dictionary.setValue(self.price, forKey: "price")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.phone_flag, forKey: "phone_flag")
        dictionary.setValue(self.chat_flag, forKey: "chat_flag")
        dictionary.setValue(self.feature_flag, forKey: "feature_flag")
        dictionary.setValue(self.date, forKey: "date")
        dictionary.setValue(self.size_id, forKey: "size_id")

        return dictionary
    }

}
/* <<<<<<<<<< KIDS END >>>>>>>>>> */


/* <<<<<<<<<< MOBILE AND COMMUNICATION START >>>>>>>>>> */
public class Basic {
    public var current_page : Int?
    public var data : Array<MobileCommunicationData>?
    public var first_page_url : String?
    public var from : Int?
    public var last_page : Int?
    public var last_page_url : String?
    public var next_page_url : String?
    public var path : String?
    public var per_page : Int?
    public var prev_page_url : String?
    public var to : Int?
    public var total : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Basic]
    {
        var models:[Basic] = []
        for item in array
        {
            models.append(Basic(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        current_page = dictionary["current_page"] as? Int
        if (dictionary["data"] != nil) { data = MobileCommunicationData.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
        first_page_url = dictionary["first_page_url"] as? String
        from = dictionary["from"] as? Int
        last_page = dictionary["last_page"] as? Int
        last_page_url = dictionary["last_page_url"] as? String
        next_page_url = dictionary["next_page_url"] as? String
        path = dictionary["path"] as? String
        per_page = dictionary["per_page"] as? Int
        prev_page_url = dictionary["prev_page_url"] as? String
        to = dictionary["to"] as? Int
        total = dictionary["total"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.current_page, forKey: "current_page")
        dictionary.setValue(self.first_page_url, forKey: "first_page_url")
        dictionary.setValue(self.from, forKey: "from")
        dictionary.setValue(self.last_page, forKey: "last_page")
        dictionary.setValue(self.last_page_url, forKey: "last_page_url")
        dictionary.setValue(self.next_page_url, forKey: "next_page_url")
        dictionary.setValue(self.path, forKey: "path")
        dictionary.setValue(self.per_page, forKey: "per_page")
        dictionary.setValue(self.prev_page_url, forKey: "prev_page_url")
        dictionary.setValue(self.to, forKey: "to")
        dictionary.setValue(self.total, forKey: "total")

        return dictionary
    }
}
public class MobileCommunicationData {
    public var id : Int?
    public var user_id : Int?
    public var category_name : String?
    public var sub_category_name : String?
    public var child_sub_category_name : String?
    public var title : String?
    public var city_name : String?
    public var price : Int?
    public var description : String?
    public var phone_flag : Int?
    public var chat_flag : Int?
    public var feature_flag : Int?
    public var date : String?
    public var image : Array<Image>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [MobileCommunicationData]
    {
        var models:[MobileCommunicationData] = []
        for item in array
        {
            models.append(MobileCommunicationData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        user_id = dictionary["user_id"] as? Int
        category_name = dictionary["category_name"] as? String
        sub_category_name = dictionary["sub_category_name"] as? String
        child_sub_category_name = dictionary["child_sub_category_name"] as? String
        title = dictionary["title"] as? String
        city_name = dictionary["city_name"] as? String
        price = dictionary["price"] as? Int
        description = dictionary["description"] as? String
        phone_flag = dictionary["phone_flag"] as? Int
        chat_flag = dictionary["chat_flag"] as? Int
        feature_flag = dictionary["feature_flag"] as? Int
        date = dictionary["date"] as? String
        if (dictionary["image"] != nil) { image = Image.modelsFromDictionaryArray(array: dictionary["image"] as! NSArray) }
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.user_id, forKey: "user_id")
        dictionary.setValue(self.category_name, forKey: "category_name")
        dictionary.setValue(self.sub_category_name, forKey: "sub_category_name")
        dictionary.setValue(self.child_sub_category_name, forKey: "child_sub_category_name")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.city_name, forKey: "city_name")
        dictionary.setValue(self.price, forKey: "price")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.phone_flag, forKey: "phone_flag")
        dictionary.setValue(self.chat_flag, forKey: "chat_flag")
        dictionary.setValue(self.feature_flag, forKey: "feature_flag")
        dictionary.setValue(self.date, forKey: "date")

        return dictionary
    }
}


/* <<<<<<<<<< MOBILE AND COMMUNICATION END >>>>>>>>>> */


/* <<<<<<<<<< JOBS START >>>>>>>>>> */
public class Job {
    public var current_page : Int?
    public var data : Array<JobsData>?
    public var first_page_url : String?
    public var from : Int?
    public var last_page : Int?
    public var last_page_url : String?
    public var next_page_url : String?
    public var path : String?
    public var per_page : Int?
    public var prev_page_url : String?
    public var to : Int?
    public var total : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Job]
    {
        var models:[Job] = []
        for item in array
        {
            models.append(Job(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        current_page = dictionary["current_page"] as? Int
        if (dictionary["data"] != nil) { data = JobsData.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
        first_page_url = dictionary["first_page_url"] as? String
        from = dictionary["from"] as? Int
        last_page = dictionary["last_page"] as? Int
        last_page_url = dictionary["last_page_url"] as? String
        next_page_url = dictionary["next_page_url"] as? String
        path = dictionary["path"] as? String
        per_page = dictionary["per_page"] as? Int
        prev_page_url = dictionary["prev_page_url"] as? String
        to = dictionary["to"] as? Int
        total = dictionary["total"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.current_page, forKey: "current_page")
        dictionary.setValue(self.first_page_url, forKey: "first_page_url")
        dictionary.setValue(self.from, forKey: "from")
        dictionary.setValue(self.last_page, forKey: "last_page")
        dictionary.setValue(self.last_page_url, forKey: "last_page_url")
        dictionary.setValue(self.next_page_url, forKey: "next_page_url")
        dictionary.setValue(self.path, forKey: "path")
        dictionary.setValue(self.per_page, forKey: "per_page")
        dictionary.setValue(self.prev_page_url, forKey: "prev_page_url")
        dictionary.setValue(self.to, forKey: "to")
        dictionary.setValue(self.total, forKey: "total")

        return dictionary
    }
}

public class JobsData {
    public var id : Int?
    public var user_id : Int?
    public var category_name : String?
    public var sub_category_name : String?
    public var child_sub_category_name : String?
    public var title : String?
    public var city_name : String?
    public var price : Int?
    public var description : String?
    public var phone_flag : Int?
    public var chat_flag : Int?
    public var feature_flag : Int?
    public var date : String?
    public var job_type : String?
    public var experience : String?
    public var image : Array<Image>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [JobsData]
    {
        var models:[JobsData] = []
        for item in array
        {
            models.append(JobsData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        user_id = dictionary["user_id"] as? Int
        category_name = dictionary["category_name"] as? String
        sub_category_name = dictionary["sub_category_name"] as? String
        child_sub_category_name = dictionary["child_sub_category_name"] as? String
        title = dictionary["title"] as? String
        city_name = dictionary["city_name"] as? String
        price = dictionary["price"] as? Int
        description = dictionary["description"] as? String
        phone_flag = dictionary["phone_flag"] as? Int
        chat_flag = dictionary["chat_flag"] as? Int
        feature_flag = dictionary["feature_flag"] as? Int
        date = dictionary["date"] as? String
        job_type = dictionary["job_type"] as? String
        experience = dictionary["experience"] as? String
        if (dictionary["image"] != nil) { image = Image.modelsFromDictionaryArray(array: dictionary["image"] as! NSArray) }
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.user_id, forKey: "user_id")
        dictionary.setValue(self.category_name, forKey: "category_name")
        dictionary.setValue(self.sub_category_name, forKey: "sub_category_name")
        dictionary.setValue(self.child_sub_category_name, forKey: "child_sub_category_name")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.city_name, forKey: "city_name")
        dictionary.setValue(self.price, forKey: "price")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.phone_flag, forKey: "phone_flag")
        dictionary.setValue(self.chat_flag, forKey: "chat_flag")
        dictionary.setValue(self.feature_flag, forKey: "feature_flag")
        dictionary.setValue(self.date, forKey: "date")
        dictionary.setValue(self.job_type, forKey: "job_type")
        dictionary.setValue(self.experience, forKey: "experience")

        return dictionary
    }
}
/* <<<<<<<<<< JOBS END >>>>>>>>>> */


/* <<<<<<<<<< BUILDING AND MATERIAL START >>>>>>>>>> */
public class Building {
    public var current_page : Int?
    public var data : Array<BuildingData>?
    public var first_page_url : String?
    public var from : Int?
    public var last_page : Int?
    public var last_page_url : String?
    public var next_page_url : String?
    public var path : String?
    public var per_page : Int?
    public var prev_page_url : String?
    public var to : Int?
    public var total : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Building]
    {
        var models:[Building] = []
        for item in array
        {
            models.append(Building(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    required public init?(dictionary: NSDictionary) {

        current_page = dictionary["current_page"] as? Int
        if (dictionary["data"] != nil) { data = BuildingData.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
        first_page_url = dictionary["first_page_url"] as? String
        from = dictionary["from"] as? Int
        last_page = dictionary["last_page"] as? Int
        last_page_url = dictionary["last_page_url"] as? String
        next_page_url = dictionary["next_page_url"] as? String
        path = dictionary["path"] as? String
        per_page = dictionary["per_page"] as? Int
        prev_page_url = dictionary["prev_page_url"] as? String
        to = dictionary["to"] as? Int
        total = dictionary["total"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.current_page, forKey: "current_page")
        dictionary.setValue(self.first_page_url, forKey: "first_page_url")
        dictionary.setValue(self.from, forKey: "from")
        dictionary.setValue(self.last_page, forKey: "last_page")
        dictionary.setValue(self.last_page_url, forKey: "last_page_url")
        dictionary.setValue(self.next_page_url, forKey: "next_page_url")
        dictionary.setValue(self.path, forKey: "path")
        dictionary.setValue(self.per_page, forKey: "per_page")
        dictionary.setValue(self.prev_page_url, forKey: "prev_page_url")
        dictionary.setValue(self.to, forKey: "to")
        dictionary.setValue(self.total, forKey: "total")

        return dictionary
    }
}

public class BuildingData {
    public var id : Int?
    public var user_id : Int?
    public var category_name : String?
    public var sub_category_name : String?
    public var child_sub_category_name : String?
    public var title : String?
    public var city_name : String?
    public var price : Int?
    public var description : String?
    public var phone_flag : Int?
    public var chat_flag : Int?
    public var feature_flag : Int?
    public var date : String?
    public var delivery : String?
    public var image : Array<Image>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [BuildingData]
    {
        var models:[BuildingData] = []
        for item in array
        {
            models.append(BuildingData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        user_id = dictionary["user_id"] as? Int
        category_name = dictionary["category_name"] as? String
        sub_category_name = dictionary["sub_category_name"] as? String
        child_sub_category_name = dictionary["child_sub_category_name"] as? String
        title = dictionary["title"] as? String
        city_name = dictionary["city_name"] as? String
        price = dictionary["price"] as? Int
        description = dictionary["description"] as? String
        phone_flag = dictionary["phone_flag"] as? Int
        chat_flag = dictionary["chat_flag"] as? Int
        feature_flag = dictionary["feature_flag"] as? Int
        date = dictionary["date"] as? String
        delivery = dictionary["delivery"] as? String
        if (dictionary["image"] != nil) { image = Image.modelsFromDictionaryArray(array: dictionary["image"] as! NSArray) }
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.user_id, forKey: "user_id")
        dictionary.setValue(self.category_name, forKey: "category_name")
        dictionary.setValue(self.sub_category_name, forKey: "sub_category_name")
        dictionary.setValue(self.child_sub_category_name, forKey: "child_sub_category_name")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.city_name, forKey: "city_name")
        dictionary.setValue(self.price, forKey: "price")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.phone_flag, forKey: "phone_flag")
        dictionary.setValue(self.chat_flag, forKey: "chat_flag")
        dictionary.setValue(self.feature_flag, forKey: "feature_flag")
        dictionary.setValue(self.date, forKey: "date")
        dictionary.setValue(self.delivery, forKey: "delivery")

        return dictionary
    }
}
/* <<<<<<<<<< BUILDING AND MATERIAL END >>>>>>>>>> */




// MARKET START
public class Market {
    public var current_page : Int?
    public var data : Array<DataMarket>?
    public var first_page_url : String?
    public var from : Int?
    public var last_page : Int?
    public var last_page_url : String?
    public var next_page_url : String?
    public var path : String?
    public var per_page : Int?
    public var prev_page_url : String?
    public var to : Int?
    public var total : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Market]
    {

        var models:[Market] = []

        for item in array
        {
            models.append(Market(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        current_page = dictionary["current_page"] as? Int
        if (dictionary["data"] != nil) { data = DataMarket.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
        first_page_url = dictionary["first_page_url"] as? String
        from = dictionary["from"] as? Int
        last_page = dictionary["last_page"] as? Int
        last_page_url = dictionary["last_page_url"] as? String
        next_page_url = dictionary["next_page_url"] as? String
        path = dictionary["path"] as? String
        per_page = dictionary["per_page"] as? Int
        prev_page_url = dictionary["prev_page_url"] as? String
        to = dictionary["to"] as? Int
        total = dictionary["total"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.current_page, forKey: "current_page")
        dictionary.setValue(self.first_page_url, forKey: "first_page_url")
        dictionary.setValue(self.from, forKey: "from")
        dictionary.setValue(self.last_page, forKey: "last_page")
        dictionary.setValue(self.last_page_url, forKey: "last_page_url")
        dictionary.setValue(self.next_page_url, forKey: "next_page_url")
        dictionary.setValue(self.path, forKey: "path")
        dictionary.setValue(self.per_page, forKey: "per_page")
        dictionary.setValue(self.prev_page_url, forKey: "prev_page_url")
        dictionary.setValue(self.to, forKey: "to")
        dictionary.setValue(self.total, forKey: "total")

        return dictionary
    }
}

public class DataMarket {
    public var id : Int?
    public var user_id : Int?
    public var category_name : String?
    public var sub_category_name : String?
    public var child_sub_category_name : String?
    public var title : String?
    public var city_name : String?
    public var price : Int?
    public var description : String?
    public var phone_flag : Int?
    public var chat_flag : Int?
    public var feature_flag : Int?
    public var date : String?
    public var market_name : String?
    public var image : Array<Image>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [DataMarket]
    {
        var models:[DataMarket] = []
        for item in array
        {
            models.append(DataMarket(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        user_id = dictionary["user_id"] as? Int
        category_name = dictionary["category_name"] as? String
        sub_category_name = dictionary["sub_category_name"] as? String
        child_sub_category_name = dictionary["child_sub_category_name"] as? String
        title = dictionary["title"] as? String
        city_name = dictionary["city_name"] as? String
        price = dictionary["price"] as? Int
        description = dictionary["description"] as? String
        phone_flag = dictionary["phone_flag"] as? Int
        chat_flag = dictionary["chat_flag"] as? Int
        feature_flag = dictionary["feature_flag"] as? Int
        date = dictionary["date"] as? String
        market_name = dictionary["market_name"] as? String
        if (dictionary["image"] != nil) { image = Image.modelsFromDictionaryArray(array: dictionary["image"] as! NSArray) }
    }

    public func dictionaryRepresentation() -> NSDictionary {

        
        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.user_id, forKey: "user_id")
        dictionary.setValue(self.category_name, forKey: "category_name")
        dictionary.setValue(self.sub_category_name, forKey: "sub_category_name")
        dictionary.setValue(self.child_sub_category_name, forKey: "child_sub_category_name")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.city_name, forKey: "city_name")
        dictionary.setValue(self.price, forKey: "price")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.phone_flag, forKey: "phone_flag")
        dictionary.setValue(self.chat_flag, forKey: "chat_flag")
        dictionary.setValue(self.feature_flag, forKey: "feature_flag")
        dictionary.setValue(self.date, forKey: "date")
        dictionary.setValue(self.market_name, forKey: "market_name")

        return dictionary
    }
}

// MARKET END


public class Real_estate {
    public var current_page : Int?
    public var data : Array<DataModel>?
    public var first_page_url : String?
    public var from : Int?
    public var last_page : Int?
    public var last_page_url : String?
    public var next_page_url : String?
    public var path : String?
    public var per_page : Int?
    public var prev_page_url : String?
    public var to : Int?
    public var total : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Real_estate]
    {
        var models:[Real_estate] = []
        for item in array
        {
            models.append(Real_estate(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        current_page = dictionary["current_page"] as? Int
        if (dictionary["data"] != nil) { data = DataModel.modelsFromDictionaryArray(array: dictionary["data"] as! NSArray) }
        first_page_url = dictionary["first_page_url"] as? String
        from = dictionary["from"] as? Int
        last_page = dictionary["last_page"] as? Int
        last_page_url = dictionary["last_page_url"] as? String
        next_page_url = dictionary["next_page_url"] as? String
        path = dictionary["path"] as? String
        per_page = dictionary["per_page"] as? Int
        prev_page_url = dictionary["prev_page_url"] as? String
        to = dictionary["to"] as? Int
        total = dictionary["total"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.current_page, forKey: "current_page")
        dictionary.setValue(self.first_page_url, forKey: "first_page_url")
        dictionary.setValue(self.from, forKey: "from")
        dictionary.setValue(self.last_page, forKey: "last_page")
        dictionary.setValue(self.last_page_url, forKey: "last_page_url")
        dictionary.setValue(self.next_page_url, forKey: "next_page_url")
        dictionary.setValue(self.path, forKey: "path")
        dictionary.setValue(self.per_page, forKey: "per_page")
        dictionary.setValue(self.prev_page_url, forKey: "prev_page_url")
        dictionary.setValue(self.to, forKey: "to")
        dictionary.setValue(self.total, forKey: "total")

        return dictionary
    }

}


public class DataModel {
    public var id : Int?
    public var user_id : Int?
    public var category_name : String?
    public var sub_category_name : String?
    public var child_sub_category_name : String?
    public var title : String?
    public var city_name : String?
    public var price : Int?
    public var description : String?
    public var phone_flag : Int?
    public var chat_flag : Int?
    public var feature_flag_flag : String?
    public var date : String?
    public var building_type_name : String?
    public var area : String?
    public var floor_number : String?
    public var repair_name : String?
    public var image : Array<Image>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [DataModel]
    {
        var models:[DataModel] = []
        for item in array
        {
            models.append(DataModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        user_id = dictionary["user_id"] as? Int
        category_name = dictionary["category_name"] as? String
        sub_category_name = dictionary["sub_category_name"] as? String
        child_sub_category_name = dictionary["child_sub_category_name"] as? String
        title = dictionary["title"] as? String
        city_name = dictionary["city_name"] as? String
        price = dictionary["price"] as? Int
        description = dictionary["description"] as? String
        phone_flag = dictionary["phone_flag"] as? Int
        chat_flag = dictionary["chat_flag"] as? Int
        feature_flag_flag = dictionary["feature_flag_flag"] as? String
        date = dictionary["date"] as? String
        building_type_name = dictionary["building_type_name"] as? String
        area = dictionary["area"] as? String
        floor_number = dictionary["floor_number"] as? String
        repair_name = dictionary["repair_name"] as? String
        if (dictionary["image"] != nil) { image = Image.modelsFromDictionaryArray(array: dictionary["image"] as! NSArray) }
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.user_id, forKey: "user_id")
        dictionary.setValue(self.category_name, forKey: "category_name")
        dictionary.setValue(self.sub_category_name, forKey: "sub_category_name")
        dictionary.setValue(self.child_sub_category_name, forKey: "child_sub_category_name")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.city_name, forKey: "city_name")
        dictionary.setValue(self.price, forKey: "price")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.phone_flag, forKey: "phone_flag")
        dictionary.setValue(self.chat_flag, forKey: "chat_flag")
        dictionary.setValue(self.feature_flag_flag, forKey: "feature_flag_flag")
        dictionary.setValue(self.date, forKey: "date")
        dictionary.setValue(self.building_type_name, forKey: "building_type_name")
        dictionary.setValue(self.area, forKey: "area")
        dictionary.setValue(self.floor_number, forKey: "floor_number")
        dictionary.setValue(self.repair_name, forKey: "repair_name")

        return dictionary
    }
}

public class Image {
    public var image : String?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Image]
    {
        var models:[Image] = []
        for item in array
        {
            models.append(Image(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        image = dictionary["image"] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.image, forKey: "image")
        
        return dictionary
    }
    
}
