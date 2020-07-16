//
//  ShowAdsDescriptionVC.swift
//  Savdo
//
//  Created by My MAC on 14/3/20.
//  Copyright © 2020 Bhavi Technologies Pvt Ltd. All rights reserved.
//

import UIKit

class ShowAdsDescriptionVC: BaseClass , UIScrollViewDelegate{

    
    let imagelist:[UIImage] = [#imageLiteral(resourceName: "s1.jpg"),#imageLiteral(resourceName: "s2.jpg"),#imageLiteral(resourceName: "s3.jpg"),#imageLiteral(resourceName: "s4.jpg"),#imageLiteral(resourceName: "s5.jpg")] // Image Array for slider
    var vwScroll = UIScrollView()
    var yPosition:CGFloat = 0
    var scrollViewContentSize:CGFloat=0;
    
    @IBOutlet weak var vwImages:UIView!
    @IBOutlet weak var pgCon: UIPageControl!
    @IBOutlet weak var HeaderBar: UIView!
    @IBOutlet weak var HeaderTittle: UILabel!

    let simpleClosure = {
        print("Hello, World!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // setCustomView(CustomView: HeaderBar, HeaderTittleColor: HeaderTittle)

       initSlider()
       // getProductDetail(ID: "1", ViewCount: "1", DeviceID: "123-123-123")

        
    }

   
    @IBAction func btnBack(_ sender: UIButton)
    {
        
        if Globals.sharedInstance.arrChildSubCategoryData.count > 0
        {
            let story = UIStoryboard(name: "Main", bundle:nil)
            let vc = story.instantiateViewController(withIdentifier: "ShowAdsSubCategoryVC") as! ShowAdsSubCategoryVC
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()

        }
        else
        {
            let story = UIStoryboard(name: "Main", bundle:nil)
            let vc = story.instantiateViewController(withIdentifier: "ShowAdsVC") as! ShowAdsVC
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()

        }
    }
    
    func initSlider()
    {
        vwScroll = UIScrollView(frame: CGRect(x: self.vwImages.frame.origin.x, y: self.vwImages.frame.origin.y, width: self.vwImages.frame.width, height: self.vwImages.frame.height))
        configurePageControl()
        vwScroll.delegate = self
        vwScroll.showsVerticalScrollIndicator = false
        self.vwImages.addSubview(vwScroll)
        for  i in stride(from: 0, to: imagelist.count, by: 1) {
            var frame = CGRect.zero
            frame.origin.x = self.vwScroll.frame.size.width * CGFloat(i)
            frame.origin.y = 0
            frame.size = self.vwScroll.frame.size
            self.vwScroll.isPagingEnabled = true
            let myImage = imagelist[i]
            let myImageView:UIImageView = UIImageView()
            myImageView.image = myImage
            myImageView.contentMode = UIView.ContentMode.scaleAspectFit
            myImageView.frame = frame
            vwScroll.addSubview(myImageView)
            myImageView.addSubview(pgCon)
        }
        
        self.vwScroll.contentSize = CGSize(width: self.vwScroll.frame.size.width * CGFloat(imagelist.count), height: self.vwScroll.frame.size.height)
        pgCon.addTarget(self, action: Selector(("changePage:")), for: UIControl.Event.valueChanged)
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pgCon.numberOfPages = imagelist.count
        self.pgCon.currentPage = 0
        self.pgCon.tintColor = UIColor.red
        self.pgCon.pageIndicatorTintColor = UIColor.black
        self.pgCon.currentPageIndicatorTintColor = UIColor.orange
      //  self.pgCon.frame = CGRect(x: self.vwImages.frame.origin.x / 2, y: self.vwImages.frame.origin.y - 30, width: 220, height: 50)
     //   self.vwImages.addSubview(pgCon)
    }

    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pgCon.currentPage) * vwScroll.frame.size.width
        vwScroll.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pgCon.currentPage = Int(pageNumber)
    }
}
