//
//  LoginScreen.swift
//  Bazaraki
//
//  Created by suresh on 17/12/19.
//  Copyright © 2019 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import ActiveLabel

class LoginScreen: BaseClass
{
    @IBOutlet weak var HeaderBar: UIView!
    @IBOutlet weak var HeaderBarTittle: UILabel!
    @IBOutlet weak var txtCountryCode: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var lblAlert: UILabel!
    @IBOutlet weak var lblAgreement: UILabel!
    @IBOutlet weak var lblAgreementHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnContinueOutlet: UIButton!
    @IBOutlet weak var btnAgreementOutlet: UIButton!
    
    @IBOutlet weak var lblEnterPhoneNo: UILabel!
    var a = 0

    override func viewWillAppear(_ animated: Bool)
    {
       self.tabBarController?.tabBar.isHidden = true
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        lblAlert.isHidden = true
        txtCountryCode.text = "+992"
        txtCountryCode.textColor = UIColor.darkGray
        txtCountryCode.isEnabled = false
        
        AgreementLableUI()
        setCustomView(CustomView: HeaderBar, HeaderTittleColor: HeaderBarTittle)
    }
    
    func AgreementLableUI()
    {
        self.lblAgreement.text = "I agree to the collection, use and processing of my personal data, and confirmation that I am at least 18 years old. I agree I've read and accept Terms and Conditions."
        
        self.lblAgreement.numberOfLines = 0
        self.lblAgreement.sizeToFit()
        lblAgreementHeightConstraint.constant = self.lblAgreement.frame.height + 2
    }
    
    func InitUI()
    {
        HeaderBarTittle.font = Constant.GloableFontSetting.tittleFont
        okButtonAppearance(button: btnContinueOutlet)
    }
    
    @IBAction func btnAgreementClick(_ sender: UIButton)
    {
        if AppDelegate.menu_checked == false
        {
            AppDelegate.menu_checked = true
            btnAgreementOutlet.setImage(UIImage(named: "check.png"), for: .normal)
        }
        else
        {
            AppDelegate.menu_checked = false
            btnAgreementOutlet.setImage(UIImage(named: "uncheck.png"), for: .normal)
        }
    }
    
    @IBAction func btnBack(_ sender: Any)
    {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC")
        self.navigationController?.pushViewController(nextVC!, animated: true)
    }
    
    @IBAction func btnContinueClick(_ sender: UIButton)
    {
    
        if AppDelegate.menu_checked == false
        {
            print("ACCEPT TERMS AND CONDITION")
        }
        else
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.OTPVerifiedScreen) as! OTPVerifiedScreen
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
