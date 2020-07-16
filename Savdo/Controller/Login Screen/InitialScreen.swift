//
//  InitialScreen.swift
//  Bazaraki
//
//  Created by suresh on 27/12/19.
//  Copyright © 2019 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import SwiftGifOrigin
import Alamofire

class InitialScreen: UIViewController  {
    
    @IBOutlet weak var imgAnimatedGIF: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        /*Parser.shared.LoginAPI()
        let d = Parser();
        d.downloadDelegate = self
        d.LoginAPI()
        d.RegisterTokerAPI()*/
        
        imgAnimatedGIF.loadGif(name: "animatedlogo")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            
           /* let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.LoginScreen) as! LoginScreen
            self.navigationController?.pushViewController(nextVC, animated: true)*/
            
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC")
            self.navigationController?.pushViewController(nextVC!, animated: true)
        })
    }
}
extension InitialScreen : DownloadDelegate {
    
    func downloadCompleted(isCompleted: Bool) {
           
           if isCompleted
           {
               print("SUCCESS -->>")
           }
           else
           {
               print("FALSE -->>")
           }
       }
   }


