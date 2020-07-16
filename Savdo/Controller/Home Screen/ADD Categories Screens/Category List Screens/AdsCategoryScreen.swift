//
//  AdsCategoryScreen.swift
//  Savdo
//
//  Created by My MAC on 22/1/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import SDLoader

class AdsCategoryCell : UITableViewCell
{
    @IBOutlet weak var tblBGView: UIView!
    @IBOutlet weak var lblCategoryName: UILabel!
}

class AdsCategoryScreen: BaseClass {

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
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func btnBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
extension AdsCategoryScreen : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Globals.sharedInstance.arrCategoryData.count > 0 {
            return Globals.sharedInstance.arrCategoryData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: AdsCategoryCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! AdsCategoryCell
        
         let objData = Globals.sharedInstance.arrCategoryData[indexPath.row]
         cell.lblCategoryName.numberOfLines = 2
         cell.lblCategoryName.text = objData.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objData = Globals.sharedInstance.arrCategoryData[indexPath.row]
        Globals.globalCategoryID = objData.id
        Globals.globalCategoryName = objData.name
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: Constant.STORYBOARD.CLASS_NAME.AdsSubCategoryScreen) as! AdsSubCategoryScreen
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
