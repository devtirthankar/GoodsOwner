//
//  GORegistrationVC.swift
//  GoodsOwner
//
//  Created by nabanita on 09/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GORegistrationVC: GOBaseVC, GODropDownViewDelegate {
    @IBOutlet weak var _registrationBtton: UIButton!
    @IBOutlet weak var _name: UITextField!
    @IBOutlet weak var _email: UITextField!
    @IBOutlet weak var _password: UITextField!
    @IBOutlet weak var _confirmPassword: UITextField!
    @IBOutlet weak var _phone: UITextField!
    @IBOutlet weak var _countryCode: UITextField!
    var _categoryView : GODropDownView!
    var _transparentView : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setColorForTitleViews()
        // Do any additional setup after loading the view.

    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GORegistrationIntermediateVC")
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
    @IBAction func categoryButtonPressed(_ sender: UIButton) {
        
        _transparentView = UIView();
        _transparentView.backgroundColor = UIColor.black;
        _transparentView.alpha = 0.6
        _transparentView.frame = self.view.frame
        
        self.view.addSubview(_transparentView)
        
        _categoryView = UINib(nibName: "GODropDownView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! GODropDownView
        _categoryView.delegate = self
        
        _categoryView.bounds.size.width = self.view.bounds.size.width
        _categoryView.bounds.size.height = 287
        _categoryView.frame.origin = CGPoint.init(x: 0, y: self.view.bounds.size.height - 287)
        _categoryView.pickerDataSource = ["SA +966"]
        
        self.view.addSubview(_categoryView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: GODropDownViewDelegate
    func donePressed() {
        
        if _transparentView != nil {
            _transparentView.removeFromSuperview()
            _transparentView = nil
        }
        
        if _categoryView  != nil {
            _categoryView.removeFromSuperview()
            _categoryView = nil
        }
    }
}

