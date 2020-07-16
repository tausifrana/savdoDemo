//
//  AppDelegate.swift
//  Bazaraki
//
//  Created by suresh on 17/12/19.
//  Copyright © 2019 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    static var menu_checked = false
    let Session = UserDefaults.standard
    static var hiddenPhoneNo_bool = false
    static var chatTurnON_bool = false
    static var featureAds_bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        UserDefaults.standard.set(Constant.LocalizationLanguages.RU, forKey: Constant.SESSION.APPLANGUAGES)
        UserDefaults.standard.synchronize()
        IQKeyboardManager.shared.enable = true

        return true
    }

    func setLocalization()
    {
        /* let currentDeviceLanguage = String(Locale.preferredLanguages[0].prefix(2))
               let path = Bundle.main.path(forResource: currentDeviceLanguage, ofType: "lproj")
               if path != nil
               {Right Now the mainly task work done is Post Ads with different  category i am still working on it. As soon as All Category Ads Post done then We will move to show that posted ads. At that time you can show it clearly then check it. I will upload new build with these task at the end of this week.
                   if (self.Session.string(forKey: Constant.SESSION.APPLANGUAGES) != nil)
                   {
                       let selectedLanguages = self.Session.string(forKey: Constant.SESSION.APPLANGUAGES)

                       if selectedLanguages == Constant.LocalizationLanguages.EN
                       {
                           UserDefaults.standard.set(Constant.LocalizationLanguages.EN, forKey: Constant.SESSION.APPLANGUAGES)
                           UserDefaults.standard.synchronize()
                       }
                       else if selectedLanguages == Constant.LocalizationLanguages.RU
                       {
                           UserDefaults.standard.set(Constant.LocalizationLanguages.RU, forKey: Constant.SESSION.APPLANGUAGES)
                           UserDefaults.standard.synchronize()
                       }
                   }
                   else
                   {
                       UserDefaults.standard.set(currentDeviceLanguage, forKey: Constant.SESSION.APPLANGUAGES)
                       UserDefaults.standard.synchronize()
                   }
               }
               else
               {
                   UserDefaults.standard.set(Constant.LocalizationLanguages.EN, forKey: Constant.SESSION.APPLANGUAGES)
                   UserDefaults.standard.synchronize()
               }*/
    }
    
    
    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to releagzCse any resources that were specific to the discarded scenes, as they will not return.
    }
}
