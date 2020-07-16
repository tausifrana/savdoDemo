//
//  UITextField.swift
//
//  Created by suresh on 14/9/18.
//  Copyright © 2018 bhavi. All rights reserved.
//

import Foundation
import UIKit
import CoreData


enum FHAlertAnimationType{
    case scale
    case rotate
    case bounceUp
    case bounceDown
}


// Textfield Extension
extension UITextField {
    
    func setPreferences() {
        self.layer.cornerRadius = 3
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
    }
    
    // txtEmail.setTextboxPreference(bgColor: UIColor.clear, placeholderTxt: "UserName", placeholderColor: UIColor.darkGray, txtColor: UIColor.darkGray)

    func setTextboxPreference(bgColor: UIColor, placeholderTxt: String, placeholderColor: UIColor, txtColor: UIColor) {
        
        self.backgroundColor = bgColor
        self.attributedPlaceholder = NSAttributedString(string: placeholderTxt, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        self.textColor = txtColor
    }
    
    func setTextboxTextColor(txtColor: UIColor) {
        self.textColor = txtColor
    }
    
    func placeholderColor(_ color: UIColor){
        var placeholderText = ""
        if self.placeholder != nil{
            placeholderText = self.placeholder!
        }
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
    
    func errorStyle() {
        self.layer.backgroundColor = UIColor(red: 255/255, green: 50/255, blue: 50/255, alpha: 0.8).cgColor
        self.text = ""
    }
}

// View Extension
extension UIView {
    
    func setLayout() {
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor

    }
}

// Button Extension
extension UIButton {
    
    func setPreferencesLayout() {
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.colorWithHexString(hexStr: "1AD7D0").cgColor
        
    }
    
    func setPreferencesColored() {
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.backgroundColor = UIColor.colorWithHexString(hexStr: "1AD7D0").cgColor
    }
    
    
    func setRect() {
        self.frame = CGRect(x: 160, y: 100, width: 40, height: 40)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        
    }
}

extension UIImageView {
    
    func setRounded() {
       self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.cornerRadius = 2
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func setCircledImage() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
    }
}

extension UserDefaults {
    func contains(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
