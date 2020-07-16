//
//  HomeScreen.swift
//  Bazaraki
//
//  Created by suresh on 19/12/19.
//  Copyright © 2019 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import SDLoader
import Kingfisher
import Network

class HomeCategoryCollectionCell : UICollectionViewCell
{
    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var lblCategoryDetailName: UILabel!
}

@available(iOS 12.0, *)
class HomeScreen: BaseClass , UISearchBarDelegate {

    let objParser = Parser()
    var inSearchMode = false
    var arrNames : [String] = []
    var filteredData : [String] = []
    var filteredTableData = [String]()
    var CurrentPage = 1

    @IBOutlet weak var HeaderBar: UIView!
    @IBOutlet weak var lblAllCategories: UILabel!
    @IBOutlet weak var lblAllCategoriesNoOfAds: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var AllCategoriesViewHC: NSLayoutConstraint!

    override func viewWillAppear(_ animated: Bool)
    {
       self.tabBarController?.tabBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        sdLoader.startAnimating(atView: self.view)
        UserDefaults.standard.set("1", forKey: Constant.SESSION.CustomerID)
        InitUI()
    }
    
    func InitUI()
    {
        DispatchQueue.main.async {
            self.AllCategoriesViewHC.constant = 0
            self.setHeaderView(CustomView: self.HeaderBar)
            self.setRoundButtonOnView()
            self.localizationSetup()
        }
    
        
        Globals.sharedInstance.arrCategoryData.removeAll()
        if Globals.sharedInstance.arrCityData.count == 0
        {
            Globals.sharedInstance.arrBuildingType.removeAll()
            Globals.sharedInstance.cityID.removeAll()
            Globals.sharedInstance.cityName.removeAll()
            Globals.sharedInstance.cityDict.removeAll()
            objParser.getAllCity()
        }
        
        objParser.downloadDelegate = self
        objParser.getAllCategoriesAPI()
    }
    
    func localizationSetup()
    {
        searchBar.placeholder = Helper.search.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        tabBarController?.tabBar.items![0].title = Helper.tabHome.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        tabBarController?.tabBar.items![1].title = Helper.tabFavourites.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
        tabBarController?.tabBar.items![2].title = Helper.tabAdds.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
      {
         if (searchBar.text?.isEmpty)!
          {
              self.filteredData.removeAll()
              inSearchMode = false
              searchBar.text = ""
              view.endEditing(true)
             // tableView.reloadData()
          }
          else
          {
              inSearchMode = true
             // tableView.reloadData()
          }
      }
     
     
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
             let  char = text.cString(using: String.Encoding.utf8)!
             let isBackSpace = strcmp(char, "\\b")
             
             if !(isBackSpace == -92) {

                 inSearchMode = true
                filteredData = arrNames.filter({ (text) -> Bool in
                     let tmp:NSString = text as NSString
                  let range = tmp.range(of: searchBar.text!, options: NSString.CompareOptions.caseInsensitive)
                     return range.location != NSNotFound
                 })
               //  self.tableView.reloadData()
             }
             return true
         }
}

extension HomeScreen : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if Globals.sharedInstance.arrCategoryData.count > 0 {
            return Globals.sharedInstance.arrCategoryData.count
         }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! HomeCategoryCollectionCell
        
        let objData = Globals.sharedInstance.arrCategoryData[indexPath.row]
        cell.BGView.layer.borderWidth = 1
        cell.BGView.layer.borderColor = UIColor.lightGray.cgColor
        cell.BGView.layer.cornerRadius = 10
        
        cell.lblCategoryDetailName.numberOfLines = 0
        cell.lblCategoryDetailName.text = objData.name
        let url = URL(string: objData.imageURL)
        cell.imgCategory.kf.setImage(with: url)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        UserDefaults.standard.set("1", forKey: Constant.SESSION.SelectedPostAdsScreen)
        let objData = Globals.sharedInstance.arrCategoryData[indexPath.row]
        Globals.globalCategoryID = objData.id
        getPostAds(CategoryID: String(objData.id), SubCategoryID: "0", ChildSubCategoryID: "0", PageNo: String(CurrentPage))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let collectionVwWidth = UIScreen.main.bounds.width - 25
        return CGSize(width: (collectionVwWidth) / 3, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

extension HomeScreen : DownloadDelegate {
   
    func downloadCategoriesData(isCompleted: Bool) {
       
        if isCompleted
        {
            if Globals.sharedInstance.arrCategoryData.count > 0
            {
                collectionView.delegate = self
                collectionView.dataSource = self
                collectionView.reloadData()
                sdLoader.stopAnimation()
                /*arrNames.removeAll()
                filteredData.removeAll()
                for i in 0...Globals.sharedInstance.arrCategoryData.count - 1
                {
                    let objClub = Globals.sharedInstance.arrCategoryData[i]
                    arrNames.append(objClub.name!)
                }
                self.inSearchMode = false
                self.searchBar.delegate = self*/
            }
            else
            {
                // Empty Array
                sdLoader.stopAnimation()
            }
         }
        else
        {
            // Error
            sdLoader.stopAnimation()
        }
    }
    
    func downloadCityArrayCompleted(isCompleted: Bool) {
        
        if isCompleted
        {
            if Globals.sharedInstance.arrCityData.count > 0
            {
             //   sdLoader.stopAnimation()
            }
        }
        else
        {
            // Error
            sdLoader.stopAnimation()
        }
    }
}


