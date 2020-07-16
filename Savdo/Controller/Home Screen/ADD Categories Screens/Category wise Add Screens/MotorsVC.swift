//
//  MotorsVC.swift
//  Savdo
//
//  Created by My MAC on 31/1/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import DropDown
import SDLoader

class MotorsVC: BaseClass {

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
    @IBOutlet weak var textBox2: UITextField!
    @IBOutlet weak var textBox3: UITextField!
    @IBOutlet weak var textBox4: UITextField!
    @IBOutlet weak var textBox5: UITextField!
    @IBOutlet weak var textBox6: UITextField!
    @IBOutlet weak var textBox7: UITextField!
    @IBOutlet weak var textBox8: UITextField!
    @IBOutlet weak var textBox9: UITextField!

    
    @IBOutlet weak var btnClearanceYES: UIButton!
    @IBOutlet weak var btnClearanceNO: UIButton!
    
    @IBOutlet weak var btnExchangeYES: UIButton!
    
    @IBOutlet weak var btnExchangeNO: UIButton!
    @IBOutlet weak var lblYes:UILabel!
    @IBOutlet weak var lblNO:UILabel!
    // LOCAL VARIABLE
    
    var SelectedCarListModelID =  [Int]()
    
    var arrCarListModelDict = [String:Int]()
    var arrCarListModelID = [Int]()
    var arrCarListModelName = [String]()
    
    var arrMotorConditionDict = [String:Int]()
    var arrMotorConditionID = [Int]()
    var arrMotorConditionName = [String]()

    var arrYearListDict = [String:Int]()
    var arrYearListID = [Int]()
    var arrYearListName = [String]()

    var arrBodyWorkListDict = [String:Int]()
    var arrBodyWorkListID = [Int]()
    var arrBodyWorkListName = [String]()

    var arrTransmissionListDict = [String:Int]()
    var arrTransmissionListID = [Int]()
    var arrTransmissionListName = [String]()

    var arrColorArraylDict = [String:Int]()
    var arrColorArrayID = [Int]()
    var arrColorArrayName = [String]()

    var arrFuelTypeDict = [String:Int]()
    var arrFuelTypeID = [Int]()
    var arrFuelTypeName = [String]()

    var arrEngineSizeDict = [String:Int]()
    var arrEngineSizeID = [Int]()
    var arrEngineSizeName = [String]()

    var arrDriveUnitListDict = [String:Int]()
    var arrDriveUnitListID = [Int]()
    var arrDriveUnitListName = [String]()
    
    var SelectedCarModelID = Int()
    var SelectedMotorConditionID = Int()
    var SelectedYearListID = Int()
    var SelectedBodyWorkListID = Int()
    var SelectedTransmissionListID = Int()
    var SelectedColorArrayID = Int()
    var SelectedFuelTypeID = Int()
    var SelectedEngineSizeID = Int()
    var SelectedDriveUnitID = Int()

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBAction func btnClearanceAction(_ sender: Any)
    {
        
    }
    
