//
//  AdsChildSubcategoryScreen.swift
//  Savdo
//
//  Created by My MAC on 23/1/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import SDLoader

class AdsChildSubCategoryCell : UITableViewCell
{
    @IBOutlet weak var tblBGView: UIView!
    @IBOutlet weak var lblCategoryName: UILabel!
}

class AdsChildSubcategoryScreen: BaseClass {
    
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
        HeaderBarTittle.text = Globals.globalSubCategoryName
    }
    
    @IBAction func btnBack(_ sender: Any)
    {
        Globals.globalChildSubCategoryID = 0
        Globals.globalChildSubCategoryName = ""
        self.navigationController?.popViewController(animated: true)
    }
}
extension AdsChildSubcategoryScreen : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Globals.sharedInstance.arrChildSubCategoryData.count > 0 {
            return Globals.sharedInstance.arrChildSubCategoryData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: AdsChildSubCategoryCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! AdsChildSubCategoryCell
         cell.selectionStyle = .none
        let objData = Globals.sharedInstance.arrChildSubCategoryData[indexPath.row]
        cell.lblCategoryName.text = objData.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objData = Globals.sharedInstance.arrChildSubCategoryData[indexPath.row]
        
        Globals.globalChildSubCategoryID = objData.id
        Globals.globalChildSubCategoryName = objData.name
        
        MoveToScreen(CategoryID: String(Globals.globalCategoryID))
    }
}
