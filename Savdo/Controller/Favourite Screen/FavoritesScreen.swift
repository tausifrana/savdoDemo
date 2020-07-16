//
//  FavoritesScreen.swift
//  Bazaraki
//
//  Created by suresh on 19/12/19.
//  Copyright © 2019 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit

class FavoritesScreen: BaseClass {

    @IBOutlet weak var HeaderBar: UIView!
    
    @IBOutlet weak var segmentView: UIView!
    @IBOutlet weak var segmentControl: DGKSegmentControl!
    
    @IBOutlet weak var lblNoAdsAlert: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewWillAppear(_ animated: Bool)
    {
       self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        HeaderBar.backgroundColor = UIColor.white
        setHeaderView(CustomView: HeaderBar)

        localizationSetup()
        segmentControl.clipsToBounds = true
        segmentControl.layer.cornerRadius = 5
        segmentControl.layer.borderWidth = 1
        segmentControl.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func localizationSetup()
    {
        searchBar.placeholder = Helper.search.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)

        tabBarController?.tabBar.items![1].title = Helper.tabFavourites.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)

        segmentControl.titles = [Helper.favoriteads.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!), Helper.savedsearch.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)]

        lblNoAdsAlert.text = Helper.youdonotaddads.localized(UserDefaults.standard.string(forKey: Constant.SESSION.APPLANGUAGES)!)

    }
    

    @IBAction func segmentDidChanged(_ sender: DGKSegmentControl) {
           //self.lbl.text = sender.titles[sender.selectedIndex]           
           print(sender.selectedTitle)
           
       }
}
