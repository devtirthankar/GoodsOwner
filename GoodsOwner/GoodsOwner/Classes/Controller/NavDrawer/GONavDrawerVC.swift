//
//  GONavDrawerVC.swift
//  Goods
//
//  Created by Nabanita on 09/12/17.
//  Copyright © 2017 company. All rights reserved.
//

import UIKit


class GONavDrawerItemCell: UITableViewCell {
    @IBOutlet weak var _titleLabel: UILabel!
}

enum NavDrawerItemType {
    //case home
    case products
    case profile
    case settings
    case logout
}

protocol GONavDrawerDelegate {
    func didSelectCloseDrawer()
    func didSelectItemType (_ type: NavDrawerItemType)
}
class GONavDrawerVC: GOBaseVC, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var _tableView: UITableView!
    var delegate: GONavDrawerDelegate?
    let _cellReuseIdentifier = "GONavDrawerItemCell"
    let _cellTitles = ["Products", "Profile", "Settings", "Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setColorForTitleViews()
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(backPressed))
        swipeGestureRecognizer.direction = .left
        _tableView.addGestureRecognizer(swipeGestureRecognizer)
        _tableView.dataSource = self
        _tableView.delegate = self
        _tableView.reloadData()
    }
    
    @objc func backPressed() {
        self.delegate?.didSelectCloseDrawer()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return _cellTitles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: GONavDrawerItemCell = _tableView.dequeueReusableCell(withIdentifier: _cellReuseIdentifier) as! GONavDrawerItemCell
        cell._titleLabel.text = _cellTitles[indexPath.row]
        cell._titleLabel.textColor = UIColor.colorForHex(GOColor.ThemeColor as NSString)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row == 0 {
            self.delegate?.didSelectItemType(.products)
        }
        else if indexPath.row == 1 {
            self.delegate?.didSelectItemType(.profile)
        }
        else if indexPath.row == 2 {
            self.delegate?.didSelectItemType(.settings)
        }
        else {
            self.delegate?.didSelectItemType(.logout)
        }
    }
}

