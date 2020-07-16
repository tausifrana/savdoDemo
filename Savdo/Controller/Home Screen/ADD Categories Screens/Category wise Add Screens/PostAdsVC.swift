//
//  PostAdsVC.swift
//  Savdo
//
//  Created by My MAC on 31/1/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import DropDown
import SDLoader
import Alamofire

class cellPubImage : UICollectionViewCell
{
    @IBOutlet weak var imgView:UIImageView!
    @IBOutlet weak var btnRemove:UIButton!
}

class PostAdsVC: BaseClass {

    var publishImage:Int = 0
    var realEstateVC = RealEstateVC()
    var imagePicker: ImagePicker!
    
    let objParser = Parser()
    var imagePickerValue = 0
    var HiddenPhoneNoValue = 0
    var TurnOnChatValue = 0
    var FeatureAdsValue = 0

    @IBOutlet weak var noImage: UIImageView!
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
    @IBOutlet weak var collectionGridView:UICollectionView!

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomView(CustomView: HeaderBar, HeaderTittleColor: lblHeaderTittle)

        Globals.sharedInstance.arrImagePickerArray.removeAll()
        txtCity.isEnabled = false
        txtPrice.keyboardType = .numberPad
        self.collectionGridView.layoutIfNeeded()
        Globals.sharedInstance.arrImagePickerArray.removeAll()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)

        if Globals.globalChildSubCategoryName == ""
        {
            lblSequence.numberOfLines = 2
            lblSequence.text = "\(Globals.globalCategoryName) / \(Globals.globalSubCategoryName)"
        }
        else
        {
            lblSequence.numberOfLines = 2
            lblSequence.text = "\(Globals.globalCategoryName) / \(Globals.globalSubCategoryName) / \(Globals.globalChildSubCategoryName)"
        }

        self.imagePicker = ImagePicker(presentationController: self, delegate: self)

    }
    
    @IBAction func btnAddImageAction(_ sender: UIButton)
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
            if Globals.globalCategoryID == Constant.CategoryID.RealEstateID
            {
                print("REAL ESTATE API CALL FROM COMMON SCREEN")
                
                Globals.GlobalTittle = txtTittle.text!
                Globals.GlobalDescription = txtDescription.text!
                Globals.GlobalPrice = Int(txtPrice.text!)!
                
                Globals.GlobalArea = ""
                Globals.GlobalSelectedBuildingTypeID = 0
                Globals.GlobalSelectedFloorTypeID = 0
                Globals.GlobalSelectedRepairID = 0
                MoveToImagePicker()
            }
            else if Globals.globalCategoryID == Constant.CategoryID.MotorsID
            {
                print("MOTOR API CALL FROM COMMON SCREEN")
                
                Globals.GlobalTittle = txtTittle.text!
                Globals.GlobalDescription = txtDescription.text!
                Globals.GlobalPrice = Int(txtPrice.text!)!
                
                 MoveToImagePicker()
            }
            else if Globals.globalCategoryID == Constant.CategoryID.MarketID
            {
                print("MARKET API CALL FROM COMMON SCREEN")
                
                Globals.GlobalTittle = txtTittle.text!
                Globals.GlobalDescription = txtDescription.text!
                Globals.GlobalPrice = Int(txtPrice.text!)!
                
                 MoveToImagePicker()
            }
            else
            {
                print("COMMON API CALL FROM COMMON SCREEN")

                Globals.GlobalTittle = txtTittle.text!
                Globals.GlobalDescription = txtDescription.text!
                Globals.GlobalPrice = Int(txtPrice.text!)!
                MoveToImagePicker()

              /*  CommonAPICall(UserID : UserDefaults.standard.string(forKey: Constant.SESSION.CustomerID)!,
                              CategoryID : String(Globals.globalCategoryID),
                              SubCategoryID : String(Globals.globalSubCategoryID),
                              ChildSubCategoryID : String(Globals.globalChildSubCategoryID),
                              Title : txtTittle.text!,
                              Description : txtDescription.text!,
                              Price : txtPrice.text!,
                              City_Id : String(Globals.sharedInstance.globalSelectedCityID),
                              PhoneAllowed : String(HiddenPhoneNoValue),
                              ChatAllowed : String(TurnOnChatValue),
                              FeatureAdsAllowed : String(FeatureAdsValue))*/
                
                MoveToImagePicker()

            }
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
    
    @objc func btnAdd(sender:UIButton){
        Globals.sharedInstance.arrImagePickerArray.remove(at: sender.tag)
        self.collectionGridView.reloadData()
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    // FUNCTIONS 101
    func localizationSetup()
    {
        lblImageUploadDesciption.text = Helper.PAddUploadImage.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtTittle.placeholder = Helper.PAddtittle.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtDescription.placeholder = Helper.PAddDescritption.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtPrice.placeholder = Helper.PAddPrice.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtCity.placeholder = Helper.PAddCity.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
         lblHiddenPhoneNo.text = Helper.PAddHidnPhone.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblTurnonChat.text = Helper.PAddHidnOnChat.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblFeatureAds.text = Helper.PAddHidnDeature.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblAgreement.text = Helper.PAddDisclaimare.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
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
}
extension PostAdsVC : DownloadDelegate {
   
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
extension PostAdsVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if Globals.sharedInstance.arrImagePickerArray.count > 0
        {
            self.noImage.isHidden = true
        }
        else
        {
            self.noImage.isHidden = false
        }
        return  Globals.sharedInstance.arrImagePickerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPubImage", for: indexPath) as! cellPubImage
        cell.contentView.setNeedsLayout()
        cell.contentView.layoutIfNeeded()
        cell.layoutIfNeeded()
        let borderLayer  = dashedBorderLayerWithColor(color: UIColor.darkGray.cgColor, view: cell.contentView, cell: cell)
        cell.contentView.layer.sublayers?.append(borderLayer)
        
        cell.btnRemove.tag = indexPath.row
        cell.btnRemove.addTarget(self, action: #selector(btnAdd(sender:)), for: .touchUpInside)

        cell.imgView.image = Globals.sharedInstance.arrImagePickerArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let collectionVwWidth = UIScreen.main.bounds.width - 30
        return CGSize(width: (collectionVwWidth) / 3, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

extension PostAdsVC: ImagePickerDelegate {

    func didSelect(image: UIImage?)
    {
        if image != nil
        {
            Globals.sharedInstance.arrImagePickerArray.append(image!)
            self.collectionGridView.reloadData()
        }
       
    }
}
