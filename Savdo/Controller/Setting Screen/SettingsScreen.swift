//
//  SettingsScreen.swift
//  Bazaraki
//
//  Created by suresh on 28/12/19.
//  Copyright © 2019 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit

class SettingsScreen: BaseClass {

    @IBOutlet weak var HeaderBar: UIView!
    
    @IBOutlet weak var HeaderTittle: UILabel!
    
    @IBOutlet weak var txtName: FloatLabelTextField!
    @IBOutlet weak var txtEmail: FloatLabelTextField!
    @IBOutlet weak var txtPhoneNumber: FloatLabelTextField!
    
    @IBOutlet weak var lblEmailNotificationTittle: UILabel!
    @IBOutlet weak var lblNotifyOnNewAds: UILabel!
    @IBOutlet weak var lblNewAdsInCategories: UILabel!
    @IBOutlet weak var lblToNotifyPublicationAds: UILabel!
    @IBOutlet weak var lblPushNotificationTittle: UILabel!
    @IBOutlet weak var lblNotificationChatTittle: UILabel!
    @IBOutlet weak var lblNotiyWhenAdsPublished: UILabel!
    @IBOutlet weak var lblNotifyWhenAdsRejected: UILabel!
    @IBOutlet weak var lblBlockList: UILabel!
    @IBOutlet weak var btnSaveChangesOutlet: CustomButton!
    @IBOutlet weak var btnLogoutOutlet: CustomButton!
    @IBOutlet weak var btnDeleteAccountOutlet: CustomButton!
    
    override func viewWillAppear(_ animated: Bool)
    {
       self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**
         imgAnimatedGIF.loadGif(name: "animatedlogo")
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.LoginScreen) as! LoginScreen
                    self.navigationController?.pushViewController(nextVC, animated: true)
                })
         */
        
        setCustomView(CustomView: HeaderBar, HeaderTittleColor: HeaderTittle)
        LocalizationSetup()
    }
    
    func LocalizationSetup()
    {
        HeaderTittle.text = Helper.settingtittle.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)

        txtName.placeholder = Helper.nameinsetting.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtEmail.placeholder = Helper.emailinsetting.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        txtPhoneNumber.placeholder = Helper.phonenoinsetting.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblEmailNotificationTittle.text = Helper.emailnotificationtittle.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        
        lblNotifyOnNewAds.text = Helper.notifyonnewads.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblNewAdsInCategories.text = Helper.newadsincategories.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        
        //lblToNotifyPublicationAds.text = Helper.notiy.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        
        lblPushNotificationTittle.text = Helper.pushnotificationtittle.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblNotificationChatTittle.text = Helper.chatnotificationtittle.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblNotiyWhenAdsPublished.text = Helper.notifywhenadspublished.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        
        lblNotifyWhenAdsRejected.text = Helper.notifywhenadsrejected.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        lblBlockList.text = Helper.blocklist.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)

        btnSaveChangesOutlet.setTitle(Helper.savechanges.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),for: .normal)
        btnLogoutOutlet.setTitle(Helper.logoutaccount.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),for: .normal)
        btnDeleteAccountOutlet.setTitle(Helper.deleteaccount.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),for: .normal)
    }
        
    @IBAction func btnBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
