//
//  MyaddScreen.swift
//  Bazaraki
//
//  Created by suresh on 19/12/19.
//  Copyright © 2019 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class myAddCell : UITableViewCell
{
    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var imgMenu: UIImageView!
    @IBOutlet weak var lblMenuName: UILabel!
    @IBOutlet weak var lblMenuDetail: UILabel!
}

class lastCell : UITableViewCell
{
    @IBOutlet weak var lblLastCell : UILabel!
}

class MyaddScreen: BaseClass {


    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var tableView: UITableView!
   /* let menuArray: [String] = [Helper.myaccounts.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),
                              Helper.myads.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),
                              Helper.settings.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),
                              Helper.topupwallet.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),
                              Helper.payments.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)]
    */
    let menuArray: [String] = ["Мои счета",
                               "Мои объявления",
                               "настройки",
                               "Пополнять кошелек",
                               "платежи"]
    
    let menuImages: [String] = ["user.png", "myads.png", "settings.png", "wallet.png", "payments.png"]
    
    let arrLastCell : [String] = ["Любые вопросы? Написать нам письмо по почте: info@yourlogo.com. Ответы на многие вопросы можно найти на странице «Q & A» ИЛИ «Вопросы и ответы»"]
    
    
    override func viewWillAppear(_ animated: Bool)
    {
       self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tabBarController?.tabBar.items![2].title = Helper.tabAdds.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)

       // DispatchQueue.main.async {
           // self.imgLogo.loadGif(name: "SavdoGIF")
       // }
    }
}

extension MyaddScreen : UITableViewDelegate , UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0
        {
            return self.menuArray.count
        }
        return self.arrLastCell.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0
        {
            let cell: myAddCell = (tableView.dequeueReusableCell(withIdentifier: "Cell") as! myAddCell?)!
            cell.selectionStyle = .none
            cell.lblMenuName.text = self.menuArray[indexPath.row]
            cell.imgMenu?.setAdsRoundedImageView()
            cell.imgMenu?.image = UIImage(named: self.menuImages[indexPath.row])
            
            if indexPath.row == 0
            {
                cell.lblMenuDetail.isHidden = false
                cell.lblMenuDetail.text = Helper.inthewallet.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
            }
            else
            {
                cell.lblMenuDetail.isHidden = true
            }
            return cell
        }
        else
        {
            let cell: lastCell = (tableView.dequeueReusableCell(withIdentifier: "lastCell") as! lastCell?)!
            cell.selectionStyle = .none
            cell.lblLastCell.text = self.arrLastCell[indexPath.row]
            return cell
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        showNormalAlert(tittle: "бдительный", Message: "Скоро")
    }
}
