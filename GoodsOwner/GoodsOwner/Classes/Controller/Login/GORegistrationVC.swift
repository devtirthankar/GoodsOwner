//
//  GORegistrationVC.swift
//  GoodsOwner
//
//  Created by nabanita on 09/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit



class GORegistrationVC: GOBaseVC {
    
    let cellReuseIdentifier = "GORegistrationCell"
    @IBOutlet weak var _tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _tableView.register(UINib.init(nibName: "GORegistrationCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        _tableView.tableFooterView = UIView.init(frame: CGRect.zero)

    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension GORegistrationVC: UITableViewDelegate, UITableViewDataSource{
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 1
        case 3:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:GORegistrationCell = _tableView?.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! GORegistrationCell
        print("indexpath.row = \(indexPath.row)")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44//(_tableView?.frame.height)! / CGFloat(_tableContentArray.count)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        if section == 0{
            return 0
        }
        return 48
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?  {
        let headerView = UINib(nibName: "GORegistrationHeader", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! GORegistrationHeader
        switch section {
        case 1:
            headerView.titleLabel?.text = "Contact information"
        case 2:
            headerView.titleLabel?.text = "Store category"
        case 3:
            headerView.titleLabel?.text = "Location"
        default:
            headerView.titleLabel?.text = ""
        }
        return headerView
    }
}
