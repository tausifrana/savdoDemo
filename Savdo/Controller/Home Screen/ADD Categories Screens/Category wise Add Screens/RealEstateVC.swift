//
//  RealEstateVC.swift
//  Savdo
//
//  Created by My MAC on 31/1/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import DropDown
import Alamofire

// DONE 
class RealEstateVC: BaseClass {

    let objParser = Parser()
    var imagePicker: ImagePicker!
    var imagePickerValue = 0
   // var HiddenPhoneNoValue = 0
   // var TurnOnChatValue = 0
   // var FeatureAdsValue = 0

    @IBOutlet weak var HeaderBar: UIView!
    @IBOutlet weak var lblHeaderTittle: UILabel!
    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var lblSequence: UILabel!
    @IBOutlet weak var txtTittle: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var btnHiddenPhoneOutlet: UIButton!
    @IBOutlet weak var lblHiddenPhoneNo: UILabel!
    @IBOutlet weak var btnTurnonChatOutlet: UIButton!
    @IBOutlet weak var lblTurnonChat: UILabel!
    @IBOutlet weak var btnFeatureAdsOutlet: UIButton!
    @IBOutlet weak var lblFeatureAds: UILabel!
    @IBOutlet weak var lblAgreement: UILabel!
    @IBOutlet weak var btnPublishOutlet: CustomButton!
    
    // Custom TextBox
    @IBOutlet weak var textBox1: UITextField!
    @IBOutlet weak var textBox2: UITextField!
    @IBOutlet weak var textBox3: UITextField!
    @IBOutlet weak var textBox4: UITextField!

    // LOCAL VARIABLE
    var arrBuildingTypeDict = [String:Int]()
    var arrBuildingTypeID = [Int]()
    var arrBuildingTypeName = [String]()
    
    var arrFloorTypeDict = [String:Int]()
    var arrFloorTypeID = [Int]()
    var arrFloorTypeName = [String]()
    
    var arrRepairTypeDict = [String:Int]()
    var arrRepairTypeID = [Int]()
    var arrRepairTypeName = [String]()

    
    override func viewWillAppear(_ animated: Bool)
    {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sdLoader.startAnimating(atView: self.view)
        initUI()
        setCustomView(CustomView: HeaderBar, HeaderTittleColor: lblHeaderTittle)
    }
    
   
    func initUI()
    {
        Globals.sharedInstance.arrImagePickerArray.removeAll()
        removeAll()
        
        txtCity.isEnabled = false
        textBox2.isEnabled = false
        textBox3.isEnabled = false
        txtPrice.keyboardType = .numberPad
        localizationSetup()
        
        lblSequence.numberOfLines = 0
        lblSequence.text = "\(Globals.globalCategoryName) / \(Globals.globalSubCategoryName) / \(Globals.globalChildSubCategoryName)"
        objParser.downloadDelegate = self
        objParser.getDynamicArray(CategoryID: String(Globals.globalCategoryID))
    }

