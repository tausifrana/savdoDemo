//
//  MarketVC.swift
//  Savdo
//
//  Created by My MAC on 31/1/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import DropDown
import SDLoader

class MarketVC: BaseClass {

    let objParser = Parser()
    var imagePicker: ImagePicker!
    var imagePickerValue = 0
    var HiddenPhoneNoValue = 0
    var TurnOnChatValue = 0
    var FeatureAdsValue = 0

    @IBOutlet weak var HeaderBar: UIView!
    @IBOutlet weak var lblHeaderTittle: UILabel!
    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var imageviewButton1: UIImageView!
    @IBOutlet weak var imageviewButton2: UIImageView!
    @IBOutlet weak var imageviewButton3: UIImageView!
    
    @IBOutlet weak var lblImageUploadDesciption: UILabel!
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
    
    // LOCAL VARIABLE
    var arrSizeDict = [String:Int]()
    var arrSizeID = [Int]()
    var arrSizeName = [String]()
    var SelectedSizeID = Int()

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sdLoader.startAnimating(atView: self.view)
        Globals.sharedInstance.arrImagePickerArray.removeAll()
        removeAll()
        txtCity.isEnabled = false
        lblSequence.numberOfLines = 0
        lblSequence.text = "\(Globals.globalCategoryName) / \(Globals.globalSubCategoryName) / \(Globals.globalChildSubCategoryName)"
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)

        objParser.downloadDelegate = self
        Globals.sharedInstance.arrMarketSize.removeAll()
        objParser.getDynamicArray(CategoryID: String(Globals.globalCategoryID))
        
    }
    
    // BUTTON ACTIONS
    
    
    @IBAction func btnImagePicker(_ sender: UIButton)
    {
        if sender.tag == 1
        {
            imagePickerValue = 1
            self.imagePicker.present(from: sender)
        }
        else if sender.tag == 2
        {
            imagePickerValue = 2
            self.imagePicker.present(from: sender)
        }
        else if sender.tag == 3
        {
            imagePickerValue = 3
            self.imagePicker.present(from: sender)
        }
        
    }
    
    @IBAction func btnPublishClicked(_ sender: UIButton)
    {
       if Globals.sharedInstance.arrImagePickerArray.count > 0
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

               sdLoader.startAnimating(atView: self.view)
               DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                   
                   self.sdLoader.stopAnimation()
                   self.showAlertOK(tittle: Constant.Message.successalert, Message: Constant.Message.categoryadd)

                  // let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC")
                  // self.navigationController?.pushViewController(nextVC!, animated: true)

               })
               // objParser.postAds(UserID: "1", CategoryID: String(Globals.globalCategoryID), SubCategoryID: String(Globals.globalSubCategoryID), ChildSubCategoryID: String(Globals.globalChildSubCategoryID), Title: txtTittle.text!, Description: txtDescription.text!, Price: txtPrice.text!, City_Id: String(Globals.sharedInstance.globalSelectedCityID), Area: textBox1.text!, Type_of_building_Id: String(self.SelectedBuildingTypeID), Floor_Id: String(self.SelectedFloorTypeID), Repair_Id: "1")

           }
       }
       else
       {
           showNormalAlert(tittle: Constant.Message.Alert, Message: Constant.Message.selectimage)
       }
    }
    
    @IBAction func btnTextBoxsClicked(_ sender: UIButton)
    {
        if sender.tag == 1
        {
            PickerShow(PickerArray: self.arrSizeName, sender: sender)
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
            HiddenPhoneNoValue = 0
            AppDelegate.hiddenPhoneNo_bool = true
            btnHiddenPhoneOutlet.setImage(UIImage(named: "uncheck.png"), for: .normal)
        }
        else
        {
            HiddenPhoneNoValue = 1
            AppDelegate.hiddenPhoneNo_bool = false
            btnHiddenPhoneOutlet.setImage(UIImage(named: "check.png"), for: .normal)
        }
    }
    @IBAction func btnTurnChatClicked(_ sender: UIButton)
    {
        if AppDelegate.chatTurnON_bool == false
        {
            TurnOnChatValue = 0
            AppDelegate.chatTurnON_bool = true
            btnTurnonChatOutlet.setImage(UIImage(named: "uncheck.png"), for: .normal)
        }
        else
        {
            TurnOnChatValue = 1
            AppDelegate.chatTurnON_bool = false
            btnTurnonChatOutlet.setImage(UIImage(named: "check.png"), for: .normal)
        }
    }
    @IBAction func btnFeatureAdsClicked(_ sender: UIButton)
    {
        if AppDelegate.featureAds_bool == false
        {
            FeatureAdsValue = 0
            AppDelegate.featureAds_bool = true
            btnFeatureAdsOutlet.setImage(UIImage(named: "uncheck.png"), for: .normal)
        }
        else
        {
            FeatureAdsValue = 1
            AppDelegate.featureAds_bool = false
            btnFeatureAdsOutlet.setImage(UIImage(named: "check.png"), for: .normal)
        }
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // FUNCTIONS 101
     func localizationSetup()
       {
           lblImageUploadDesciption.text = Helper.MrKetUploadImage.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
           txtTittle.placeholder = Helper.MrKettittle.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
           txtDescription.placeholder = Helper.MrKetDescritption.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
           txtPrice.placeholder = Helper.MrKetPrice.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
           txtCity.placeholder = Helper.MrKetCity.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
           textBox1.placeholder = Helper.MrKetSize.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
            lblHiddenPhoneNo.text = Helper.MrKetHidnPhone.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
           lblTurnonChat.text = Helper.MrKetHidnOnChat.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
           lblFeatureAds.text = Helper.MrKetHidnDeature.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
           lblAgreement.text = Helper.MrKetDisclaimare.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        btnPublishOutlet.setTitle(Helper.publishButton.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!), for: .normal)
           
       }
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
                    print(Globals.sharedInstance.globalSelectedCityID)
                }
                else if sender.tag == 1
                {
                    self.textBox1.text = values.joined(separator: ", ")
                    let id = self.arrSizeDict.index(forKey: values.joined(separator: ", "))
                    self.SelectedSizeID = self.arrSizeDict[id!].value
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
        self.arrSizeDict.removeAll()
        self.arrSizeName.removeAll()
        self.arrSizeID.removeAll()
        Globals.sharedInstance.arrMarketSize.removeAll()
    }
}
extension MarketVC : DownloadDelegate {
   
    func downloadDynamicArrayCompleted(isCompleted: Bool)
    {
        if isCompleted
        {
            if Globals.sharedInstance.arrMarketSize.count > 0
            {
                for i in 0...Globals.sharedInstance.arrMarketSize.count - 1
                {
                    let objClub = Globals.sharedInstance.arrMarketSize[i]
                    self.arrSizeID.append(objClub.id!)
                    self.arrSizeName.append(objClub.name!)
                }
                arrSizeDict = Dictionary(uniqueKeysWithValues: zip(self.arrSizeName, self.arrSizeID))
            }
            sdLoader.stopAnimation()
        }
        else
        {
            // Error
            sdLoader.stopAnimation()
        }
    }
}
extension MarketVC: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        
        if imagePickerValue == 1
        {
            self.imageviewButton1.image = image
            Globals.sharedInstance.arrImagePickerArray.append(image!)
        }
        else if imagePickerValue == 2
        {
            self.imageviewButton2.image = image
            Globals.sharedInstance.arrImagePickerArray.append(image!)

        }
        else if imagePickerValue == 3
        {
            self.imageviewButton3.image = image
            Globals.sharedInstance.arrImagePickerArray.append(image!)
        }
    }
}
