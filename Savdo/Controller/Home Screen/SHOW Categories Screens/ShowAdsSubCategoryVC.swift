//
//  ShowAdsSubCategoryVC.swift
//  Savdo
//
//  Created by My MAC on 12/3/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit
import SDLoader
import FTPopOverMenu_Swift


class ShowAdsSubCategoryVC: BaseClass {
    
    let objParser = Parser()
    var selectedLayout = 0
    var tblListHeight = 268
    var tblGridHeight = 268
    var selectedRowIndexList = -1
    var selectedRowIndexGrid = -1
    var arrCategoryMenu = [String]()
    var menuStyle : MenuStyle = .normal
    var menuOptionNameArray = ["Share", "Delete", "Upload", "Download"]
    
    @IBOutlet weak var HeaderBar: UIView!
    @IBOutlet weak var HeaderTittle: UILabel!
    @IBOutlet weak var lblCategoryCount: UILabel!
    @IBOutlet weak var ListView: UIView!
    @IBOutlet weak var GridView: UIView!
    @IBOutlet weak var ListTableView: UITableView!
    @IBOutlet weak var GridTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool)
    {
       sdLoader.startAnimating(atView: self.view)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ListView.isHidden = false
        selectedLayout = 0
        GridView.isHidden = true
        setCustomView(CustomView: HeaderBar, HeaderTittleColor: HeaderTittle)
        self.lblCategoryCount.text = "\(UserDefaults.standard.object(forKey: Constant.SESSION.TotalAdsCount) ?? 0) Объявления"
        
        arrCategoryMenu.removeAll()
        for i in 0...Globals.sharedInstance.arrChildSubCategoryData.count - 1
        {
            let objClub = Globals.sharedInstance.arrChildSubCategoryData[i]
            arrCategoryMenu.append(objClub.name!)
        }

        ListTableView.dataSource = self
        ListTableView.delegate = self
        ListTableView.reloadData()

    }
    
    func configWithMenuStyle() -> FTConfiguration {
        let config = FTConfiguration()
        switch self.menuStyle {
        case .normal:
            config.backgoundTintColor = UIColor.white
            config.borderColor = UIColor.lightGray
            config.menuWidth = 180
            config.menuSeparatorColor = UIColor.lightGray
            config.menuRowHeight = 40
            config.cornerRadius = 6
            config.textColor = UIColor.black
            config.textAlignment = NSTextAlignment.left
        case .wechat: break
        case .qq: break
        case .more: break
        }
        return config
    }
    
    @IBAction func btnChangeLayout(_ sender: UIButton)
    {
        FTPopOverMenu.showForSender(sender: sender, with: [Helper.listLayout.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),Helper.gridLayout.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)], menuImageArray: ["listview_grey.png","grid_grey.png"], config: self.configWithMenuStyle(), done: { (selectedIndex) -> () in
            
            if selectedIndex == 0
            {
                self.selectedLayout = 0
                self.ListView.isHidden = false
                self.GridView.isHidden = true
                self.ListTableView.dataSource = self
                self.ListTableView.delegate = self
                self.ListTableView.reloadData()
                
            }
            else
            {
                self.selectedLayout = 1
                self.ListView.isHidden = true
                self.GridView.isHidden = false
                self.GridTableView.dataSource = self
                self.GridTableView.delegate = self
                self.GridTableView.reloadData()
            }
        })
        {
            
        }
    }
    
    @IBAction func btnBack(_ sender: UIButton)
    {
        //self.navigationController?.popViewController(animated: true)
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "ShowAdsVC") as! ShowAdsVC
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
extension ShowAdsSubCategoryVC : UITableViewDataSource , UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if tableView == ListTableView
        {
            return 2
        }
        else if tableView == GridTableView
        {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == ListTableView
        {
            if indexPath.section == 0
            {
                if indexPath.row == selectedRowIndexList {
                    return CGFloat(tblListHeight) + 140
                }
                else
                {
                    return CGFloat(tblListHeight)
                }
            }
            else
            {
                return 177
            }
        }
        else if tableView == GridTableView
        {
            if indexPath.section == 0
            {
                if indexPath.row == selectedRowIndexGrid {
                    return CGFloat(tblGridHeight) + 140
                }
                else
                {
                    return 268
                }
            }
            else
            {
                return 600
            }
        }
        return 268
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        if tableView == ListTableView
        {
            if let lastVisibleIndexPath = tableView.indexPathsForVisibleRows?.last {
                if indexPath == lastVisibleIndexPath
                {
                    print("THIS IS LAST RECORD OF TABLEVIEW")
                    sdLoader.stopAnimation()
                }
            }
        }
        else
        {
            if let lastVisibleIndexPath = tableView.indexPathsForVisibleRows?.last {
                if indexPath == lastVisibleIndexPath
                {
                    sdLoader.stopAnimation()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == ListTableView
        {
            if section == 0
            {
                return 1
            }
            else if section == 1
            {
                if Globals.globalCategoryID == Constant.CategoryID.RealEstateID
                {
                    return Globals.sharedInstance.arrShowRealEstateAds.count
                }
                else if Globals.globalCategoryID == Constant.CategoryID.MotorsID
                {
                    return Globals.sharedInstance.arrShowMotorsAds.count
                }
                else if Globals.globalCategoryID == Constant.CategoryID.MarketID
                {
                    return Globals.sharedInstance.arrShowMarketAds.count
                }
                else if Globals.globalCategoryID == Constant.CategoryID.BuildingMaterialID
                {
                    return Globals.sharedInstance.arrShowBuildingAds.count
                }
                else if Globals.globalCategoryID == Constant.CategoryID.JobsID
                {
                    return Globals.sharedInstance.arrShowJobsAds.count
                }
                else if Globals.globalCategoryID == Constant.CategoryID.MobileCommunicationID
                {
                    return Globals.sharedInstance.arrShowMobileCommunicationAds.count
                }
                else if Globals.globalCategoryID == Constant.CategoryID.KidsID
                {
                    return Globals.sharedInstance.arrShowKidsAds.count
                }
                else if Globals.globalCategoryID == Constant.CategoryID.ElectronicsID
                {
                    return Globals.sharedInstance.arrShowElectronicsAds.count
                }
                return Globals.sharedInstance.arrShowCommonAds.count
            }
        }
        else if tableView == GridTableView
        {
            if section == 0
            {
                return 1
            }
            else if section == 1
            {
                return 1
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == ListTableView
        {
            if indexPath.section == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SCListTableViewCell1", for: indexPath) as! SCListTableViewCell1
                cell.selectionStyle = .none
                cell.configureList1(with: arrCategoryMenu)
                cell.btnExpandAll.tag = indexPath.row
                cell.btnExpandAll.addTarget(self, action: #selector(BtnPressedList), for: .touchUpInside)
                return cell
            }
            else if indexPath.section == 1
            {
                if Globals.globalCategoryID == Constant.CategoryID.RealEstateID
                {
                    let cell = ListTableView.dequeueReusableCell(withIdentifier: "SCListTableViewCell2", for: indexPath) as! SCListTableViewCell2
                    cell.selectionStyle = .none
                    let ObjModel = Globals.sharedInstance.arrShowRealEstateAds[indexPath.row]
                    cell.lblAdsTittle.text = ObjModel.title
                    let price = ObjModel.price!
                    cell.lblAdsPrice.text = "$ \(String(describing: price))"
                    cell.lblAdsDetail.text = ObjModel.description
                    cell.lblAdsAddress.text = ObjModel.city_name
                    cell.lblDate.text = ObjModel.date
                    let imageArray = ObjModel.image![0]
                    let url = URL(string: imageArray.image!)
                    cell.imgAdsImageView.kf.setImage(with: url)
                    cell.imgAdsImageView.contentMode = .scaleAspectFill
                    cell.imgAdsImageView?.setCategoryRoundedImageView()
                    return cell
                }
                else if Globals.globalCategoryID == Constant.CategoryID.MotorsID
                {
                    let cell = ListTableView.dequeueReusableCell(withIdentifier: "SCListTableViewCell2", for: indexPath) as! SCListTableViewCell2
                    cell.selectionStyle = .none
                    let ObjModel = Globals.sharedInstance.arrShowMotorsAds[indexPath.row]
                    cell.lblAdsTittle.text = ObjModel.title
                    let price = ObjModel.price!
                    cell.lblAdsPrice.text = "$ \(String(describing: price))"
                    cell.lblAdsDetail.text = ObjModel.description
                    cell.lblAdsAddress.text = ObjModel.city_name
                    cell.lblDate.text = ObjModel.date
                    let imageArray = ObjModel.image![0]
                    let url = URL(string: imageArray.image!)
                    print("MOTOR IMAGE URL",url!)
                    cell.imgAdsImageView.kf.setImage(with: url)
                    cell.imgAdsImageView.contentMode = .scaleAspectFill
                    cell.imgAdsImageView?.setCategoryRoundedImageView()
                    return cell
                }
                else if Globals.globalCategoryID == Constant.CategoryID.MarketID
                {
                    let cell = ListTableView.dequeueReusableCell(withIdentifier: "SCListTableViewCell2", for: indexPath) as! SCListTableViewCell2
                    cell.selectionStyle = .none
                    let ObjModel = Globals.sharedInstance.arrShowMarketAds[indexPath.row]
                    cell.lblAdsTittle.text = ObjModel.title
                    let price = ObjModel.price!
                    cell.lblAdsPrice.text = "$ \(String(describing: price))"
                    cell.lblAdsDetail.text = ObjModel.description
                    cell.lblAdsAddress.text = ObjModel.city_name
                    cell.lblDate.text = ObjModel.date
                    /* let imageArray = ObjModel.image![0]
                     let url = URL(string: imageArray.image!)
                     cell.imgAdsImageView.kf.setImage(with: url)
                     cell.imgAdsImageView.contentMode = .scaleAspectFill
                     cell.imgAdsImageView?.setCategoryRoundedImageView()*/
                    return cell
                }
                else if Globals.globalCategoryID == Constant.CategoryID.BuildingMaterialID
                {
                    let cell = ListTableView.dequeueReusableCell(withIdentifier: "SCListTableViewCell2", for: indexPath) as! SCListTableViewCell2
                    cell.selectionStyle = .none
                    let ObjModel = Globals.sharedInstance.arrShowBuildingAds[indexPath.row]
                    cell.lblAdsTittle.text = ObjModel.title
                    let price = ObjModel.price!
                    cell.lblAdsPrice.text = "$ \(String(describing: price))"
                    cell.lblAdsDetail.text = ObjModel.description
                    cell.lblAdsAddress.text = ObjModel.city_name
                    cell.lblDate.text = ObjModel.date
                    let imageArray = ObjModel.image![0]
                    let url = URL(string: imageArray.image!)
                    cell.imgAdsImageView.kf.setImage(with: url)
                    cell.imgAdsImageView.contentMode = .scaleAspectFill
                    cell.imgAdsImageView?.setCategoryRoundedImageView()
                    return cell
                }
                else if Globals.globalCategoryID == Constant.CategoryID.JobsID
                {
                    let cell = ListTableView.dequeueReusableCell(withIdentifier: "SCListTableViewCell2", for: indexPath) as! SCListTableViewCell2
                    cell.selectionStyle = .none
                    let ObjModel = Globals.sharedInstance.arrShowJobsAds[indexPath.row]
                    cell.lblAdsTittle.text = ObjModel.title
                    let price = ObjModel.price!
                    cell.lblAdsPrice.text = "$ \(String(describing: price))"
                    cell.lblAdsDetail.text = ObjModel.description
                    cell.lblAdsAddress.text = ObjModel.city_name
                    cell.lblDate.text = ObjModel.date
                    let imageArray = ObjModel.image![0]
                    let url = URL(string: imageArray.image!)
                    cell.imgAdsImageView.kf.setImage(with: url)
                    cell.imgAdsImageView.contentMode = .scaleAspectFill
                    cell.imgAdsImageView?.setCategoryRoundedImageView()
                    return cell
                }
                else if Globals.globalCategoryID == Constant.CategoryID.MobileCommunicationID
                {
                    let cell = ListTableView.dequeueReusableCell(withIdentifier: "SCListTableViewCell2", for: indexPath) as! SCListTableViewCell2
                    cell.selectionStyle = .none
                    let ObjModel = Globals.sharedInstance.arrShowMobileCommunicationAds[indexPath.row]
                    cell.lblAdsTittle.text = ObjModel.title
                    let price = ObjModel.price!
                    cell.lblAdsPrice.text = "$ \(String(describing: price))"
                    cell.lblAdsDetail.text = ObjModel.description
                    cell.lblAdsAddress.text = ObjModel.city_name
                    cell.lblDate.text = ObjModel.date
                    let imageArray = ObjModel.image![0]
                    let url = URL(string: imageArray.image!)
                    cell.imgAdsImageView.kf.setImage(with: url)
                    cell.imgAdsImageView.contentMode = .scaleAspectFill
                    cell.imgAdsImageView?.setCategoryRoundedImageView()
                    return cell
                }
                else if Globals.globalCategoryID == Constant.CategoryID.KidsID
                {
                    let cell = ListTableView.dequeueReusableCell(withIdentifier: "SCListTableViewCell2", for: indexPath) as! SCListTableViewCell2
                    cell.selectionStyle = .none
                    let ObjModel = Globals.sharedInstance.arrShowKidsAds[indexPath.row]
                    cell.lblAdsTittle.text = ObjModel.title
                    let price = ObjModel.price!
                    cell.lblAdsPrice.text = "$ \(String(describing: price))"
                    cell.lblAdsDetail.text = ObjModel.description
                    cell.lblAdsAddress.text = ObjModel.city_name
                    cell.lblDate.text = ObjModel.date
                    let imageArray = ObjModel.image![0]
                    let url = URL(string: imageArray.image!)
                    cell.imgAdsImageView.kf.setImage(with: url)
                    cell.imgAdsImageView.contentMode = .scaleAspectFill
                    cell.imgAdsImageView?.setCategoryRoundedImageView()
                    return cell
                }
                else if Globals.globalCategoryID == Constant.CategoryID.ClothsFootwearID
                {
                    let cell = ListTableView.dequeueReusableCell(withIdentifier: "SCListTableViewCell2", for: indexPath) as! SCListTableViewCell2
                    cell.selectionStyle = .none
                    let ObjModel = Globals.sharedInstance.arrShowKidsAds[indexPath.row]
                    cell.lblAdsTittle.text = ObjModel.title
                    let price = ObjModel.price!
                    cell.lblAdsPrice.text = "$ \(String(describing: price))"
                    cell.lblAdsDetail.text = ObjModel.description
                    cell.lblAdsAddress.text = ObjModel.city_name
                    cell.lblDate.text = ObjModel.date
                    let imageArray = ObjModel.image![0]
                    let url = URL(string: imageArray.image!)
                    cell.imgAdsImageView.kf.setImage(with: url)
                    cell.imgAdsImageView.contentMode = .scaleAspectFill
                    cell.imgAdsImageView?.setCategoryRoundedImageView()
                    return cell
                }
                else if Globals.globalCategoryID == Constant.CategoryID.ElectronicsID
                {
                    let cell = ListTableView.dequeueReusableCell(withIdentifier: "SCListTableViewCell2", for: indexPath) as! SCListTableViewCell2
                    cell.selectionStyle = .none
                    let ObjModel = Globals.sharedInstance.arrShowElectronicsAds[indexPath.row]
                    cell.lblAdsTittle.text = ObjModel.title
                    let price = ObjModel.price!
                    cell.lblAdsPrice.text = "$ \(String(describing: price))"
                    cell.lblAdsDetail.text = ObjModel.description
                    cell.lblAdsAddress.text = ObjModel.city_name
                    cell.lblDate.text = ObjModel.date
                    let imageArray = ObjModel.image![0]
                    let url = URL(string: imageArray.image!)
                    cell.imgAdsImageView.kf.setImage(with: url)
                    cell.imgAdsImageView.contentMode = .scaleAspectFill
                    cell.imgAdsImageView?.setCategoryRoundedImageView()
                    return cell
                }
                else
                {
                    let cell = ListTableView.dequeueReusableCell(withIdentifier: "SCListTableViewCell2", for: indexPath) as! SCListTableViewCell2
                    cell.selectionStyle = .none
                    let ObjModel = Globals.sharedInstance.arrShowCommonAds[indexPath.row]
                    cell.lblAdsTittle.text = ObjModel.title
                    let price = ObjModel.price!
                    cell.lblAdsPrice.text = "$ \(String(describing: price))"
                    cell.lblAdsDetail.text = ObjModel.description
                    cell.lblAdsAddress.text = ObjModel.city_name
                    cell.lblDate.text = ObjModel.date
                    let imageArray = ObjModel.image![0]
                    let url = URL(string: imageArray.image!)
                    cell.imgAdsImageView.kf.setImage(with: url)
                    cell.imgAdsImageView.contentMode = .scaleAspectFill
                    cell.imgAdsImageView?.setCategoryRoundedImageView()
                    return cell
                }
            }
        }
        else
        {
            if indexPath.section == 0
            {
                let cell = GridTableView.dequeueReusableCell(withIdentifier: "GridTableViewCell3", for: indexPath) as! GridTableViewCell3
                cell.selectionStyle = .none
                cell.configureGrid1(with: arrCategoryMenu)
                cell.btnExpandAll.tag = indexPath.row
                cell.btnExpandAll.addTarget(self, action: #selector(BtnPressedGrid), for: .touchUpInside)
                
                return cell
            }
                
            else if indexPath.section == 1
            {
                let cell = GridTableView.dequeueReusableCell(withIdentifier: "GridTableViewCell4", for: indexPath) as! GridTableViewCell4
                cell.configureGrid2(with: ["1"])
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    @objc func BtnPressedGrid(sender: UIButton)
    {
        let indexpath = IndexPath(row: 0, section: 0)
        let cell = GridTableView.cellForRow(at: indexpath) as! GridTableViewCell3
        tblGridHeight = Int(cell.GridCollectionView1.contentSize.height)
        
        if self.selectedRowIndexGrid != -1 {
            tblGridHeight = 268
            cell.btnExpandAll.setTitle(Helper.btnhideall.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),for: .normal)
        }
        
        if selectedRowIndexGrid != sender.tag {
            cell.btnExpandAll.setTitle(Helper.btnhideall.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),for: .normal)
            self.selectedRowIndexGrid = sender.tag
            cell.configureGrid1(with: arrCategoryMenu)
        }
        else
        {
            self.selectedRowIndexGrid = -1
            tblGridHeight = 268
            cell.btnExpandAll.setTitle(Helper.btnshowall.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),for: .normal)
        }
        self.GridTableView.beginUpdates()
        self.GridTableView.endUpdates()
    }
    
    @objc func BtnPressedList(sender: UIButton){
        
        let indexpath = IndexPath(row: 0, section: 0)
        let cell = ListTableView.cellForRow(at: indexpath) as! SCListTableViewCell1
        tblListHeight = Int(cell.collectionView1.contentSize.height)
        
        if self.selectedRowIndexList != -1 {
            tblListHeight = 268
            cell.btnExpandAll.setTitle(Helper.btnhideall.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),for: .normal)
        }
        
        if selectedRowIndexList != sender.tag {
            cell.btnExpandAll.setTitle(Helper.btnhideall.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),for: .normal)
            self.selectedRowIndexList = sender.tag
            cell.configureList1(with: arrCategoryMenu)
        }
        else
        {
            self.selectedRowIndexList = -1
            tblListHeight = 268
            cell.btnExpandAll.setTitle(Helper.btnshowall.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!),for: .normal)
        }
        self.ListTableView.beginUpdates()
        self.ListTableView.endUpdates()
    }
}
extension ShowAdsSubCategoryVC : DownloadDelegate {
    
    func downloadSubCategoriesData(isCompleted: Bool) {
        
        if isCompleted
        {
            if Globals.sharedInstance.arrSubCategoryData.count > 0
            {
                if ListView.isHidden == false
                {
                    print("LIST LAYOUT")
                    arrCategoryMenu.removeAll()
                    for i in 0...Globals.sharedInstance.arrSubCategoryData.count - 1
                    {
                        let objClub = Globals.sharedInstance.arrSubCategoryData[i]
                        arrCategoryMenu.append(objClub.name!)
                    }
                    ListTableView.dataSource = self
                    ListTableView.delegate = self
                    ListTableView.reloadData()
                    // sdLoader.stopAnimation()
                }
                else
                {
                    arrCategoryMenu.removeAll()
                    for i in 0...Globals.sharedInstance.arrSubCategoryData.count - 1
                    {
                        let objClub = Globals.sharedInstance.arrSubCategoryData[i]
                        arrCategoryMenu.append(objClub.name!)
                    }
                    GridTableView.dataSource = self
                    GridTableView.delegate = self
                    GridTableView.reloadData()
                    // sdLoader.stopAnimation()
                }
                
                
            }
            else
            {
                //sdLoader.stopAnimation()
            }
        }
        else
        {
            // Error
            // sdLoader.stopAnimation()
        }
    }
}


// CUSTOM CELL IMPLEMENTATION

class SCListTableViewCell1 : UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var btnExpandAll: UIButton!
    
    var array1 = [String]()

    func configureList1(with arr1 : [String]) {
        self.array1 = arr1
        
        collectionView1.dataSource = self
        collectionView1.delegate = self
        collectionView1.reloadData()
        collectionView1.layoutIfNeeded()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
       return Globals.sharedInstance.arrChildSubCategoryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView1.dequeueReusableCell(withReuseIdentifier: "SCListCollectionCell1", for: indexPath as IndexPath) as! SCListCollectionCell1
        
        let ObjModel = Globals.sharedInstance.arrChildSubCategoryData[indexPath.row]
        cell.lblCategoryDetailName.text = ObjModel.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print("You selected table zero cell #\(indexPath.item)!")
        
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "ShowAdsDescriptionVC") as! ShowAdsDescriptionVC
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let collectionVwWidth = UIScreen.main.bounds.width - 30
        return CGSize(width: (collectionVwWidth) / 2, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
    }
}

class SCListCollectionCell1 : UICollectionViewCell
{
    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var lblCategoryDetailName: UILabel!
}

class SCListTableViewCell2 : UITableViewCell
{
    @IBOutlet weak var tblBGView: UIView!
    @IBOutlet weak var imgAdsImageView: UIImageView!
    @IBOutlet weak var lblAdsTittle: UILabel!
    @IBOutlet weak var lblAdsPrice: UILabel!
    @IBOutlet weak var lblAdsDetail: UILabel!
    @IBOutlet weak var lblAdsAddress: UILabel!
    @IBOutlet weak var lblDate: UILabel!
}


// 2. For Grid Views
class SCGridTableViewCell3 : UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var GridCollectionView1: UICollectionView!
    @IBOutlet weak var btnExpandAll: UIButton!
    
    var array1 = [String]()

    func configureGrid1(with arr1 : [String]) {
        self.array1 = arr1
        
        GridCollectionView1.dataSource = self
        GridCollectionView1.delegate = self
        GridCollectionView1.reloadData()
        GridCollectionView1.layoutIfNeeded()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
       return self.array1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = GridCollectionView1.dequeueReusableCell(withReuseIdentifier: "SCGridCollectionCell1", for: indexPath as IndexPath) as! SCGridCollectionCell1
        
        cell.lblCategoryDetailName.text = self.array1[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print("You selected table zero cell #\(indexPath.item)!")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let collectionVwWidth = UIScreen.main.bounds.width - 30
        return CGSize(width: (collectionVwWidth) / 2, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
    }
}
class SCGridCollectionCell1 : UICollectionViewCell
{
    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var lblCategoryDetailName: UILabel!
}


class SCGridTableViewCell4 : UITableViewCell , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var GridCollectionView2: UICollectionView!
    @IBOutlet weak var GridCollectionView2HC: NSLayoutConstraint!
    var array2 = [String]()
    private var lastContentOffset: CGFloat = 0

    func configureGrid2(with arr2 : [String]) {
        self.array2 = arr2

        GridCollectionView2.dataSource = self
        GridCollectionView2.delegate = self
        GridCollectionView2.reloadData()
        GridCollectionView2HC.constant = GridCollectionView2.contentSize.height + 100
        GridCollectionView2.layoutIfNeeded()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if Globals.globalCategoryID == Constant.CategoryID.RealEstateID
        {
            return Globals.sharedInstance.arrShowRealEstateAds.count
        }
        else if Globals.globalCategoryID == Constant.CategoryID.MotorsID
        {
            return Globals.sharedInstance.arrShowMotorsAds.count
        }
        else if Globals.globalCategoryID == Constant.CategoryID.MarketID
        {
            return Globals.sharedInstance.arrShowMarketAds.count
        }
        else if Globals.globalCategoryID == Constant.CategoryID.BuildingMaterialID
        {
            return Globals.sharedInstance.arrShowBuildingAds.count
        }
        else if Globals.globalCategoryID == Constant.CategoryID.JobsID
        {
            return Globals.sharedInstance.arrShowJobsAds.count
        }
        else if Globals.globalCategoryID == Constant.CategoryID.MobileCommunicationID
        {
            return Globals.sharedInstance.arrShowMobileCommunicationAds.count
        }
        else if Globals.globalCategoryID == Constant.CategoryID.KidsID
        {
            return Globals.sharedInstance.arrShowKidsAds.count
        }
        else if Globals.globalCategoryID == Constant.CategoryID.ElectronicsID
        {
            return Globals.sharedInstance.arrShowElectronicsAds.count
        }
        return Globals.sharedInstance.arrShowCommonAds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = GridCollectionView2.dequeueReusableCell(withReuseIdentifier: "SCGridCollectionCell2", for: indexPath as IndexPath) as! SCGridCollectionCell2
        
        cell.contentView.layer.cornerRadius = 5
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.darkGray.cgColor
        
        let ObjModel = Globals.sharedInstance.arrShowRealEstateAds[indexPath.row]
        cell.lblAdsTittle.text = ObjModel.title
        let price = ObjModel.price!
        cell.lblAdsPrice.text = "$ \(String(describing: price))"
        cell.lblAdsDetail.text = ObjModel.description
        cell.lblAdsAddress.text = ObjModel.city_name
        cell.lblDate.text = ObjModel.date
        let imageArray = ObjModel.image![0]
        let url = URL(string: imageArray.image!)
        cell.imgAdsImageView.kf.setImage(with: url)
        cell.imgAdsImageView.contentMode = .scaleAspectFill
        cell.imgAdsImageView?.setCategoryRoundedImageView()

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print("You selected table zero cell #\(indexPath.item)!")
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let collectionVwWidth = UIScreen.main.bounds.width - 20
        return CGSize(width: (collectionVwWidth) / 2, height: 210)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
    }
}

class SCGridCollectionCell2 : UICollectionViewCell
{
    @IBOutlet weak var tblBGView: UIView!
    @IBOutlet weak var imgAdsImageView: UIImageView!
    @IBOutlet weak var lblAdsTittle: UILabel!
    @IBOutlet weak var lblAdsPrice: UILabel!
    @IBOutlet weak var lblAdsDetail: UILabel!
    @IBOutlet weak var lblAdsAddress: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var btnFavoriteOutlet: UIButton!
}