    func localizationSetup()
    {
        lblHeaderTittle.text = Helper.submitAds.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtTittle.placeholder = Helper.realtittle.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtDescription.placeholder = Helper.realDescritption.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtPrice.placeholder = Helper.realPrice.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtCity.placeholder = Helper.city.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox1.placeholder = Helper.realarea.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox2.placeholder = Helper.realBType.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox3.placeholder = Helper.realFloor.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox4.placeholder = Helper.realRepair.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblHiddenPhoneNo.text = Helper.realHidnPhone.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblTurnonChat.text = Helper.realHidnOnChat.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblFeatureAds.text = Helper.realHidnDeature.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblAgreement.text = Helper.realDisclaimare.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        btnPublishOutlet.setTitle(Helper.publishButton.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!), for: .normal)
    }

    @IBAction func btnPublishClicked(_ sender: UIButton)
    {
        if txtTittle.text!.isEmpty
        {
            showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.categorytittle)
        }
        else if txtDescription.text!.isEmpty
        {
            showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.categorydesc)
        }
        else if txtPrice.text!.isEmpty
        {
            showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.categoryprice)
        }
        else if txtCity.text!.isEmpty
        {
            showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.categorycity)
        }
        else
        {
            Globals.GlobalTittle = txtTittle.text!
            Globals.GlobalDescription = txtDescription.text!
            Globals.GlobalPrice = Int(txtPrice.text!)!
            Globals.GlobalArea = textBox1.text!
            MoveToImagePicker()
        }
    }
    
    /*
     func publishData()
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
    */
    @IBAction func btnTextBoxsClicked(_ sender: UIButton)
    {
        if sender.tag == 1
        {
            PickerShow(PickerArray: self.arrBuildingTypeName, sender: sender)
        }
        else if sender.tag == 2
        {
            PickerShow(PickerArray: self.arrFloorTypeName, sender: sender)
        }
        else if sender.tag == 3
        {
            PickerShow(PickerArray: self.arrRepairTypeName, sender: sender)
        }
    }
    
    @IBAction func btnCityClicked(_ sender: UIButton)
    {
        PickerShow(PickerArray: Globals.sharedInstance.cityName, sender: sender)
    }
    
    @IBAction func btnHiddenPhoneClicked(_ sender: UIButton)
    {
        if AppDelegate.hiddenPhoneNo_bool == false
        {
            Globals.GlobalHiddenPhoneNoValue = 0
            AppDelegate.hiddenPhoneNo_bool = true
            btnHiddenPhoneOutlet.setImage(UIImage(named: "uncheck.png"), for: .normal)
        }
        else
        {
            Globals.GlobalHiddenPhoneNoValue = 1
            AppDelegate.hiddenPhoneNo_bool = false
            btnHiddenPhoneOutlet.setImage(UIImage(named: "check.png"), for: .normal)
        }
    }
    @IBAction func btnTurnChatClicked(_ sender: UIButton)
    {
        if AppDelegate.chatTurnON_bool == false
        {
            Globals.GlobalTurnOnChatValue = 0
            AppDelegate.chatTurnON_bool = true
            btnTurnonChatOutlet.setImage(UIImage(named: "uncheck.png"), for: .normal)
        }
        else
        {
            Globals.GlobalTurnOnChatValue = 1
            AppDelegate.chatTurnON_bool = false
            btnTurnonChatOutlet.setImage(UIImage(named: "check.png"), for: .normal)
        }
    }
    
    @IBAction func btnFeatureAdsClicked(_ sender: UIButton)
    {
        if AppDelegate.featureAds_bool == false
        {
            Globals.GlobalFeatureAdsValue = 0
            AppDelegate.featureAds_bool = true
            btnFeatureAdsOutlet.setImage(UIImage(named: "uncheck.png"), for: .normal)
        }
        else
        {
            Globals.GlobalFeatureAdsValue = 1
            AppDelegate.featureAds_bool = false
            btnFeatureAdsOutlet.setImage(UIImage(named: "check.png"), for: .normal)
        }
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // FUNCTIONS 101
    func PickerShow(PickerArray : [String], sender : UIButton)
    {
        let picker = YBTextPicker.init(with: PickerArray, appearance: nil, onCompletion: { (selectedIndexes, selectedValues) in
            
            if selectedValues.count > 0
            {
                var values = [String]()
                
                for index in selectedIndexes{
                    values.append(PickerArray[index])
                }
                
                // sender.setTitle(values.joined(separator: ", "), for: .normal)
                
                if sender.tag == 101
                {
                    self.txtCity.text = values.joined(separator: ", ")
                    let id = Globals.sharedInstance.cityDict.index(forKey: values.joined(separator: ", "))
                    Globals.sharedInstance.globalSelectedCityID = Globals.sharedInstance.cityDict[id!].value
                }
                else if sender.tag == 1
                {
                    self.textBox2.text = values.joined(separator: ", ")
                    let id = self.arrBuildingTypeDict.index(forKey: values.joined(separator: ", "))
                    Globals.GlobalSelectedBuildingTypeID = self.arrBuildingTypeDict[id!].value
                }
                else if sender.tag == 2
                {
                    self.textBox3.text = values.joined(separator: ", ")
                    let id = self.arrFloorTypeDict.index(forKey: values.joined(separator: ", "))
                    Globals.GlobalSelectedFloorTypeID = self.arrFloorTypeDict[id!].value
                }
                else if sender.tag == 3
                {
                    self.textBox4.text = values.joined(separator: ", ")
                    let id = self.arrRepairTypeDict.index(forKey: values.joined(separator: ", "))
                    Globals.GlobalSelectedRepairID = self.arrRepairTypeDict[id!].value
                }
            }
            else
            {
                sender.setTitle("Select", for: .normal)
            }
        },
                                       onCancel: {
                                        print("Cancelled")
        })
        
        if let title = sender.title(for: .normal)
        {
            if title.contains(","){
                picker.preSelectedValues = title.components(separatedBy: ", ")
            }
        }
        picker.allowMultipleSelection = false
        picker.show(withAnimation: .Fade)
    }
    
    func removeAll()
    {
        Globals.sharedInstance.arrBuildingType.removeAll()
        self.arrBuildingTypeID.removeAll()
        self.arrBuildingTypeName.removeAll()
        self.arrBuildingTypeDict.removeAll()
        
        Globals.sharedInstance.arrFloorType.removeAll()
        self.arrFloorTypeID.removeAll()
        self.arrFloorTypeName.removeAll()
        self.arrFloorTypeDict.removeAll()
        
        Globals.sharedInstance.arrRepairType.removeAll()
        self.arrRepairTypeDict.removeAll()
        self.arrRepairTypeID.removeAll()
        self.arrRepairTypeName.removeAll()
    }
}
extension RealEstateVC : DownloadDelegate {
   
