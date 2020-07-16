

import Foundation
 
public class ProductDetailModel {
	public var success : Bool?
	public var code : Int?
	public var message : String?
	public var data : Data?

    public class func modelsFromDictionaryArray(array:NSArray) -> [ProductDetailModel]
    {
        var models:[ProductDetailModel] = []
        for item in array
        {
            models.append(ProductDetailModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {

		success = dictionary["success"] as? Bool
		code = dictionary["code"] as? Int
		message = dictionary["message"] as? String
		if (dictionary["data"] != nil) { data = Data(dictionary: dictionary["data"] as! NSDictionary) }
	}

    public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.success, forKey: "success")
		dictionary.setValue(self.code, forKey: "code")
		dictionary.setValue(self.message, forKey: "message")
		dictionary.setValue(self.data?.dictionaryRepresentation(), forKey: "data")

		return dictionary
	}

}


public class ProductDataModel {
    public var posting_detail : Posting_detail?
    public var related_post : Array<Related_post>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [ProductDataModel]
    {
        var models:[ProductDataModel] = []
        for item in array
        {
            models.append(ProductDataModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        if (dictionary["posting_detail"] != nil) { posting_detail = Posting_detail(dictionary: dictionary["posting_detail"] as! NSDictionary) }
        if (dictionary["related_post"] != nil) { related_post = Related_post.modelsFromDictionaryArray(array: dictionary["related_post"] as! NSArray) }
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.posting_detail?.dictionaryRepresentation(), forKey: "posting_detail")

        return dictionary
    }
}


public class Posting_detail {
    public var id : Int?
    public var user_id : Int?
    public var user_name : String?
    public var user_phone : String?
    public var phone_flag : String?
    public var user_image : String?
    public var category_name : String?
    public var category_id : Int?
    public var sub_category_name : String?
    public var child_sub_category_name : String?
    public var title : String?
    public var city_name : String?
    public var price : Int?
    public var description : String?
    public var chat_flag : Int?
    public var feature_flag_flag : String?
    public var date : String?
    public var view_count : Int?
    public var since_date : String?
    public var building_type_name : String?
    public var area : String?
    public var floor_number : String?
    public var repair_name : String?
    public var url : String?
    public var image : Array<Image>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Posting_detail]
    {
        var models:[Posting_detail] = []
        for item in array
        {
            models.append(Posting_detail(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        user_id = dictionary["user_id"] as? Int
        user_name = dictionary["user_name"] as? String
        user_phone = dictionary["user_phone"] as? String
        phone_flag = dictionary["phone_flag"] as? String
        user_image = dictionary["user_image"] as? String
        category_name = dictionary["category_name"] as? String
        category_id = dictionary["category_id"] as? Int
        sub_category_name = dictionary["sub_category_name"] as? String
        child_sub_category_name = dictionary["child_sub_category_name"] as? String
        title = dictionary["title"] as? String
        city_name = dictionary["city_name"] as? String
        price = dictionary["price"] as? Int
        description = dictionary["description"] as? String
        chat_flag = dictionary["chat_flag"] as? Int
        feature_flag_flag = dictionary["feature_flag_flag"] as? String
        date = dictionary["date"] as? String
        view_count = dictionary["view_count"] as? Int
        since_date = dictionary["since_date"] as? String
        building_type_name = dictionary["building_type_name"] as? String
        area = dictionary["area"] as? String
        floor_number = dictionary["floor_number"] as? String
        repair_name = dictionary["repair_name"] as? String
        url = dictionary["url"] as? String
        if (dictionary["image"] != nil) { image = Image.modelsFromDictionaryArray(array: dictionary["image"] as! NSArray) }
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.user_id, forKey: "user_id")
        dictionary.setValue(self.user_name, forKey: "user_name")
        dictionary.setValue(self.user_phone, forKey: "user_phone")
        dictionary.setValue(self.phone_flag, forKey: "phone_flag")
        dictionary.setValue(self.user_image, forKey: "user_image")
        dictionary.setValue(self.category_name, forKey: "category_name")
        dictionary.setValue(self.category_id, forKey: "category_id")
        dictionary.setValue(self.sub_category_name, forKey: "sub_category_name")
        dictionary.setValue(self.child_sub_category_name, forKey: "child_sub_category_name")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.city_name, forKey: "city_name")
        dictionary.setValue(self.price, forKey: "price")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.chat_flag, forKey: "chat_flag")
        dictionary.setValue(self.feature_flag_flag, forKey: "feature_flag_flag")
        dictionary.setValue(self.date, forKey: "date")
        dictionary.setValue(self.view_count, forKey: "view_count")
        dictionary.setValue(self.since_date, forKey: "since_date")
        dictionary.setValue(self.building_type_name, forKey: "building_type_name")
        dictionary.setValue(self.area, forKey: "area")
        dictionary.setValue(self.floor_number, forKey: "floor_number")
        dictionary.setValue(self.repair_name, forKey: "repair_name")
        dictionary.setValue(self.url, forKey: "url")

        return dictionary
    }
}


public class Related_post {
    public var id : Int?
    public var user_id : Int?
    public var category_id : Int?
    public var category_name : String?
    public var sub_category_name : String?
    public var child_sub_category_name : String?
    public var title : String?
    public var city_name : String?
    public var price : String?
    public var description : String?
    public var phone_flag : Int?
    public var chat_flag : String?
    public var feature_flag_flag : String?
    public var date : String?
    public var view_count : Int?
    public var building_type_name : String?
    public var area : String?
    public var floor_number : String?
    public var repair_name : String?
    public var url : String?
    public var image : Array<ProductImage>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Related_post]
    {
        var models:[Related_post] = []
        for item in array
        {
            models.append(Related_post(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        user_id = dictionary["user_id"] as? Int
        category_id = dictionary["category_id"] as? Int
        category_name = dictionary["category_name"] as? String
        sub_category_name = dictionary["sub_category_name"] as? String
        child_sub_category_name = dictionary["child_sub_category_name"] as? String
        title = dictionary["title"] as? String
        city_name = dictionary["city_name"] as? String
        price = dictionary["price"] as? String
        description = dictionary["description"] as? String
        phone_flag = dictionary["phone_flag"] as? Int
        chat_flag = dictionary["chat_flag"] as? String
        feature_flag_flag = dictionary["feature_flag_flag"] as? String
        date = dictionary["date"] as? String
        view_count = dictionary["view_count"] as? Int
        building_type_name = dictionary["building_type_name"] as? String
        area = dictionary["area"] as? String
        floor_number = dictionary["floor_number"] as? String
        repair_name = dictionary["repair_name"] as? String
        url = dictionary["url"] as? String
        if (dictionary["image"] != nil) { image = ProductImage.modelsFromDictionaryArray(array: dictionary["image"] as! NSArray) }
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.user_id, forKey: "user_id")
        dictionary.setValue(self.category_id, forKey: "category_id")
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
        dictionary.setValue(self.view_count, forKey: "view_count")
        dictionary.setValue(self.building_type_name, forKey: "building_type_name")
        dictionary.setValue(self.area, forKey: "area")
        dictionary.setValue(self.floor_number, forKey: "floor_number")
        dictionary.setValue(self.repair_name, forKey: "repair_name")
        dictionary.setValue(self.url, forKey: "url")

        return dictionary
    }
}

public class ProductImage {
    public var image : String?


    public class func modelsFromDictionaryArray(array:NSArray) -> [ProductImage]
    {
        var models:[ProductImage] = []
        for item in array
        {
            models.append(ProductImage(dictionary: item as! NSDictionary)!)
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

