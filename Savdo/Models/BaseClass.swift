//
//  BaseClass.swift
//  Bazaraki
//
//  Created by suresh on 17/12/19.
//  Copyright © 2019 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import Alamofire
import SDLoader

class BaseClass: UIViewController {

    
    var headers : [String:String] = ["":""]
    let sdLoader = SDLoader()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    func clearRealEstateFields()
    {
        Globals.GlobalTittle = ""
        Globals.GlobalDescription = ""
        Globals.GlobalPrice = 0
        Globals.GlobalHiddenPhoneNoValue = 0
        Globals.GlobalTurnOnChatValue = 0
        Globals.GlobalFeatureAdsValue = 0
        
        Globals.GlobalArea = ""
        Globals.GlobalSelectedBuildingTypeID = 0
        Globals.GlobalSelectedFloorTypeID = 0
        Globals.GlobalSelectedRepairID = 0
    }
    
    func MoveToCategoryListScreen()
    {
        self.sdLoader.stopAnimation()
     
        let screen = UserDefaults.standard.string(forKey: Constant.SESSION.SelectedPostAdsScreen)
        
        if screen == "1"
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.ShowAdsVC) as! ShowAdsVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else
        {
            let story = UIStoryboard(name: "Main", bundle:nil)
            let vc = story.instantiateViewController(withIdentifier: "ShowAdsSubCategoryVC") as! ShowAdsSubCategoryVC
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    
    func MoveToImagePicker()
    {
        self.sdLoader.stopAnimation()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.publishImageVC) as! publishImageVC
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // REAL ESTATE SCREEN PARAMETERS (CATEGORY ID : 1)
    func RealEstateAPICall(UserID : String, CategoryID : String, SubCategoryID : String, ChildSubCategoryID : String, Title : String, Description : String, Price : String, City_Id : String, Area : String, Type_of_building_Id : String, Floor_Id : String, Repair_Id : String, PhoneAllowed : String, ChatAllowed : String, FeatureAdsAllowed : String)
    {
        sdLoader.startAnimating(atView: self.view)
        AuthenticationURL()
           
        let parameters: Parameters = ["user_id":  UserDefaults.standard.string(forKey: Constant.SESSION.CustomerID)!,"category_id": CategoryID,"sub_category_id": SubCategoryID,"child_sub_category_id": ChildSubCategoryID,"title": Title,"description": Description,"price": Price,"city_id": City_Id,"area" : Area,"type_of_building_id" : Type_of_building_Id,"floor_id" : Floor_Id,"repair_id" : Repair_Id,"phone_flag": PhoneAllowed,"chat_flag": ChatAllowed,"feature_flag": FeatureAdsAllowed]
        
        print("REAL ESTATE PARARMETER",parameters)
        callAPI(Parameter: parameters, API: Constant.API.postAds)
    }
    
    
    func MotorAPICall(UserID : String, CategoryID : String, SubCategoryID : String, ChildSubCategoryID : String, Title : String, Description : String, Price : String, City_Id : String , PhoneAllowed : String, ChatAllowed : String, FeatureAdsAllowed : String, motor_condition_id : String, year_id: String, fuel_type_id : String, body_work_id : String, transmission_id : String, drive_unit_id : String, color_id : String, clearance : String, exchnge : String,  car_model_id : String, car_sub_model_id : String, engine_size_id : String)
    {
        sdLoader.startAnimating(atView: self.view)
        AuthenticationURL()
           
        let parameters: Parameters = ["user_id":  UserDefaults.standard.string(forKey: Constant.SESSION.CustomerID)!,"category_id": CategoryID,"sub_category_id": SubCategoryID,"child_sub_category_id": ChildSubCategoryID,"title": Title,"description": Description,"price": Price,"city_id": City_Id,"phone_flag": PhoneAllowed,"chat_flag": ChatAllowed,"feature_flag": FeatureAdsAllowed, "motor_condition_id": motor_condition_id, "year_id": year_id, "fuel_type_id": fuel_type_id, "body_work_id": body_work_id, "transmission_id": transmission_id, "drive_unit_id": drive_unit_id, "color_id": color_id, "clearance": clearance, "exchnge": exchnge, "car_model_id": car_model_id, "car_sub_model_id": car_sub_model_id, "engine_size_id": engine_size_id]
                    
        callAPI(Parameter: parameters, API: Constant.API.postAds)
    }
    
    func MarketAPICall(UserID : String, CategoryID : String, SubCategoryID : String, ChildSubCategoryID : String, Title : String, Description : String, Price : String, City_Id : String , PhoneAllowed : String, ChatAllowed : String, FeatureAdsAllowed : String, market_id : String)
    {
        sdLoader.startAnimating(atView: self.view)
        AuthenticationURL()
           
        let parameters: Parameters = ["user_id":  UserDefaults.standard.string(forKey: Constant.SESSION.CustomerID)!,"category_id": CategoryID,"sub_category_id": SubCategoryID,"child_sub_category_id": ChildSubCategoryID,"title": Title,"description": Description,"price": Price,"city_id": City_Id,"phone_flag": PhoneAllowed,"chat_flag": ChatAllowed,"feature_flag": FeatureAdsAllowed, "market_id": market_id]
                    
        callAPI(Parameter: parameters, API: Constant.API.postAds)
    }
    
    func CommonAPICall(UserID : String, CategoryID : String, SubCategoryID : String, ChildSubCategoryID : String, Title : String, Description : String, Price : String, City_Id : String , PhoneAllowed : String, ChatAllowed : String, FeatureAdsAllowed : String)
    {
        sdLoader.startAnimating(atView: self.view)
        AuthenticationURL()
           
        let parameters: Parameters = ["user_id":  UserDefaults.standard.string(forKey: Constant.SESSION.CustomerID)!,"category_id": CategoryID,"sub_category_id": SubCategoryID,"child_sub_category_id": ChildSubCategoryID,"title": Title,"description": Description,"price": Price,"city_id": City_Id,"phone_flag": PhoneAllowed,"chat_flag": ChatAllowed,"feature_flag": FeatureAdsAllowed]
                    
        callAPI(Parameter: parameters, API: Constant.API.postAds)
    }
    
    /* GET PRODUCT DETAIL */
    func getProductDetail(ID : String, ViewCount : String, DeviceID : String)
    {
        sdLoader.startAnimating(atView: self.view)
        AuthenticationURL()
        
        let parameters: Parameters = ["id": ID, "view_count": ViewCount, "device_id": DeviceID]
        print("VIEW ADS PARMATER",parameters)
        
        Alamofire.request(Constant.API.getPostAdsDetail, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {
                
            case .success(_):
                
                self.sdLoader.stopAnimation()
                
                if let dic = response.result.value as? Dictionary<String, AnyObject> {
                    
                    print("DETAIL DICTIONARY-->>",dic)
                    let responseJSON = response.result.value as! [String:AnyObject]
                    print("RESPONSE JSON",responseJSON)
                    
                    guard let responseCode = responseJSON["code"] as? Int else { return }
                    guard let dynamicMessage = responseJSON["message"] as? String else { return }
                    
                    if responseCode == 200
                    {
                        if let arrayData = dic["data"] as? NSArray
                        {
                            let arrCategories : [City] = City.JSONResponse(array: arrayData)
                        }
                    }
                    else
                    {
                        self.sdLoader.stopAnimation()
                        self.showNormalAlert(tittle: Constant.Message.Alert, Message:dynamicMessage)
                    }
                    
                    
                }
                
            case .failure(let error):
                print(error)
                self.sdLoader.stopAnimation()
            }
        }
        
    }
    
    
    /* MARK: <<<<<<<<<< VIEW POSTED ADS FOR ALL CATEGORIES >>>>>>>>>> */
    func getPostAds(CategoryID : String, SubCategoryID : String, ChildSubCategoryID : String, PageNo: String)
    {
        sdLoader.startAnimating(atView: self.view)
        AuthenticationURL()
        
        let parameters: Parameters = ["category_id": CategoryID, "sub_category_id": SubCategoryID, "child_sub_category_id": ChildSubCategoryID, "page": PageNo]
        print("VIEW ADS PARMATER",parameters)
        
        Alamofire.request(Constant.API.getPostAdsData, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result {

            case .success(_):
                
                if let dic = response.result.value as? Dictionary<String, AnyObject> {
                    
                    let jsonResponse = ShowAdsModel.modelsFromDictionaryArray(dic: response.result.value as! NSDictionary)
                    
                    if Globals.globalCategoryID == Constant.CategoryID.RealEstateID
                    {
                        let jsonData = jsonResponse[0].real_estate
                        if jsonResponse[0].code == 200
                        {
                            if jsonData!.data!.count > 0
                            {
                                Globals.sharedInstance.arrShowRealEstateAds.append(contentsOf: jsonData!.data!)
                                UserDefaults.standard.set(Globals.sharedInstance.arrShowRealEstateAds.count, forKey: Constant.SESSION.TotalAdsCount)
                                self.MoveToCategoryListScreen()
                            }
                            else { self.sdLoader.stopAnimation()
                                self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                                
                            }
                        }
                        else {
                            self.sdLoader.stopAnimation()
                            self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                            
                        }
                    }
                    else if Globals.globalCategoryID == Constant.CategoryID.ShopID
                    {
                        self.sdLoader.stopAnimation()
                        self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                    }
                    else if Globals.globalCategoryID == Constant.CategoryID.MotorsID
                    {
                        let jsonData = jsonResponse[0].motor
                        if jsonResponse[0].code == 200
                        {
                            if jsonData!.data!.count > 0
                            {
                                Globals.sharedInstance.arrShowMotorsAds.append(contentsOf: jsonData!.data!)
                                UserDefaults.standard.set(Globals.sharedInstance.arrShowMotorsAds.count, forKey: Constant.SESSION.TotalAdsCount)
                                self.MoveToCategoryListScreen()
                            }
                            else
                            {
                                self.sdLoader.stopAnimation()
                                self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                            }
                        }
                        else
                        {
                            self.sdLoader.stopAnimation()
                            self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                        }
                    }
                    else if Globals.globalCategoryID == Constant.CategoryID.MarketID
                    {
                        let jsonData = jsonResponse[0].market
                        if jsonResponse[0].code == 200
                        {
                            if jsonData!.data!.count > 0
                            {
                                Globals.sharedInstance.arrShowMarketAds.append(contentsOf: jsonData!.data!)
                                UserDefaults.standard.set(Globals.sharedInstance.arrShowMarketAds.count, forKey: Constant.SESSION.TotalAdsCount)
                                self.MoveToCategoryListScreen()
                            }
                            else
                            {
                                self.sdLoader.stopAnimation()
                                self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                            }
                        }
                        else
                        {
                            self.sdLoader.stopAnimation()
                            self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                        }
                    }
                    else if Globals.globalCategoryID == Constant.CategoryID.BuildingMaterialID
                    {
                        let jsonData = jsonResponse[0].building
                        if jsonResponse[0].code == 200
                        {
                            if jsonData!.data!.count > 0
                            {
                                Globals.sharedInstance.arrShowBuildingAds.append(contentsOf: jsonData!.data!)
                                UserDefaults.standard.set(Globals.sharedInstance.arrShowBuildingAds.count, forKey: Constant.SESSION.TotalAdsCount)

                                self.MoveToCategoryListScreen()
                            }
                            else
                            {
                                self.sdLoader.stopAnimation()
                                self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                            }
                        }
                        else
                        {
                            self.sdLoader.stopAnimation()
                            self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                        }
                    }
                    else if Globals.globalCategoryID == Constant.CategoryID.JobsID
                    {
                        let jsonData = jsonResponse[0].job
                        if jsonResponse[0].code == 200
                        {
                            if jsonData!.data!.count > 0
                            {
                                Globals.sharedInstance.arrShowJobsAds.append(contentsOf: jsonData!.data!)
                                UserDefaults.standard.set(Globals.sharedInstance.arrShowJobsAds.count, forKey: Constant.SESSION.TotalAdsCount)

                                self.MoveToCategoryListScreen()
                            }
                            else
                            {
                                self.sdLoader.stopAnimation()
                                self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                            }
                        }
                        else
                        {
                            self.sdLoader.stopAnimation()
                            self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                        }
                    }
                    else if Globals.globalCategoryID == Constant.CategoryID.MobileCommunicationID
                    {
                        let jsonData = jsonResponse[0].basic
                        if jsonResponse[0].code == 200
                        {
                            if jsonData!.data!.count > 0
                            {
                                Globals.sharedInstance.arrShowMobileCommunicationAds.append(contentsOf: jsonData!.data!)
                                UserDefaults.standard.set(Globals.sharedInstance.arrShowMobileCommunicationAds.count, forKey: Constant.SESSION.TotalAdsCount)

                                self.MoveToCategoryListScreen()
                            }
                            else
                            {
                                self.sdLoader.stopAnimation()
                                self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                            }
                        }
                        else
                        {
                            self.sdLoader.stopAnimation()
                            self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                        }
                    }
                    else if Globals.globalCategoryID == Constant.CategoryID.KidsID
                    {
                        let jsonData = jsonResponse[0].kid_clothe
                        if jsonResponse[0].code == 200
                        {
                            if jsonData!.data!.count > 0
                            {
                                Globals.sharedInstance.arrShowKidsAds.removeAll()
                                Globals.sharedInstance.arrShowKidsAds.append(contentsOf: jsonData!.data!)
                                UserDefaults.standard.set(Globals.sharedInstance.arrShowKidsAds.count, forKey: Constant.SESSION.TotalAdsCount)

                                self.MoveToCategoryListScreen()
                            }
                            else
                            {
                                self.sdLoader.stopAnimation()
                                self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                            }
                        }
                        else
                        {
                            self.sdLoader.stopAnimation()
                            self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                        }
                    }
                    else if Globals.globalCategoryID == Constant.CategoryID.ClothsFootwearID
                    {
                        let jsonData = jsonResponse[0].kid_clothe
                        if jsonResponse[0].code == 200
                        {
                            if jsonData!.data!.count > 0
                            {
                                Globals.sharedInstance.arrShowKidsAds.removeAll()
                                Globals.sharedInstance.arrShowKidsAds.append(contentsOf: jsonData!.data!)
                                UserDefaults.standard.set(Globals.sharedInstance.arrShowKidsAds.count, forKey: Constant.SESSION.TotalAdsCount)

                                self.MoveToCategoryListScreen()
                            }
                            else
                            {
                                self.sdLoader.stopAnimation()
                                self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                            }
                        }
                        else
                        {
                            self.sdLoader.stopAnimation()
                            self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                        }
                    }
                    else if Globals.globalCategoryID == Constant.CategoryID.ElectronicsID
                    {
                        let jsonData = jsonResponse[0].electronics
                        if jsonResponse[0].code == 200
                        {
                            if jsonData!.data!.count > 0
                            {
                                Globals.sharedInstance.arrShowElectronicsAds.append(contentsOf: jsonData!.data!)
                                UserDefaults.standard.set(Globals.sharedInstance.arrShowElectronicsAds.count, forKey: Constant.SESSION.TotalAdsCount)

                                self.MoveToCategoryListScreen()
                            }
                            else
                            {
                                self.sdLoader.stopAnimation()
                                self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                            }
                        }
                        else
                        {
                            self.sdLoader.stopAnimation()
                            self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                        }
                    }
                    else
                    {
                        print("COMMON ADS DATA ---->>>>>>>>>>>>")
                        
                        Globals.sharedInstance.arrShowCommonAds.removeAll()
                        let jsonData = jsonResponse[0].commonAds
                        if jsonResponse[0].code == 200
                        {
                            if jsonData!.data!.count > 0
                            {
                                Globals.sharedInstance.arrShowCommonAds.append(contentsOf: jsonData!.data!)
                                UserDefaults.standard.set(Globals.sharedInstance.arrShowCommonAds.count, forKey: Constant.SESSION.TotalAdsCount)

                                self.MoveToCategoryListScreen()
                            }
                            else
                            {
                                self.sdLoader.stopAnimation()
                                self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                            }
                        }
                        else
                        {
                            self.sdLoader.stopAnimation()
                            self.showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.NoData)
                        }
                    }
                    
                }

            case .failure(let error):
                print(error)
                self.sdLoader.stopAnimation()
            }
        }
        
    }
    
   
    