    func downloadDynamicArrayCompleted(isCompleted: Bool)
    {
        if isCompleted
        {
            if Globals.sharedInstance.arrBuildingType.count > 0
            {
                for i in 0...Globals.sharedInstance.arrBuildingType.count - 1
                {
                    let objClub = Globals.sharedInstance.arrBuildingType[i]
                    self.arrBuildingTypeID.append(objClub.id!)
                    self.arrBuildingTypeName.append(objClub.name!)
                }
                arrBuildingTypeDict = Dictionary(uniqueKeysWithValues: zip(self.arrBuildingTypeName, self.arrBuildingTypeID))
            }
            if Globals.sharedInstance.arrFloorType.count > 0
            {
                for i in 0...Globals.sharedInstance.arrBuildingType.count - 1
                {
                    let objClub = Globals.sharedInstance.arrFloorType[i]
                    self.arrFloorTypeID.append(objClub.id!)
                    self.arrFloorTypeName.append(objClub.name!)
                }
                arrFloorTypeDict = Dictionary(uniqueKeysWithValues: zip(self.arrFloorTypeName, self.arrFloorTypeID))
            }
            if Globals.sharedInstance.arrRepairType.count > 0
            {
                for i in 0...Globals.sharedInstance.arrRepairType.count - 1
                {
                    let objClub = Globals.sharedInstance.arrRepairType[i]
                    self.arrRepairTypeID.append(objClub.id!)
                    self.arrRepairTypeName.append(objClub.name!)
                }
                arrRepairTypeDict = Dictionary(uniqueKeysWithValues: zip(self.arrRepairTypeName, self.arrRepairTypeID))
            }
            sdLoader.stopAnimation()
        }
        else
        {
            showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.RetrivedDataFailed)
            sdLoader.stopAnimation()
        }
    }
   
    func postAdsDataCompleted(isCompleted: Bool) {
        
        if isCompleted
        {
            sdLoader.stopAnimation()
            showAlertOK(tittle: Constant.Message.successalert, Message: Constant.Message.categoryadd)
        }
        else
        {
            // Error
            showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.RetrivedDataFailed)
            sdLoader.stopAnimation()
        }
    }
}