    @IBAction func btnExchangeAction(_ sender: Any)
    {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sdLoader.startAnimating(atView: self.view)
       // Globals.sharedInstance.arrImagePickerArray.removeAll()
        txtCity.isEnabled = false
        removeAll()
        //lblSequence.numberOfLines = 2
        lblSequence.text = "\(Globals.globalCategoryName) / \(Globals.globalSubCategoryName) / \(Globals.globalChildSubCategoryName)"
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        objParser.downloadDelegate = self
        Globals.sharedInstance.arrCarListModel.removeAll()
        
        if Globals.globalSubCategoryID == 11
        {
            print("CAR SUB MODEL ID",Globals.globalChildSubCategoryID)
            objParser.CarSubModelAPICall(CarModelID: String(Globals.globalChildSubCategoryID))
        }
        objParser.getDynamicArray(CategoryID: String(3))
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
    
    override func showAlertOK(tittle: String, Message: String)
       {
           let alertVC = CPAlertVC(title: tittle, message: Message)

           alertVC.addAction(CPAlertAction(title: "Ok", type: .normal, handler: {
               print("Tapped OK button")
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.HomeScreen) as! HomeScreen
               self.navigationController?.pushViewController(nextVC, animated: true)
           }))
           alertVC.show(into: self)
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
            PickerShow(PickerArray: self.arrCarListModelName, sender: sender)
        }
        else if sender.tag == 2
        {
            PickerShow(PickerArray: self.arrMotorConditionName, sender: sender)
        }
        else if sender.tag == 3
        {
            PickerShow(PickerArray: self.arrYearListName, sender: sender)
        }
        else if sender.tag == 4
        {
             PickerShow(PickerArray: self.arrBodyWorkListName, sender: sender)
        }
        else if sender.tag == 5
        {
             PickerShow(PickerArray: self.arrTransmissionListName, sender: sender)
        }
        else if sender.tag == 6
        {
             PickerShow(PickerArray: self.arrColorArrayName, sender: sender)
        }
        else if sender.tag == 7
        {
             PickerShow(PickerArray: self.arrFuelTypeName, sender: sender)
        }
        else if sender.tag == 8
        {
             PickerShow(PickerArray: self.arrEngineSizeName, sender: sender)
        }
        else if sender.tag == 9
        {
             PickerShow(PickerArray: self.arrDriveUnitListName, sender: sender)
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
        lblImageUploadDesciption.text = Helper.mtrUploadImage.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtTittle.placeholder = Helper.mtrtittle.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtDescription.placeholder = Helper.mtrDescritption.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtPrice.placeholder = Helper.mtrPrice.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtCity.placeholder = Helper.mtrCity.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox2.placeholder = Helper.mtrCondtiotn.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox1.placeholder = Helper.mtrCarmodel.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox2.placeholder = Helper.mtrCondtiotn.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox3.placeholder = Helper.mtrYear.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox4.placeholder = Helper.mtrBodywk.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox5.placeholder = Helper.mtrTranss.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox6.placeholder = Helper.mtrColor.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox7.placeholder = Helper.mtrFueltype.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox8.placeholder = Helper.mtrEngine.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        textBox9.placeholder = Helper.mtrDriveUnt.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblTurnonChat.text = Helper.mtrHidnOnChat.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblFeatureAds.text = Helper.mtrHidnDeature.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblAgreement.text = Helper.mtrDisclaimare.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblYes.text = Helper.mtrYes.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblNO.text = Helper.mtrNo.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
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
                    let id = self.arrCarListModelDict.index(forKey: values.joined(separator: ", "))
                    self.SelectedCarModelID = self.arrCarListModelDict[id!].value
                }
                else if sender.tag == 2
                {
                    self.textBox2.text = values.joined(separator: ", ")
                    let id = self.arrMotorConditionDict.index(forKey: values.joined(separator: ", "))
                    self.SelectedMotorConditionID = self.arrMotorConditionDict  [id!].value
                }
                else if sender.tag == 3
                {
                    self.textBox3.text = values.joined(separator: ", ")
                    let id = self.arrYearListDict.index(forKey: values.joined(separator: ", "))
                    self.SelectedYearListID = self.arrYearListDict[id!].value
                }
                else if sender.tag == 4
                {
                    self.textBox4.text = values.joined(separator: ", ")
                    let id = self.arrBodyWorkListDict.index(forKey: values.joined(separator: ", "))
                    self.SelectedBodyWorkListID = self.arrBodyWorkListDict[id!].value
                }
                else if sender.tag == 5
                {
                    self.textBox5.text = values.joined(separator: ", ")
                    let id = self.arrTransmissionListDict.index(forKey: values.joined(separator: ", "))
                    self.SelectedTransmissionListID = self.arrTransmissionListDict[id!].value
                }
                else if sender.tag == 6
                {
                    self.textBox6.text = values.joined(separator: ", ")
                    let id = self.arrColorArraylDict.index(forKey: values.joined(separator: ", "))
                    self.SelectedColorArrayID = self.arrColorArraylDict[id!].value
                }
                else if sender.tag == 7
                {
                    self.textBox7.text = values.joined(separator: ", ")
                    let id = self.arrFuelTypeDict.index(forKey: values.joined(separator: ", "))
                    self.SelectedFuelTypeID = self.arrFuelTypeDict[id!].value
                }
                else if sender.tag == 8
                {
                    self.textBox8.text = values.joined(separator: ", ")
                    let id = self.arrEngineSizeDict.index(forKey: values.joined(separator: ", "))
                    self.SelectedEngineSizeID = self.arrEngineSizeDict[id!].value
                }
                else if sender.tag == 9
                {
                    self.textBox9.text = values.joined(separator: ", ")
                    let id = self.arrDriveUnitListDict.index(forKey: values.joined(separator: ", "))
                    self.SelectedDriveUnitID = self.arrDriveUnitListDict[id!].value
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
        Globals.sharedInstance.arrSubCarListModel.removeAll()
        Globals.sharedInstance.arrMotorCondition.removeAll()
        Globals.sharedInstance.arrYearList.removeAll()
        Globals.sharedInstance.arrBodyWork.removeAll()
        Globals.sharedInstance.arrTransmissionList.removeAll()
        Globals.sharedInstance.arrMotorColor.removeAll()
        Globals.sharedInstance.arrMotorFuelType.removeAll()
        Globals.sharedInstance.arrEngineSize.removeAll()
        Globals.sharedInstance.arrDriveUnit.removeAll()
        
        
        self.arrCarListModelDict.removeAll()
        self.arrCarListModelID.removeAll()
        self.arrCarListModelName.removeAll()
        
        arrMotorConditionDict.removeAll()
        arrMotorConditionID.removeAll()
        arrMotorConditionName.removeAll()

        arrYearListDict.removeAll()
        arrYearListID.removeAll()
        arrYearListName.removeAll()

        arrBodyWorkListDict.removeAll()
        arrBodyWorkListID.removeAll()
        arrBodyWorkListName.removeAll()

        arrTransmissionListDict.removeAll()
        arrTransmissionListID.removeAll()
        arrTransmissionListName.removeAll()

        arrColorArraylDict.removeAll()
        arrColorArrayID.removeAll()
        arrColorArrayName.removeAll()

         arrFuelTypeDict.removeAll()
         arrFuelTypeID.removeAll()
         arrFuelTypeName.removeAll()

         arrEngineSizeDict.removeAll()
         arrEngineSizeID.removeAll()
         arrEngineSizeName.removeAll()

         arrDriveUnitListDict.removeAll()
         arrDriveUnitListID.removeAll()
         arrDriveUnitListName.removeAll()
    }
    
    
}
extension MotorsVC : DownloadDelegate {
   
