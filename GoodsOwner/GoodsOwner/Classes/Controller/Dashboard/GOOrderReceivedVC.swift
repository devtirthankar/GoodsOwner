//
//  GOOrderReceivedVC.swift
//  GoodsOwner
//
//  Created by nabanita on 10/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOOrderReceivedVC: GOBaseVC {
    
    let _cellReuseIdentifier = "GOOrderReceivedTableCell"
    @IBOutlet weak var _tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _tableView.dataSource = self
        _tableView.delegate = self
        _tableView.reloadData()
        _tableView.tableFooterView = UIView.init(frame: CGRect.zero)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButtonPressed(_ sender: UIButton){
        let tabBar = self.tabBarController as! GOTabBarController
        tabBar.openDrawer()
    }

}

class GOOrderReceivedTableCell: UITableViewCell{
    @IBOutlet weak var orderNumberLabel: UILabel!
}

extension GOOrderReceivedVC: UITableViewDataSource, UITableViewDelegate{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: GOOrderReceivedTableCell = _tableView.dequeueReusableCell(withIdentifier: _cellReuseIdentifier) as! GOOrderReceivedTableCell
        let orderNumber = Int(indexPath.row + 1)
        cell.orderNumberLabel.text = "Order \(orderNumber)"
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GOOrderDetailsVC") as! GOOrderDetailsVC
        controller.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