    func AuthenticationURL()
    {
        let AuthorizarionUser = Constant.url_authorization.userName
        let AuthorizationPassword = Constant.url_authorization.password
        let credentialData = "\(AuthorizarionUser):\(AuthorizationPassword)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        let base64Credentials = credentialData.base64EncodedString()
        headers = ["Authorization": "Basic \(base64Credentials)"]
    }
    
    func MoveToHomeScreen()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.HomeScreen) as! HomeScreen
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    func MoveToScreen(CategoryID : String)
    {
        if Globals.globalCategoryID == 1
        {
            // Real Estate Screen
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.RealEstateVC) as! RealEstateVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else if Globals.globalCategoryID == 6
        {
            // Jobs Screen
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.JobsVC) as! JobsVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else if Globals.globalCategoryID == 8
        {
            // Kids Screen
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.KidsVC) as! KidsVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else if Globals.globalCategoryID == 3
        {
            // Kids Screen
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.MotorsVC) as! MotorsVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else if Globals.globalCategoryID == 4
        {
            // Markets Screen
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.MarketVC) as! MarketVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        else
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.PostAdsVC) as! PostAdsVC
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    func showNormalAlert(tittle: String, Message: String)
    {
        let alertVC = CPAlertVC(title: tittle, message: Message)
        alertVC.show(into: self)
    }
    
    func showAlertOK(tittle: String, Message: String)
    {
        let alertVC = CPAlertVC(title: tittle, message: Message)

        alertVC.addAction(CPAlertAction(title: "Ok", type: .normal, handler: {
             let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC")
             self.navigationController?.pushViewController(nextVC!, animated: true)
        }))
        alertVC.show(into: self)
    }
   
    func setRoundButtonOnView()
    {
        let button:UIButton = UIButton(frame: CGRect(x: self.view.bounds.width - 60.0, y: self.view.bounds.height - 150.0, width: 50.0, height: 50.0))
       // button.setImage(UIImage(named: "add.png"), for: .normal)
        button.setTitle("+", for: .normal)
        button.backgroundColor = UIColor.colorWithHexString(hexStr: "FE8D00")
        button.layer.cornerRadius = button.frame.height / 2
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func setRoundButtonOnView1()
    {
        let button:UIButton = UIButton(frame: CGRect(x: self.view.bounds.width - 65.0, y: self.view.bounds.height - 200.0, width: 50.0, height: 50.0))
        button.backgroundColor = .clear
        // button.setImage(UIImage(named: "plusIcon.png"), for: .normal)
        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buttonClicked()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.AdsCategoryScreen) as! AdsCategoryScreen
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func okButtonAppearance(button: UIButton)
    {
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
       // button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        //button.backgroundColor = UIColor.green
    }
    
    func setCustomView(CustomView : UIView, HeaderTittleColor : UILabel)
    {
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: CustomView.bounds.origin.x, y: CustomView.frame.size.height))
        shadowPath.addLine(to: CGPoint(x: CustomView.bounds.width / 2, y: CustomView.bounds.height + 7.0))
        shadowPath.addLine(to: CGPoint(x: CustomView.bounds.width, y: CustomView.bounds.height))
        shadowPath.close()

        CustomView.backgroundColor = UIColor.colorWithHexString(hexStr: "F2F2F7")
        CustomView.layer.shadowColor = UIColor.darkGray.cgColor
        CustomView.layer.shadowOpacity = 1
        CustomView.layer.masksToBounds = false
        CustomView.layer.shadowRadius = 5
        
        HeaderTittleColor.textColor = UIColor.colorWithHexString(hexStr: "FE8D00")
        HeaderTittleColor.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    func setHeaderView(CustomView : UIView)
    {
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: CustomView.bounds.origin.x, y: CustomView.frame.size.height))
        shadowPath.addLine(to: CGPoint(x: CustomView.bounds.width / 2, y: CustomView.bounds.height + 7.0))
        shadowPath.addLine(to: CGPoint(x: CustomView.bounds.width, y: CustomView.bounds.height))
        shadowPath.close()

       // CustomView.backgroundColor = UIColor.colorWithHexString(hexStr: "F2F2F7")
        CustomView.layer.shadowColor = UIColor.darkGray.cgColor
        CustomView.layer.shadowOpacity = 1
        CustomView.layer.masksToBounds = false
        CustomView.layer.shadowRadius = 5
    }
    
    func setCustomImageView(CustomView : UIView)
    {
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: CustomView.bounds.origin.x, y: CustomView.frame.size.height))
        shadowPath.addLine(to: CGPoint(x: CustomView.bounds.width / 2, y: CustomView.bounds.height + 7.0))
        shadowPath.addLine(to: CGPoint(x: CustomView.bounds.width, y: CustomView.bounds.height))
        shadowPath.close()

        CustomView.layer.shadowColor = UIColor.darkGray.cgColor
        CustomView.layer.shadowOpacity = 1
        CustomView.layer.masksToBounds = true
        CustomView.layer.cornerRadius = 10
        CustomView.layer.shadowRadius = 1
        CustomView.layer.borderWidth = 1
    }
    
    // MAIN API CALLING FUNCTION FOR ALL CATEGORIES
    func callAPI(Parameter : Parameters , API : String)
    {
        Alamofire.upload(multipartFormData: { multipartFormData in
            
            let userData = try? JSONSerialization.data(withJSONObject: Parameter)
            multipartFormData.append(userData!, withName: "data")
            
            for i in 0..<Globals.sharedInstance.arrImagePickerArray.count {
                if let dataImages = Globals.sharedInstance.arrImagePickerArray[i].jpegData(compressionQuality: 0.7)
                {
                    multipartFormData.append(dataImages, withName: "images[]", fileName: "\(i).jpg", mimeType: "image/jpg")
                }
            }
        },
        to: API, method:.post, headers: headers) { (result) in
            
            switch result
            {
                case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    self.sdLoader.stopAnimation()
                    
                    let responseJSON = response.result.value as! [String:AnyObject]
                    print("RESPONSE JSON",responseJSON)
                    
                    guard let responseCode = responseJSON["code"] as? Int else { return }
                    guard let dynamicMessage = responseJSON["message"] as? String else { return }

                    if responseCode == 200
                    {
                       self.showAlertOK(tittle: Constant.Message.successalert, Message: dynamicMessage)
                    }
                    else
                    {
                        self.sdLoader.stopAnimation()
                        self.showNormalAlert(tittle: Constant.Message.Alert, Message:dynamicMessage)
                    }
                }
                
                case .failure(let encodingError):
                self.sdLoader.stopAnimation()
                self.showNormalAlert(tittle: Constant.Message.failedAlert, Message: encodingError.localizedDescription)
            }
        }
    }
}

extension UIImageView {
    
    func setRoundedImageView() {
       self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func setCategoryRoundedImageView() {
       self.layer.cornerRadius = 3
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func setAdsRoundedImageView() {
       self.layer.cornerRadius = 3
        self.layer.masksToBounds = true
       // self.layer.borderWidth = 1
       // self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
extension String {
func localized(_ lang:String) ->String {
    
    let path = Bundle.main.path(forResource: lang, ofType: "lproj")
    let bundle = Bundle(path: path!)
    return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
}}


