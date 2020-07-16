

import Foundation
 
public class DynamicModel : NSObject {
	public var success : Bool?
	public var code : Int?
	public var message : String?
	public var data : Data?

    public class func modelsFromDictionaryArray(dic:NSDictionary) -> [DynamicModel]
    {
        var models:[DynamicModel] = []
        models.append(DynamicModel(dictionary: dic)!)
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

public class Data : NSObject
{
    public var building_type : Array<Building_type>?
    public var repair : Array<Repair>?
    public var floor : Array<Floor>?

    
    // Kids
    public var KidsClothSizeArray : Array<KidsClothSize>?
    public var CarModelListArray : Array<CarModel_List>?
    public var motorCondition : Array<MotorCondition>?
    public var yearListArray : Array<YearList>?
    public var bodyWorkListArray : Array<BodyWorkList>?
    public var transmissionListArray : Array<TransmissionList>?
    public var colorArray : Array<Color>?
    public var fuelTypeArray : Array<FuelType>?
    public var engineSizeArray : Array<EngineSize>?
    public var driveUnitListArray : Array<DriveUnitList>?
   // public var carSubModelList : Array<CarSubModelList>?

    public var marketsArray : Array<Markets>?

    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Data]
    {
        var models:[Data] = []
        for item in array
        {
            models.append(Data(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        if Globals.globalCategoryID == 1
        {
            if (dictionary["building_type"] != nil) { building_type = Building_type.modelsFromDictionaryArray(array: dictionary["building_type"] as! NSArray) }
            if (dictionary["repair"] != nil) { repair = Repair.modelsFromDictionaryArray(array: dictionary["repair"] as! NSArray) }
            if (dictionary["floor"] != nil) { floor = Floor.modelsFromDictionaryArray(array: dictionary["floor"] as! NSArray) }
        }
        else if Globals.globalCategoryID == 8
        {
            if (dictionary["size"] != nil) { KidsClothSizeArray = KidsClothSize.modelsFromDictionaryArray(array: dictionary["size"] as! NSArray) }
        }
        else if Globals.globalCategoryID == 3
        {
            if (dictionary["carModelList"] != nil) { CarModelListArray = CarModel_List.modelsFromDictionaryArray(array: dictionary["carModelList"] as! NSArray) }
            
            if (dictionary["motorCondition"] != nil) { motorCondition = MotorCondition.modelsFromDictionaryArray(array: dictionary["motorCondition"] as! NSArray) }

            if (dictionary["yearList"] != nil) { yearListArray = YearList.modelsFromDictionaryArray(array: dictionary["yearList"] as! NSArray) }

            if (dictionary["bodyWorkList"] != nil) { bodyWorkListArray = BodyWorkList.modelsFromDictionaryArray(array: dictionary["bodyWorkList"] as! NSArray) }

            if (dictionary["transmissionList"] != nil) { transmissionListArray = TransmissionList.modelsFromDictionaryArray(array: dictionary["transmissionList"] as! NSArray) }

            
            if (dictionary["color"] != nil) { colorArray = Color.modelsFromDictionaryArray(array: dictionary["color"] as! NSArray) }

            if (dictionary["fuelType"] != nil) { fuelTypeArray = FuelType.modelsFromDictionaryArray(array: dictionary["fuelType"] as! NSArray) }

            if (dictionary["engineSize"] != nil) { engineSizeArray = EngineSize.modelsFromDictionaryArray(array: dictionary["engineSize"] as! NSArray) }

            if (dictionary["driveUnitList"] != nil) { driveUnitListArray = DriveUnitList.modelsFromDictionaryArray(array: dictionary["driveUnitList"] as! NSArray) }
        }
        else if Globals.globalCategoryID == 4
        {
            if (dictionary["size"] != nil) { marketsArray = Markets.modelsFromDictionaryArray(array: dictionary["size"] as! NSArray) }
        }
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        return dictionary
    }
}

// Start Motor List

public class MotorCondition : NSObject
{
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [MotorCondition]
    {
        var models:[MotorCondition] = []
        for item in array
        {
            models.append(MotorCondition(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")

        return dictionary
    }
}

public class YearList : NSObject
{
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [YearList]
    {
        var models:[YearList] = []
        for item in array
        {
            models.append(YearList(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")

        return dictionary
    }
}

public class BodyWorkList : NSObject
{
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [BodyWorkList]
    {
        var models:[BodyWorkList] = []
        for item in array
        {
            models.append(BodyWorkList(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")

        return dictionary
    }
}

public class TransmissionList : NSObject
{
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [TransmissionList]
    {
        var models:[TransmissionList] = []
        for item in array
        {
            models.append(TransmissionList(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")

        return dictionary
    }
}

public class Color : NSObject
{
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Color]
    {
        var models:[Color] = []
        for item in array
        {
            models.append(Color(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")

        return dictionary
    }
}

public class FuelType : NSObject
{
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [FuelType]
    {
        var models:[FuelType] = []
        for item in array
        {
            models.append(FuelType(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")

        return dictionary
    }
}

public class EngineSize : NSObject
{
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [EngineSize]
    {
        var models:[EngineSize] = []
        for item in array
        {
            models.append(EngineSize(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")

        return dictionary
    }
}

public class DriveUnitList : NSObject
{
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [DriveUnitList]
    {
        var models:[DriveUnitList] = []
        for item in array
        {
            models.append(DriveUnitList(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")

        return dictionary
    }
}

// End Motor List
public class KidsClothSize : NSObject
{
    public var id : Int?
    public var name : String?
    public var status : Int?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [KidsClothSize]
    {
        var models:[KidsClothSize] = []
        for item in array
        {
            models.append(KidsClothSize(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")

        return dictionary
    }
}

public class CarModel_List : NSObject
{
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [CarModel_List]
    {
        var models:[CarModel_List] = []
        for item in array
        {
            models.append(CarModel_List(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")

        return dictionary
    }
}


public class Building_type : NSObject
{
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Building_type]
    {
        var models:[Building_type] = []
        for item in array
        {
            models.append(Building_type(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")

        return dictionary
    }
}

public class Floor : NSObject {
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Floor]
    {
        var models:[Floor] = []
        for item in array
        {
            models.append(Floor(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")
        return dictionary
    }

}

public class Markets : NSObject {
    public var id : Int?
    public var name : String?
    public var status : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Markets]
    {
        var models:[Markets] = []
        for item in array
        {
            models.append(Markets(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")
        return dictionary
    }

}

public class Repair : NSObject {
    public var id : Int?
    public var name : String?
    public var status : Int?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Repair]
    {
        var models:[Repair] = []
        for item in array
        {
            models.append(Repair(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {

        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        status = dictionary["status"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.status, forKey: "status")

        return dictionary
    }
}
