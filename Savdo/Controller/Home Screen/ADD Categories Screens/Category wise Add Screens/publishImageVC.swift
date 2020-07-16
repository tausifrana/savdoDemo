//
//  publishImageVC.swift
//  demoSavdo
//
//  Created by MacAir_Developement on 27/02/20.
//  Copyright © 2020 MacAir_Developement. All rights reserved.
//

import UIKit

class publishImageVC: BaseClass {
    
    var publishImage:Int = 0
    var realEstateVC = RealEstateVC()
    var imagePicker: ImagePicker!

    @IBOutlet weak var HeaderBar: UIView!
    @IBOutlet weak var HeaderTittle: UILabel!
    @IBOutlet weak var collectionGridView:UICollectionView!
    @IBOutlet weak var imgView:UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setCustomView(CustomView: HeaderBar, HeaderTittleColor: HeaderTittle)
        self.HeaderTittle.text = "Upload Product Image"
        self.collectionGridView.layoutIfNeeded()
        Globals.sharedInstance.arrImagePickerArray.removeAll()
        //self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    func dashedBorderLayerWithColor(color:CGColor, view:UIView, cell: UICollectionViewCell) -> CAShapeLayer {
        let  borderLayer = CAShapeLayer()
        borderLayer.name  = "borderLayer"
        let frameSize = view.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        borderLayer.bounds = shapeRect
        borderLayer.position = CGPoint( x: frameSize.width/2, y: frameSize.height/2)
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = color
        borderLayer.lineWidth = 2
        borderLayer.lineJoin = CAShapeLayerLineJoin.round
        borderLayer.lineDashPattern = [8,4]
        let path = UIBezierPath.init(roundedRect: shapeRect, cornerRadius: 0)
        borderLayer.path = path.cgPath
    
        return borderLayer
    }
    
    
    @IBAction func btnNewImage(_ sender: UIButton)
    {
        if Globals.sharedInstance.arrImagePickerArray.count > 0 || Globals.sharedInstance.arrImagePickerArray.count <= 10
        {
            self.imagePicker.present(from: sender)
        }
        else
        {
            //show alert
        }
    }
    
    
    @IBAction func btnBack(_ sender:UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSubmit(_ sender:UIButton)
    {
        if Globals.sharedInstance.arrImagePickerArray.count > 0
        {
            if Globals.globalCategoryID == Constant.CategoryID.RealEstateID
            {
                RealEstateAPICall(UserID: UserDefaults.standard.string(forKey: Constant.SESSION.CustomerID)!,
                                  CategoryID: String(Globals.globalCategoryID),
                                  SubCategoryID: String(Globals.globalSubCategoryID),
                                  ChildSubCategoryID: String(Globals.globalChildSubCategoryID),
                                  Title: Globals.GlobalTittle,
                                  Description: Globals.GlobalDescription,
                                  Price: String(Globals.GlobalPrice),
                                  City_Id: String(Globals.sharedInstance.globalSelectedCityID),
                                  Area: Globals.GlobalArea,
                                  Type_of_building_Id: String(Globals.GlobalSelectedBuildingTypeID),
                                  Floor_Id: String(Globals.GlobalSelectedFloorTypeID),
                                  Repair_Id: String(Globals.GlobalSelectedRepairID),
                                  PhoneAllowed : String(Globals.GlobalHiddenPhoneNoValue),
                                  ChatAllowed: String(Globals.GlobalTurnOnChatValue),
                                  FeatureAdsAllowed: String(Globals.GlobalFeatureAdsValue))
            }
            else if Globals.globalCategoryID == Constant.CategoryID.MotorsID
            {
                MotorAPICall(UserID : UserDefaults.standard.string(forKey: Constant.SESSION.CustomerID)!,
                             CategoryID : String(Globals.globalCategoryID),
                             SubCategoryID : String(Globals.globalSubCategoryID),
                             ChildSubCategoryID : String(Globals.globalChildSubCategoryID),
                             Title :Globals.GlobalTittle,
                             Description : Globals.GlobalTittle,
                             Price : String(Globals.GlobalPrice),
                             City_Id : String(Globals.sharedInstance.globalSelectedCityID),
                             PhoneAllowed : String(Globals.GlobalHiddenPhoneNoValue),
                             ChatAllowed: String(Globals.GlobalTurnOnChatValue),
                             FeatureAdsAllowed: String(Globals.GlobalFeatureAdsValue),
                             motor_condition_id : String(Globals.motor_condition_id),
                             year_id: String(Globals.year_id),
                             fuel_type_id : String(Globals.fuel_type_id),
                             body_work_id : String(Globals.body_work_id),
                             transmission_id : String(Globals.transmission_id),
                             drive_unit_id : String(Globals.drive_unit_id),
                             color_id : String(Globals.color_id),
                             clearance : String(Globals.clearance),
                             exchnge : String(Globals.exchnge),
                             car_model_id : String(Globals.car_model_id),
                             car_sub_model_id : String(Globals.car_sub_model_id),
                             engine_size_id : String(Globals.engine_size_id))
            }
            else if Globals.globalCategoryID == Constant.CategoryID.MarketID
            {
                MarketAPICall(UserID : UserDefaults.standard.string(forKey: Constant.SESSION.CustomerID)!,
                              CategoryID : String(Globals.globalCategoryID),
                              SubCategoryID : String(Globals.globalSubCategoryID),
                              ChildSubCategoryID : String(Globals.globalChildSubCategoryID),
                              Title :Globals.GlobalTittle,
                              Description : Globals.GlobalTittle,
                              Price : String(Globals.GlobalPrice),
                              City_Id : String(Globals.sharedInstance.globalSelectedCityID),
                              PhoneAllowed : String(Globals.GlobalHiddenPhoneNoValue),
                              ChatAllowed: String(Globals.GlobalTurnOnChatValue),
                              FeatureAdsAllowed: String(Globals.GlobalFeatureAdsValue),
                              market_id : String(Globals.market_id))
            }
            else
            {
                print("COMMON API CALL -->")
                CommonAPICall(UserID : UserDefaults.standard.string(forKey: Constant.SESSION.CustomerID)!,
                              CategoryID : String(Globals.globalCategoryID),
                              SubCategoryID : String(Globals.globalSubCategoryID),
                              ChildSubCategoryID : String(Globals.globalChildSubCategoryID),
                              Title :Globals.GlobalTittle,
                              Description : Globals.GlobalTittle,
                              Price : String(Globals.GlobalPrice),
                              City_Id : String(Globals.sharedInstance.globalSelectedCityID),
                              PhoneAllowed : String(Globals.GlobalHiddenPhoneNoValue),
                              ChatAllowed: String(Globals.GlobalTurnOnChatValue),
                              FeatureAdsAllowed: String(Globals.GlobalFeatureAdsValue))
            }
        }
        else
        {
            
        }
        
        
        
    }
    
    @objc func btnAdd(sender:UIButton){
        Globals.sharedInstance.arrImagePickerArray.remove(at: sender.tag)
        self.collectionGridView.reloadData()
    }
}

