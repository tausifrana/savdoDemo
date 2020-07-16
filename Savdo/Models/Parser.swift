//
//  Parser.swift
//  Bazaraki
//
//  Created by My MAC on 3/1/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import Foundation
import Alamofire

typealias DownloadComplete = () -> ()
typealias CompletionHandler<T> = (_ Success: Bool, _ data: T) -> ()

@objc protocol DownloadDelegate {
    @objc optional func downloadCompleted(isCompleted : Bool)
    @objc optional func downloadCategoriesData(isCompleted : Bool)
    @objc optional func downloadSubCategoriesData(isCompleted : Bool)
    @objc optional func downloadChildSubCategoriesData(isCompleted : Bool)
    @objc optional func downloadDynamicArrayCompleted(isCompleted : Bool)
    @objc optional func downloadCityArrayCompleted(isCompleted : Bool)
    @objc optional func downloadKidsClothSizeArrayCompleted(isCompleted : Bool)
    @objc optional func downloadCarSubModelArrayCompleted(isCompleted : Bool)
    @objc optional func postAdsDataCompleted(isCompleted : Bool)
}

class Parser: NSObject
{
    var headers : [String:String] = ["":""]
    var downloadDelegate : DownloadDelegate!
    static var shared = Parser()
    var isSuccess = true
    
    var arrTempimg:[UIImage] = []

