//
//  Globals.swift
//  Savdo
//
//  Created by My MAC on 7/1/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit

struct Globals
{
    
    // ------->>>>>>>> GLOBAL VARIABLES TO POST ADS ------->>>>>>>>
    

    // For Common Categories
    static var GlobalTittle = String()
    static var GlobalDescription = String()
    static var GlobalPrice = Int()
    var globalSelectedCityID = Int()
    static var GlobalHiddenPhoneNoValue = 0
    static var GlobalTurnOnChatValue = 0
    static var GlobalFeatureAdsValue = 0
    
    // 1. REAL ESTATE
    static var GlobalArea = ""
    static var GlobalSelectedBuildingTypeID = 0
    static var GlobalSelectedFloorTypeID = 0
    static var GlobalSelectedRepairID = 0

    // MOTOR // 17-mar-20
    static var motor_condition_id = 0
    static var year_id = 0
    static var fuel_type_id = 0
    static var body_work_id = 0
    static var transmission_id = 0
    static var drive_unit_id = 0
    static var color_id = 0
    static var clearance = 0
    static var exchnge = 0
    static var car_model_id = 0
    static var car_sub_model_id = 0
    static var engine_size_id = 0
    
    // MARKET
    static var market_id = 0
    
    static var sharedInstance = Globals()
    static var CustomerID = 0
    static var selectedTabBarIndex = 0
    static var globalCategoryID = Int()
    static var globalCategoryName = String()
    static var globalSubCategoryID = Int()
    static var globalSubCategoryName = String()
    static var globalChildSubCategoryID = Int()
    static var globalChildSubCategoryName = String()
    var arrCategoryData = [CategoryModel]()
    var arrCategoryDetailData = [CategoryModel]()
    var arrSubCategoryData = [CategoryDetailModel]()
    var arrChildSubCategoryData = [ChildCategoryDetailModel]()
    
    
    /* <<<<<<<<<< VIEW POST ADS GLOBAL ARRAY (22.FEB.2020) >>>>>>>>>> */
    var arrShowCommonAds = [CommonData]()
    var arrShowRealEstateAds = [DataModel]()
    var arrShowMotorsAds = [MotorData]()
    var arrShowMarketAds = [DataMarket]()
    var arrShowBuildingAds = [BuildingData]()
    var arrShowJobsAds = [JobsData]()
    var arrShowMobileCommunicationAds = [MobileCommunicationData]()
    var arrShowKidsAds = [KidsClothData]()
    var arrShowElectronicsAds = [ElectronicsData]()

    // ProductDetailModel
    var arrProductData = [ProductDataModel]()

    
    /* <<<<<<<<<< PUBLISH ADS MODEL ARRAY FOR DROPDOWN (06.FEB.2020) >>>>>>>>>> */
    // 1. City
    var arrCityData = [City]()
    var cityDict = [String:Int]()
    var cityID = [Int]()
    var cityName = [String]()
    
    // 2. Real Estate
    var arrImagePickerArray :[UIImage] = []
    var arrBuildingType = [Building_type]()
    var arrFloorType = [Floor]()
    var arrRepairType = [Repair]()

    // 3. Kids
    var arrKidsSizeData = [KidsClothSize]()

    // 4. Markets
    var arrMarketSize = [Markets]()

    // 5. Car Model
    var arrSubCarListModel = [CarSubModel]()
    var arrCarListModel = [CarModel_List]()
    var arrMotorCondition = [MotorCondition]()
    var arrYearList = [YearList]()
    var arrBodyWork = [BodyWorkList]()
    var arrTransmissionList = [TransmissionList]()
    var arrMotorColor = [Color]()
    var arrMotorFuelType = [FuelType]()
    var arrEngineSize = [EngineSize]()
    var arrDriveUnit = [DriveUnitList]()
}
