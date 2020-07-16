//
//  AdsSubCategoryScreen.swift
//  Savdo
//
//  Created by My MAC on 22/1/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import SDLoader

class AdsSubCategoryCell : UITableViewCell
{
    @IBOutlet weak var tblBGView: UIView!
    @IBOutlet weak var lblCategoryName: UILabel!
}

class AdsSubCategoryScreen: BaseClass {
    
    let objParser = Parser()
    
    @IBOutlet weak var HeaderBar: UIView!
    @IBOutlet weak var HeaderBarTittle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCustomView(CustomView: HeaderBar, HeaderTittleColor: HeaderBarTittle)
        sdLoader.startAnimating(atView: self.view)
        HeaderBarTittle.text = Globals.globalCategoryName
        objParser.downloadDelegate = self
        Globals.sharedInstance.arrSubCategoryData.removeAll()
        objParser.getSubCategoriesAPI(CategoryID: String(Globals.globalCategoryID))
    }
    
    @IBAction func btnBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
extension AdsSubCategoryScreen : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Globals.sharedInstance.arrSubCategoryData.count > 0 {
            return Globals.sharedInstance.arrSubCategoryData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: AdsSubCategoryCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! AdsSubCategoryCell
         cell.selectionStyle = .none
        let objData = Globals.sharedInstance.arrSubCategoryData[indexPath.row]
        cell.lblCategoryName.text = objData.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objData = Globals.sharedInstance.arrSubCategoryData[indexPath.row]
        
        Globals.globalSubCategoryID = objData.id
        Globals.globalSubCategoryName = objData.name
    
        Globals.sharedInstance.arrChildSubCategoryData.removeAll()
        objParser.getChildSubCategoriesAPI(CategoryID: String(Globals.globalCategoryID), SubCategoryID: String(Globals.globalSubCategoryID))
    }
}

extension AdsSubCategoryScreen : DownloadDelegate {
   
    // SUB CATEGORY DATA
    func downloadSubCategoriesData(isCompleted: Bool) {
        
        if isCompleted
        {
            if Globals.sharedInstance.arrSubCategoryData.count > 0
            {
                tableView.delegate = self
                tableView.dataSource = self
                tableView.reloadData()
                sdLoader.stopAnimation()
            }
            else
            {
                // Empty Array
                sdLoader.stopAnimation()
                
                let alert = UIAlertController(title: "Alert", message: "No Data Fount", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
                    print("Action")
                    ///self.navigationController?.popViewController(animated: true)

                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        else
        {
            // Error
            sdLoader.stopAnimation()
        }
    }
    
    // SUB CATEGORY CHILD DATA
    func downloadChildSubCategoriesData(isCompleted: Bool) {
        
        if isCompleted
        {
            if Globals.sharedInstance.arrChildSubCategoryData.count > 0
            {
                print("ENTER IN SUB CHILD SCREEN")

                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.AdsChildSubcategoryScreen) as! AdsChildSubcategoryScreen
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
            else
            {
                // Empty Array
                print("ENTER IN COMMON SCREEN")
                
                if Globals.globalSubCategoryID == 11
                {
                    sdLoader.stopAnimation()
                    Globals.globalChildSubCategoryID = 0
                    Globals.globalChildSubCategoryName = ""
                    MoveToScreen(CategoryID: String(Globals.globalCategoryID))
                }
                else
                {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.PostAdsVC) as! PostAdsVC
                    self.navigationController?.pushViewController(nextVC, animated: true)
                }
            }
        }
        else
        {
            // Error
            sdLoader.stopAnimation()
        }
    }
}
