//
//  GOOrderDetailsVC.swift
//  GoodsOwner
//
//  Created by nabanita on 12/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOOrderDetailsVC: GOBaseVC {

    let _cellReuseIdentifier = "GOOrderDetailsCell"
    let _headerReuseIdentifier = "GOOrderDetailsHeader"
    @IBOutlet weak var _collectionView: UICollectionView!
    @IBOutlet weak var _pageHeader: UILabel!
    @IBOutlet weak var _totalPrice: UILabel!
    var order: Order! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColorForTitleViews()

        // Do any additional setup after loading the view.
        
        _collectionView.register(UINib.init(nibName: _cellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: _cellReuseIdentifier)
        _collectionView.register(UINib.init(nibName: _headerReuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: _headerReuseIdentifier)
        let layout = _collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
        _pageHeader.text = "Order# \(order.orderid)"
        updateTotalPrice()
    }
    
    func updateTotalPrice() {
        let totalprice = Float((Float32(order.quantity!) * order.product.price!) * 1.05)
        _totalPrice.text = "\(totalprice)"
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }

}

extension GOOrderDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let product: Product = order.product
        let cell = _collectionView.dequeueReusableCell(withReuseIdentifier: _cellReuseIdentifier, for: indexPath) as! GOOrderDetailsCell
        let serialNo = indexPath.row + 1
        cell._serialNo.text = "\(serialNo)"
        cell._productNo.text = "\(product.productid)"
        cell._productName.text = "\((product.productname)!)"
        cell._quantity.text = "\((order.quantity)!)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = Double(_collectionView.frame.width)
        let height = 44.0 //needs to be calculated.. product name can be long
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        let width = Double(_collectionView.frame.width)
        let height = 44.0 
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = _collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: _headerReuseIdentifier, for: indexPath)
            return headerView
            
        default:
            fatalError("Unexpected element kind")
        }
    }
}
