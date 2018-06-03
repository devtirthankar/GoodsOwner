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
    var orderList = [Order]()
    lazy var _refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        return refreshControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _tableView.register(UINib.init(nibName: _cellReuseIdentifier, bundle: nil), forCellReuseIdentifier: _cellReuseIdentifier)
        //_collectionView.register(UINib.init(nibName: _cellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: _cellReuseIdentifier)
        
        setColorForTitleViews()
        _tableView.dataSource = self
        _tableView.delegate = self
        fetchOrderList()
        _tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        _tableView.alwaysBounceVertical = true

        _refreshControl.addTarget(self, action:#selector(fetchOrderList), for:UIControlEvents.valueChanged)
        _tableView.addSubview(_refreshControl)
    }

    @IBAction func menuButtonPressed(_ sender: UIButton){
        let tabBar = self.tabBarController as! GOTabBarController
        tabBar.openDrawer()
    }
    
    @objc func fetchOrderList() {
        GOAlertAndLoader.showLoading()
        GOWebServiceManager.sharedManager.getOrderList(block : {[weak self](response, error) in
            DispatchQueue.main.async {
                GOAlertAndLoader.hideLoading()
                self?._refreshControl.endRefreshing()
                guard let data = response as? Data else {
                    print("No product data")
                    return
                }
                
                guard let orders = try? JSONDecoder().decode(Orders.self, from: data ) else {
                    print("Error: Couldn't decode data into Products")
                    return
                }
                for item in orders.result {
                    self?.orderList.append(item)
                }
                self?._tableView.reloadData()
            }
        })
    }

}

class GOOrderReceivedTableCell1: UITableViewCell{
    @IBOutlet weak var orderNumberLabel: UILabel!
}

extension GOOrderReceivedVC: UITableViewDataSource, UITableViewDelegate{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return orderList.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let order: Order = orderList[indexPath.row]
        let cell: GOOrderReceivedTableCell = _tableView.dequeueReusableCell(withIdentifier: _cellReuseIdentifier) as! GOOrderReceivedTableCell
        cell.orderNumber.text = NSLocalizedString("Order Number: #\(String(describing: order.orderid))", comment: "")
        if let userinfo = order.userinfo {
            cell.userPhone.text = userinfo.mobile ?? ""
        }
        cell.productName.text = order.product.productname
        cell.quantity.text = NSLocalizedString("Quantity: \(String(describing: order.quantity!))", comment: "")
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GOOrderDetailsVC") as! GOOrderDetailsVC
        controller.order = orderList[indexPath.row]
        controller.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
