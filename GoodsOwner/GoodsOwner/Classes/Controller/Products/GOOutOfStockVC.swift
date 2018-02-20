//
//  GOOutOfStockVC.swift
//  GoodsOwner
//
//  Created by nabanita on 12/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOOutOfStockVC: GOBaseVC {
    
    let _cellReuseIdentifier = "GOProductCell"
    let _headerReuseIdentifier = "GOProductHeader"
    @IBOutlet weak var _collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _collectionView.register(UINib.init(nibName: _cellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: _cellReuseIdentifier)
        _collectionView.register(UINib.init(nibName: _headerReuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: _headerReuseIdentifier)
        let layout = _collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        let _ = self.navigationController?.popViewController(animated: true)
    }

}

extension GOOutOfStockVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = _collectionView.dequeueReusableCell(withReuseIdentifier: _cellReuseIdentifier, for: indexPath) as! GOProductCell
        cell.productsView.isHidden = true
        cell.deleteView.isHidden = true
        let prodNumber = indexPath.row + 1
        cell.column1Text.text = "\(prodNumber)"
        cell.column2Text.text = "Product \(prodNumber)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = Double(_collectionView.frame.width)
        let height = 50.0 //needs to be calculated.. product name can be long
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        let width = Double(_collectionView.frame.width)
        let height = 50.0
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = _collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: _headerReuseIdentifier, for: indexPath) as! GOProductHeader
            headerView.configureModifyProductsHeaderList()
            return headerView
            
        default:
            fatalError("Unexpected element kind")
        }
    }
}


