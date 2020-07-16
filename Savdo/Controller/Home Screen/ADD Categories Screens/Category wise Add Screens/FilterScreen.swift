//
//  FilterScreen.swift
//  Bazaraki
//
//  Created by suresh on 27/12/19.
//  Copyright © 2019 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit

class FilterScreen: BaseClass {

    @IBOutlet weak var HeaderBar: UIView!

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // setCustomView(CustomView: HeaderBar, HeaderTittleColor: HeaderTittle)
    }
    @IBAction func btnBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
