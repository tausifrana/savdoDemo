//
//  OTPVerifiedScreen.swift
//  Bazaraki
//
//  Created by suresh on 17/12/19.
//  Copyright © 2019 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import KWVerificationCodeView

class OTPVerifiedScreen: BaseClass {

    @IBOutlet weak var HeaderBar: UIView!
    @IBOutlet weak var HeaderBarTittle: UILabel!
    @IBOutlet weak var btnSubmitOutlet: CustomButton!
    @IBOutlet weak var timerAlert: UILabel!
    @IBOutlet weak var verificationCodeView: KWVerificationCodeView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        verificationCodeView.delegate = self
        setCustomView(CustomView: HeaderBar, HeaderTittleColor: HeaderBarTittle)
        self.timerAlert.isHidden = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc override func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func btnSubmitAction(_ sender: UIButton)
    {
        if verificationCodeView.hasValidCode()
        {
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC")
            self.navigationController?.pushViewController(nextVC!, animated: true)
        }
    }
    
    @IBAction func BackAction(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
    
extension OTPVerifiedScreen: KWVerificationCodeViewDelegate {
  func didChangeVerificationCode() {
    btnSubmitOutlet.isEnabled = verificationCodeView.hasValidCode()
  }
}