    func downloadCarSubModelArrayCompleted(isCompleted: Bool) {

     if isCompleted
      {
         if Globals.sharedInstance.arrSubCarListModel.count > 0
         {
             for i in 0...Globals.sharedInstance.arrSubCarListModel.count - 1
             {
                 let objClub = Globals.sharedInstance.arrSubCarListModel[i]
                 self.arrCarListModelID.append(objClub.id!)
                 self.arrCarListModelName.append(objClub.name!)
             }
             arrCarListModelDict = Dictionary(uniqueKeysWithValues: zip(self.arrCarListModelName, self.arrCarListModelID))
         }
          sdLoader.stopAnimation()
      }
      else
      {
          // Error
          sdLoader.stopAnimation()
      }
    }
    
    func downloadDynamicArrayCompleted(isCompleted: Bool)
    {
        
        
        if isCompleted
        {
            /*if Globals.sharedInstance.arrCarListModel.count > 0
            {
                for i in 0...Globals.sharedInstance.arrCarListModel.count - 1
                {
                    let objClub = Globals.sharedInstance.arrCarListModel[i]
                    self.arrCarListModelID.append(objClub.id!)
                    self.arrCarListModelName.append(objClub.name!)
                }
                arrCarListModelDict = Dictionary(uniqueKeysWithValues: zip(self.arrCarListModelName, self.arrCarListModelID))
            }*/
            
            if Globals.sharedInstance.arrMotorCondition.count > 0
            {
                for i in 0...Globals.sharedInstance.arrMotorCondition.count - 1
                {
                    let objClub = Globals.sharedInstance.arrMotorCondition[i]
                    self.arrMotorConditionID.append(objClub.id!)
                    self.arrMotorConditionName.append(objClub.name!)
                    print(self.arrMotorConditionName)
                }
                arrMotorConditionDict = Dictionary(uniqueKeysWithValues: zip(self.arrMotorConditionName, self.arrMotorConditionID))
            }
            
            
            if Globals.sharedInstance.arrYearList.count > 0
            {
                for i in 0...Globals.sharedInstance.arrYearList.count - 1
                {
                    let objClub = Globals.sharedInstance.arrYearList[i]
                    self.arrYearListID.append(objClub.id!)
                    self.arrYearListName.append(objClub.name!)
                }
                arrYearListDict = Dictionary(uniqueKeysWithValues: zip(self.arrYearListName, self.arrYearListID))
            }
            
            
            
            if Globals.sharedInstance.arrBodyWork.count > 0
            {
                for i in 0...Globals.sharedInstance.arrBodyWork.count - 1
                {
                    let objClub = Globals.sharedInstance.arrBodyWork[i]
                    self.arrBodyWorkListID.append(objClub.id!)
                    self.arrBodyWorkListName.append(objClub.name!)
                }
                arrBodyWorkListDict = Dictionary(uniqueKeysWithValues: zip(self.arrBodyWorkListName, self.arrBodyWorkListID))
                
                print("BodyWork ID",self.arrBodyWorkListID)
                print("BodyWork NAME",self.arrBodyWorkListName)
                print("BodyWork DICT",self.arrBodyWorkListDict)

            }
            if Globals.sharedInstance.arrTransmissionList.count > 0
            {
                for i in 0...Globals.sharedInstance.arrTransmissionList.count - 1
                {
                    let objClub = Globals.sharedInstance.arrTransmissionList[i]
                    self.arrTransmissionListID.append(objClub.id!)
                    self.arrTransmissionListName.append(objClub.name!)
                }
                arrTransmissionListDict = Dictionary(uniqueKeysWithValues: zip(self.arrTransmissionListName, self.arrTransmissionListID))
            }
            if Globals.sharedInstance.arrMotorColor.count > 0
            {
                for i in 0...Globals.sharedInstance.arrMotorColor.count - 1
                {
                    let objClub = Globals.sharedInstance.arrMotorColor[i]
                    self.arrColorArrayID.append(objClub.id!)
                    self.arrColorArrayName.append(objClub.name!)
                }
               arrColorArraylDict = Dictionary(uniqueKeysWithValues: zip(self.arrColorArrayName, self.arrColorArrayID))
            }
            
            if Globals.sharedInstance.arrMotorFuelType.count > 0
            {
                for i in 0...Globals.sharedInstance.arrMotorFuelType.count - 1
                {
                    let objClub = Globals.sharedInstance.arrMotorFuelType[i]
                    self.arrFuelTypeID.append(objClub.id!)
                    self.arrFuelTypeName.append(objClub.name!)
                }
                arrFuelTypeDict = Dictionary(uniqueKeysWithValues: zip(self.arrFuelTypeName, self.arrFuelTypeID))
            }
            
            if Globals.sharedInstance.arrEngineSize.count > 0
            {
                for i in 0...Globals.sharedInstance.arrEngineSize.count - 1
                {
                    let objClub = Globals.sharedInstance.arrEngineSize[i]
                    self.arrEngineSizeID.append(objClub.id!)
                    self.arrEngineSizeName.append(objClub.name!)
                }
                arrEngineSizeDict = Dictionary(uniqueKeysWithValues: zip(self.arrEngineSizeName, self.arrEngineSizeID))
            }
            
            if Globals.sharedInstance.arrDriveUnit.count > 0
            {
                for i in 0...Globals.sharedInstance.arrDriveUnit.count - 1
                {
                    let objClub = Globals.sharedInstance.arrDriveUnit[i]
                    self.arrDriveUnitListID.append(objClub.id!)
                    self.arrDriveUnitListName.append(objClub.name!)
                }
                arrDriveUnitListDict = Dictionary(uniqueKeysWithValues: zip(self.arrDriveUnitListName, self.arrDriveUnitListID))
            }
           
            sdLoader.stopAnimation()
        }
        else
        {
            // Error
            sdLoader.stopAnimation()
        }
    }
   
    
    func postAdsDataCompleted(isCompleted: Bool) {
        
        if isCompleted
        {
            sdLoader.stopAnimation()
            print("POST DATA SUCCESSFULL")
        }
        else
        {
            // Error
            sdLoader.stopAnimation()
        }
    }
}
extension MotorsVC: ImagePickerDelegate {

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



