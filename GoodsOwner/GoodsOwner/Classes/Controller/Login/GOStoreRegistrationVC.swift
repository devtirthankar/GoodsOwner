//
//  GOStoreRegistrationVC.swift
//  GoodsOwner
//
//  Created by nabanita on 16/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOStoreRegistrationVC: GOBaseVC, GODropDownViewDelegate, GOStoreRegistrationVMDelegate {
    
    @IBOutlet weak var checkBoxImage: UIImageView!
    @IBOutlet weak var storeName: UITextField!
    @IBOutlet weak var storeNameArabic: UITextField!
    @IBOutlet weak var registrationCertificate: UITextField!
    @IBOutlet weak var storeCategory: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var address: UITextField!
    
    var _categoryView : GODropDownView!
    var _transparentView : UIView!
    var storeRegistrationViewModel: GOStoreRegistrationVM = GOStoreRegistrationVM()
    var categoryList = [String]()
    var countryList = [String]()
    var cityList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setColorForTitleViews()
        initialSetup()
    }
    
    func initialSetup() {
        address.layer.cornerRadius = 5.0
        address.layer.borderColor = UIColor.colorForHex(GOColor.ThemeColor as NSString).cgColor
        address.layer.borderWidth = 0.5
        storeRegistrationViewModel.delegate = self
        storeRegistrationViewModel.fetchStoreCategories()
        storeRegistrationViewModel.fetchCountryList()
        storeRegistrationViewModel.fetchCityList(country: "SAUDI")
    }
    
    func addPickerViewLayer() {
        _transparentView = UIView();
        _transparentView.backgroundColor = UIColor.black;
        _transparentView.alpha = 0.6
        _transparentView.frame = self.view.frame
        
        _categoryView = UINib(nibName: "GODropDownView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! GODropDownView
        _categoryView.delegate = self
        _categoryView.bounds.size.width = self.view.bounds.size.width
        _categoryView.bounds.size.height = 287
        _categoryView.frame.origin = CGPoint.init(x: 0, y: self.view.bounds.size.height - 287)
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GOTabBarController")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func storeCategoryButtonPressed(_ sender: UIButton) {
        addPickerViewLayer()
        self.view.addSubview(_transparentView)
        _categoryView._headerTitle.text = GOMessage.selectStoreCetegory
        _categoryView.pickerDataSource = categoryList
        self.view.addSubview(_categoryView)
    }
    
    @IBAction func countryButtonPressed(_ sender: UIButton) {
        addPickerViewLayer()
        self.view.addSubview(_transparentView)
        _categoryView._headerTitle.text = GOMessage.selectCountry
        //Uncomment it later
        //_categoryView.pickerDataSource = countryList
        _categoryView.pickerDataSource = ["SAUDI"]
        self.view.addSubview(_categoryView)
    }
    
    @IBAction func cityButtonPressed(_ sender: UIButton) {
        addPickerViewLayer()
        self.view.addSubview(_transparentView)
        _categoryView._headerTitle.text = GOMessage.selectCity
        _categoryView.pickerDataSource = cityList
        self.view.addSubview(_categoryView)
    }
    
    //MARK: GODropDownViewDelegate
    func donePressed(selectedValue: String, pickerHeader: String) {
        if _transparentView != nil {
            _transparentView.removeFromSuperview()
            _transparentView = nil
        }
        if _categoryView  != nil {
            _categoryView.removeFromSuperview()
            _categoryView = nil
        }
        
        //let cityValueChanged = (selectedValue === GOMessage.selectCity)
        if (pickerHeader.elementsEqual(GOMessage.selectCity)) {
            city.text = selectedValue
        }else if (pickerHeader.elementsEqual(GOMessage.selectCountry)) {
            country.text = selectedValue
        }else if (pickerHeader.elementsEqual(GOMessage.selectStoreCetegory)) {
            storeCategory.text = selectedValue
        }
    }
    
    //MARK: GOStoreRegistrationVMDelegate
    func dataFetchError(message: String) {
        GOAlertAndLoader.showAlertMessage(message)
    }
    
    func didFetchStoreCategories(categories: [StoreCategory]) {
        for item in categories {
            categoryList.append(item.storecategoryname)
        }
    }
    
    func didFetchCountries(countries: [Country]) {
        for item in countries {
            countryList.append(item.countryname)
        }
    }
    
    func didFetchCities(cities: [City]) {
        for item in cities {
            cityList.append(item.cityname)
        }
    }

}