    let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        
        return SessionManager(configuration: configuration)
    }()
    
    func AuthenticationURL()
    {
        let AuthorizarionUser = Constant.url_authorization.userName
        let AuthorizationPassword = Constant.url_authorization.password
        let credentialData = "\(AuthorizarionUser):\(AuthorizationPassword)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        let base64Credentials = credentialData.base64EncodedString()
        headers = ["Authorization": "Basic \(base64Credentials)"]
    }
    
    override init(){}
    // 101 = FUNCTION TO POST ADS
    func postAds(UserID : String, CategoryID : String, SubCategoryID : String, ChildSubCategoryID : String, Title : String, Description : String, Price : String, City_Id : String, Area : String, Type_of_building_Id : String, Floor_Id : String, Repair_Id : String)
    {
        self.postAdsData(UserID: UserID , CategoryID: CategoryID, SubCategoryID: SubCategoryID, ChildSubCategoryID: ChildSubCategoryID, Title: Title, Description: Description, Price: Price, City_Id: City_Id, Area: Area, Type_of_building_Id: Type_of_building_Id, Floor_Id: Floor_Id, Repair_Id: Repair_Id, completed: {
            
            if self.isSuccess
            {
                self.downloadDelegate.postAdsDataCompleted!(isCompleted: true)
            }
            else
            {
                self.downloadDelegate.postAdsDataCompleted!(isCompleted: false)
            }
        })
    }
    
    func postAdsData(UserID : String, CategoryID : String, SubCategoryID : String, ChildSubCategoryID : String, Title : String, Description : String, Price : String, City_Id : String, Area : String, Type_of_building_Id : String, Floor_Id : String, Repair_Id : String, completed: @escaping DownloadComplete)
    {
        AuthenticationURL()
        
        let parameters: Parameters = ["user_id": UserID,"category_id": CategoryID,"sub_category_id": SubCategoryID,"child_sub_category_id": ChildSubCategoryID,"title": Title,"description": Description,"price": Price,"city_id": City_Id,"area": Area,"type_of_building_id": Type_of_building_Id,"floor_id": Floor_Id,"repair_id": Repair_Id]
        
        print("POST ADS PARAMETER",parameters)
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            
            let userData = try? JSONSerialization.data(withJSONObject: parameters)
            multipartFormData.append(userData!, withName: "data")
            
            for i in 0..<Globals.sharedInstance.arrImagePickerArray.count {
                if let dataImages = Globals.sharedInstance.arrImagePickerArray[i].jpegData(compressionQuality: 0.7)
                {
                    multipartFormData.append(dataImages, withName: "images[]", fileName: "\(i).jpg", mimeType: "image/jpg")
                }
            }
        },
        to:Constant.API.postAds, method:.post, headers: headers) { (result) in
            
            switch result
            {
                case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    print(response.result.value)
                    let responseJSON = response.result.value as! [String:AnyObject]
                    
                    self.isSuccess = true
                    completed()
                }
                
                case .failure(let encodingError): break
                print(encodingError)
                self.isSuccess = false
                completed()
            }
        }
    }
    
   /* func getKidsClothSize(CategoryID : String)
    {
        self.getKidsClothSize(CategoryID: CategoryID ,completed: {
            
            if self.isSuccess
            {
                self.downloadDelegate.downloadKidsClothSizeArrayCompleted!(isCompleted: true)
            }
            else
            {
                self.downloadDelegate.downloadKidsClothSizeArrayCompleted!(isCompleted: false)
            }
        })
    }
    
    func getKidsClothSize(CategoryID : String, completed: @escaping DownloadComplete)
       {
           AuthenticationURL()
           
           sessionManager.request(Constant.API.getCity, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
               
               switch response.result {

               case .success(_):
                   
                   if let dic = response.result.value as? Dictionary<String, AnyObject> {
                       
                       let responseCode = dic["code"] as? Int
                       if responseCode == 200
                       {
                           if let arrayData = dic["data"] as? NSArray
                           {
                               let arrCategories : [City] = City.JSONResponse(array: arrayData)
                               Globals.sharedInstance.arrCityData.append(contentsOf:arrCategories)
                               Globals.sharedInstance.cityID.removeAll()
                               Globals.sharedInstance.cityName.removeAll()
                               Globals.sharedInstance.cityDict.removeAll()
                               
                               for i in 0...Globals.sharedInstance.arrCityData.count - 1
                               {
                                   let objClub = Globals.sharedInstance.arrCityData[i]
                                   Globals.sharedInstance.cityID.append(objClub.id!)
                                   Globals.sharedInstance.cityName.append(objClub.name!)
                               }
                               Globals.sharedInstance.cityDict = Dictionary(uniqueKeysWithValues: zip(Globals.sharedInstance.cityName, Globals.sharedInstance.cityID))
                             //  self.isSuccess = true
                           }
                       }
                       else
                       {
                           print("ELSE 200")
                       }
                   }
                   
               case .failure(let error):
                   print(error)
                   self.isSuccess = false
               }
               completed()
           }
       }*/
    
    
    func getAllCity()
    {
        self.getAllCityData(completed: {
            
            if self.isSuccess
            {
                self.downloadDelegate.downloadCityArrayCompleted!(isCompleted: true)
            }
            else
            {
                self.downloadDelegate.downloadCityArrayCompleted!(isCompleted: false)
            }
        })
    }
    
    // CATEGORY CLASS
    func getAllCategoriesAPI()
    {
        self.getAllCategoriesData( completed: {
            
            if self.isSuccess
            {
                self.downloadDelegate.downloadCategoriesData!(isCompleted: true)
            }
            else
            {
                self.downloadDelegate.downloadCategoriesData!(isCompleted: false)
            }
        })
    }
    
    func getSubCategoriesAPI(CategoryID : String)
       {
           self.getSubCategoriesData(CategoryID: CategoryID ,completed: {
               
               if self.isSuccess
               {
                   self.downloadDelegate.downloadSubCategoriesData!(isCompleted: true)
               }
               else
               {
                   self.downloadDelegate.downloadSubCategoriesData!(isCompleted: false)
               }
           })
       }
    
    
    func uploadImage()
    {
        
    }
    
    func getChildSubCategoriesAPI(CategoryID : String, SubCategoryID : String)
    {
        self.getChildSubCategoriesData(CategoryID: CategoryID, SubCategoryID: SubCategoryID ,completed: {
            
            if self.isSuccess
            {
                self.downloadDelegate.downloadChildSubCategoriesData!(isCompleted: true)
            }
            else
            {
                self.downloadDelegate.downloadChildSubCategoriesData!(isCompleted: false)
            }
        })
    }
    
    func getDynamicArray(CategoryID : String)
    {
        self.getDynamicArraData(CategoryID: CategoryID ,completed: {
            
            if self.isSuccess
            {
                self.downloadDelegate.downloadDynamicArrayCompleted!(isCompleted: true)
            }
            else
            {
                self.downloadDelegate.downloadDynamicArrayCompleted!(isCompleted: false)
            }
        })
    }
    
    func CarSubModelAPICall(CarModelID : String)
    {
        AuthenticationURL()
        
        let parameters: Parameters = ["car_model_id": CarModelID]

        sessionManager.request(Constant.API.getCarSubModel, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {
               
                
           case .success(_):
               
            if let dic = response.result.value as? Dictionary<String, AnyObject> {
                
                let responseCode = dic["code"] as? Int
                if responseCode == 200
                {
                    if let arrayData = dic["data"] as? NSArray
                    {
                        let arrSubCategories : [CarSubModel] = CarSubModel.JSONResponse(array: arrayData)
                        Globals.sharedInstance.arrSubCarListModel.append(contentsOf: arrSubCategories)
                        self.downloadDelegate.downloadCarSubModelArrayCompleted!(isCompleted: true)
                    }
                }
                else
                {
                    print("ELSE sub 200")
                }
            }
           case .failure(let error):
               print(error)
               self.isSuccess = false
               self.downloadDelegate.downloadCarSubModelArrayCompleted!(isCompleted: false)

           }
        }
    }
    
    func getAllCityData(completed: @escaping DownloadComplete)
    {
        AuthenticationURL()
        
        sessionManager.request(Constant.API.getCity, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {

            case .success(_):
                
                if let dic = response.result.value as? Dictionary<String, AnyObject> {
                    
                    let responseCode = dic["code"] as? Int
                    if responseCode == 200
                    {
                        if let arrayData = dic["data"] as? NSArray
                        {
                            let arrCategories : [City] = City.JSONResponse(array: arrayData)
                            Globals.sharedInstance.arrCityData.append(contentsOf:arrCategories)
                            
                            for i in 0...Globals.sharedInstance.arrCityData.count - 1
                            {
                                let objClub = Globals.sharedInstance.arrCityData[i]
                                Globals.sharedInstance.cityID.append(objClub.id!)
                                Globals.sharedInstance.cityName.append(objClub.name!)
                            }
                            Globals.sharedInstance.cityDict = Dictionary(uniqueKeysWithValues: zip(Globals.sharedInstance.cityName, Globals.sharedInstance.cityID))
                          //self.isSuccess = true
                        }
                    }
                    else
                    {
                        print("ELSE 200")
                    }
                }
                
            case .failure(let error):
                print(error)
                self.isSuccess = false
            }
            completed()
        }
    }
    
    func getDynamicArraData(CategoryID : String, completed: @escaping DownloadComplete)
    {
        AuthenticationURL()
        
        let parameters: Parameters = ["category_id": CategoryID]
        
        sessionManager.request(Constant.API.getDynamicArray, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {

            case .success(_):
                
                if let dic = response.result.value as? Dictionary<String, AnyObject> {
                    
                    let jsonResponse = DynamicModel.modelsFromDictionaryArray(dic: response.result.value as! NSDictionary)
                    let jsonData = jsonResponse[0].data
                    
                    if jsonResponse[0].code == 200
                    {
                        if Globals.globalCategoryID == 1
                        {
                            Globals.sharedInstance.arrBuildingType.append(contentsOf: jsonData!.building_type!)
                            Globals.sharedInstance.arrFloorType.append(contentsOf: jsonData!.floor!)
                            Globals.sharedInstance.arrRepairType.append(contentsOf: jsonData!.repair!)
                        }
                        
                        if Globals.globalCategoryID == 8
                        {
                            Globals.sharedInstance.arrKidsSizeData.append(contentsOf: jsonData!.KidsClothSizeArray!)
                        }
                        
                        if Globals.globalCategoryID == 3
                        {
                            //Globals.sharedInstance.arrCarListModel.append(contentsOf: jsonData!.CarModelListArray!)
                            Globals.sharedInstance.arrMotorCondition.append(contentsOf: jsonData!.motorCondition!)
                            Globals.sharedInstance.arrYearList.append(contentsOf: jsonData!.yearListArray!)
                            Globals.sharedInstance.arrBodyWork.append(contentsOf: jsonData!.bodyWorkListArray!)
                            Globals.sharedInstance.arrTransmissionList.append(contentsOf: jsonData!.transmissionListArray!)
                            Globals.sharedInstance.arrMotorColor.append(contentsOf: jsonData!.colorArray!)
                            Globals.sharedInstance.arrMotorFuelType.append(contentsOf: jsonData!.fuelTypeArray!)
                            Globals.sharedInstance.arrEngineSize.append(contentsOf: jsonData!.engineSizeArray!)
                            Globals.sharedInstance.arrDriveUnit.append(contentsOf: jsonData!.driveUnitListArray!)
                        }
                        if Globals.globalCategoryID == 4
                        {
                            Globals.sharedInstance.arrMarketSize.append(contentsOf: jsonData!.marketsArray!)
                        }
                    }
                    else
                    {
                        print("ELSE 200")
                    }
                    
                }
                
            case .failure(let error):
                print(error)
                self.isSuccess = false
            }
            completed()
        }
    }
    
    // ALL METHODS OF PROTOCOL
    func getAllCategoriesData(completed: @escaping DownloadComplete)
    {
        AuthenticationURL()
        
        sessionManager.request(Constant.API.getAllCategory, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {

            case .success(_):
                
                if let dic = response.result.value as? Dictionary<String, AnyObject> {
                    
                    let responseCode = dic["code"] as? Int
                    if responseCode == 200
                    {
                        if let arrayData = dic["data"] as? NSArray
                        {
                            let arrCategories : [CategoryModel] = CategoryModel.JSONResponse(array: arrayData)
                            Globals.sharedInstance.arrCategoryData.append(contentsOf:arrCategories)
                            self.isSuccess = true
                        }
                    }
                    else
                    {
                        print("ELSE 200")
                    }
                }
                
            case .failure(let error):
                print(error)
                self.isSuccess = false
            }
            completed()
        }
    }
    
    func getSubCategoriesData(CategoryID : String, completed: @escaping DownloadComplete)
    {
        AuthenticationURL()
        
        let parameters: Parameters = ["category_id":CategoryID]
       
        sessionManager.request(Constant.API.getSubCategory, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {

            case .success(_):
                
                if let dic = response.result.value as? Dictionary<String, AnyObject> {
                    
                    let responseCode = dic["code"] as? Int
                    if responseCode == 200
                    {
                        if let arrayData = dic["data"] as? NSArray
                        {
                            let arrSubCategories : [CategoryDetailModel] = CategoryDetailModel.JSONResponse(array: arrayData)
                            Globals.sharedInstance.arrSubCategoryData.append(contentsOf:arrSubCategories)
                            self.isSuccess = true
                        }
                    }
                    else
                    {
                        print("ELSE sub 200")
                    }
                }
                
            case .failure(let error):
                print(error)
                self.isSuccess = false
            }
            completed()
        }
    }
    
    func getChildSubCategoriesData(CategoryID : String, SubCategoryID : String, completed: @escaping DownloadComplete)
       {
           AuthenticationURL()
           
           let parameters: Parameters = ["category_id":CategoryID, "sub_category_id": SubCategoryID]

           sessionManager.request(Constant.API.getChildSubCategory, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
               
               switch response.result {

               case .success(_):
                   
                   if let dic = response.result.value as? Dictionary<String, AnyObject> {
                       
                       let responseCode = dic["code"] as? Int
                       if responseCode == 200
                       {
                           if let arrayData = dic["data"] as? NSArray
                           {
                               let arrChildSubCategories : [ChildCategoryDetailModel] = ChildCategoryDetailModel.JSONResponse(array: arrayData)
                               Globals.sharedInstance.arrChildSubCategoryData.append(contentsOf:arrChildSubCategories)
                               self.isSuccess = true
                           }
                       }
                       else
                       {
                           self.isSuccess = false
                           print("ELSE SUB CHILD 200")
                       }
                   }
                   
               case .failure(let error):
                   print(error)
                   self.isSuccess = false
               }
               completed()
           }
       }
}
