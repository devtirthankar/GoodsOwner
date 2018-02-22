//
//  GOProfileReviewVC.swift
//  GoodsOwner
//
//  Created by nabanita on 20/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOProfileReviewVC: GOBaseVC {
    
    @IBOutlet weak var _collectionView: UICollectionView!
    let cellStoreIdentifier = "GOProfileReviewCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _collectionView.register(UINib.init(nibName: cellStoreIdentifier, bundle: nil), forCellWithReuseIdentifier: cellStoreIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Review View Controller Will Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Review View Controller Will Disappear")
    }
}

extension GOProfileReviewVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell: GOProfileReviewCell = _collectionView.dequeueReusableCell(withReuseIdentifier: cellStoreIdentifier, for: indexPath) as! GOProfileReviewCell
            
            cell.commentLabel.text = "Review \(indexPath.row + 1)"//descriptions[indexPath.row]
            return cell;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /*
        if let cell = GOProfileReviewCell.fromNib() {
                
                let preferredSize = cell.preferredLayoutSizeFittingWidth(targetWidth: _collectionView.frame.size.width - 6)
                return preferredSize
        }*/
        return CGSize.init(width: _collectionView.frame.size.width, height: CGFloat(140.0))//CGSize.zero
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let edgeInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        return edgeInset
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 3
    }
    
}
