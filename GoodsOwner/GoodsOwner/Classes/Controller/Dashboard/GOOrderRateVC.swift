//
//  GOOrderRateVC.swift
//  GoodsOwner
//
//  Created by nabanita on 10/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOOrderRateVC: GOBaseVC {
    
    @IBOutlet weak var totalOrders: UILabel!
    @IBOutlet weak var acceptedOrders: UILabel!
    @IBOutlet weak var cancelledOrders: UILabel!
    @IBOutlet weak var totalRatings: UILabel!
    
    @IBOutlet weak var noOfFiveStars: UILabel!
    @IBOutlet weak var noOfFourStars: UILabel!
    @IBOutlet weak var noOfThreeStars: UILabel!
    @IBOutlet weak var noOfTwoStars: UILabel!
    @IBOutlet weak var noOfOneStars: UILabel!
    
    @IBOutlet var greenStars: [UIImageView]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setColorForTitleViews()
        for greenStar in greenStars{
            
            //let view = greenStar as! UIImageView
            //greenStar.backgroundColor = UIColor.colorForHex(GOColor.ThemeColor as NSString)
            greenStar.image = greenStar.image!.withRenderingMode(.alwaysTemplate)
            greenStar.tintColor = UIColor.colorForHex(GOColor.ThemeColor as NSString)
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButtonPressed(_ sender: UIButton){
        let tabBar = self.tabBarController as! GOTabBarController
        tabBar.openDrawer()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
