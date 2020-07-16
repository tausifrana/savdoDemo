//
//  Constant.swift
//  Bazaraki
//
//  Created by suresh on 17/12/19.
//  Copyright © 2019 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit

struct AppURL
{
    //static var globalURL = "http://demo.bhavitechnologies.com/Bazarakistore/api/auth/"
    static var globalURL = "http://bhavidemo.in/Bazarakistore/api/auth/"
}

struct Constant
{
    
    struct url_authorization
    {
        static let userName =  "developer"
        static let password =  "developer"
    }

    struct API
    {
        // GET ALL CATEGORIES
        static var getAllCategory: String
        {
            return AppURL.globalURL + "get-category"
        }
        
        static var getSubCategory: String
        {
            return AppURL.globalURL + "get-sub-category"
        }
        
        static var getChildSubCategory: String
        {
            return AppURL.globalURL + "get-child-sub-category"
        }
        
        static var getDynamicArray: String
        {
            return AppURL.globalURL + "get-dynamic-data"
        }
        
        static var getCity: String
        {
            return AppURL.globalURL + "get-city"
        }
        
        static var postAds: String
        {
            return AppURL.globalURL + "store-posting-data"
        }
        
        // Car Sub Model
        static var getCarSubModel: String
        {
            return AppURL.globalURL + "get-car-sub-model"
        }
        
        // Car Sub Model
        static var getPostAdsData: String
        {
            return AppURL.globalURL + "show-posting-data"
        }
        
        static var getPostAdsDetail: String
        {
            return AppURL.globalURL + "show-posting-detail"
        }
    }

    struct Message
    {
       // static let Alert =  Helper.alert.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
         static let Alert =  "бдительный"

        static let failedAlert =  "Server Problem. Please try later"

        static let RetrivedDataFailed =  "There is some issue to retrive data. Please try again."

        static let successalert =  Helper.successalert.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        
        static let NoData = "Данные не найдены"

        static let categoryadd =  Helper.categoryadd.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        static let selectimage = Helper.selectimage.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        static let categorytittle = Helper.categorytittle.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        static let categorydesc = Helper.categorydesc.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        static let categoryprice = Helper.categoryprice.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        static let categorycity = Helper.categorycity.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
    }
    
    struct GloableFontSetting
    {
        static let tittleFont = UIFont(name: "rajdhani-bold", size: 18)
       // static let tittleFontColor = UIColor.white
    }
    
    struct CategoryID
    {
        static var RealEstateID: Int { return 1 }
        static var ShopID: Int { return 2 }
        static var MotorsID: Int { return 3 }
        static var MarketID: Int { return 4 }
        static var BuildingMaterialID: Int { return 5 }
        static var JobsID: Int { return 6 }
        static var MobileCommunicationID: Int { return 7 }
        static var KidsID: Int { return 8 }
        static var ClothsFootwearID: Int { return 9 }
        static var ComputerID: Int { return 10 }
        static var ElectronicsID: Int { return 11 }

        static var HobbiesID: Int { return 12 }
        static var EverythingHomeID: Int { return 13 }
        static var AnimalID: Int { return 14 }
        static var WholesellerID: Int { return 15 }
        static var ServiceID: Int { return 16 }
        static var BusinessID: Int { return 17 }
    }
    
    struct STORYBOARD
    {
        static let Main =  "Main"
        
        struct CLASS_NAME
        {
            static let LoginScreen =  "LoginScreen"
            static let OTPVerifiedScreen =  "OTPVerifiedScreen"
            static let HomeScreen =  "HomeScreen"
            static let FavoritesScreen =  "FavoritesScreen"
            static let MessagesScreen =  "MessagesScreen"
            static let MyaddScreen =  "MyaddScreen"
            static let PostAddScreen =  "PostAddScreen"
            static let CategoryDetailListScreen =  "CategoryDetailListScreen"
            static let AdsCategoryScreen =  "AdsCategoryScreen"
            static let AdsSubCategoryScreen =  "AdsSubCategoryScreen"
            static let AdsChildSubcategoryScreen =  "AdsChildSubcategoryScreen"
        
            static let publishImageVC =  "publishImageVC"
            static let RealEstateVC =  "RealEstateVC"
            static let JobsVC =  "JobsVC"
            static let KidsVC =  "KidsVC"
            static let MotorsVC =  "MotorsVC"
            static let MarketVC =  "MarketVC"
            static let PostAdsVC =  "PostAdsVC"
            static let ShowAdsVC =  "ShowAdsVC"
            static let ShowAdsSubCategoryVC =  "ShowAdsSubCategoryVC"
            static let ShowAdsDescriptionVC =  "ShowAdsDescriptionVC"

            
        }
    }
    
    struct SESSION
    {
        static let APPLANGUAGES = "AppLanguages"
        static let CustomerID = "CustomerID"
        static let PostAdsSession = "ViewPostAdsSession"
        static let TotalAdsCount = "TotalAdsCount"
        static let SelectedPostAdsScreen = "SelectedPostAdsScreen"

    }
    
    struct LocalizationLanguages
      {
          static let EN = "en"
          static let RU = "ru"
      }
}
