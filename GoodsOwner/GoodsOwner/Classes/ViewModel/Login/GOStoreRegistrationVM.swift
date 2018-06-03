//
//  GOStoreRegistrationVM.swift
//  GoodsOwner
//
//  Created by nabanita on 10/05/18.
//  Copyright © 2018 company. All rights reserved.
//

import Foundation

protocol GOStoreRegistrationVMDelegate {
    func dataFetchError(message: String)
    func didFetchStoreCategories(categories: [StoreCategory])
    func didFetchCountries(countries: [Country])
    func didFetchCities(cities: [City])
    func registraionSucessfull()
    func registraionError(_ message: String)
}

class GOStoreRegistrationVM {
    
    var categoryList = [StoreCategory]()
    var countryList = [Country]()
    var cityList = [City]()
    var delegate: GOStoreRegistrationVMDelegate?
    
    func fetchStoreCategories() {
        GOAlertAndLoader.showLoading()
        GOWebServiceManager.sharedManager.getStoreCategoryList(block: {[weak self](response, error) in
            GOAlertAndLoader.hideLoading()
            if let err = error {
                self?.delegate?.dataFetchError(message: err.localizedDescription)
            }
            guard let data = response as? Data else {
                print("No product data")
                return
            }
            
            guard let categories = try? JSONDecoder().decode(StoreCategories.self, from: data ) else {
                print("Error: Couldn't decode data into StoreCategories")
                return
            }
            for item in categories.result! {
                self?.categoryList.append(item)
            }
            self?.delegate?.didFetchStoreCategories(categories: (self?.categoryList)!)
        })
    }
    
    func fetchCountryList() {
        GOAlertAndLoader.showLoading()
        GOWebServiceManager.sharedManager.getCountryList(block : {[weak self](response, error) in
            GOAlertAndLoader.hideLoading()
            if let err = error {
                self?.delegate?.dataFetchError(message: err.localizedDescription)
            }
            guard let data = response as? Data else {
                print("No product data")
                return
            }
            guard let countries = try? JSONDecoder().decode(Countries.self, from: data ) else {
                print("Error: Couldn't decode data into Countries")
                return
            }
            for item in countries.result! {
                self?.countryList.append(item)
            }
            self?.delegate?.didFetchCountries(countries: (self?.countryList)!)
        })
    }
    
    func fetchCityList(country: String) {
        GOAlertAndLoader.showLoading()
        GOWebServiceManager.sharedManager.getCityList(country: country, block: {[weak self](response, error) in
            GOAlertAndLoader.hideLoading()
            if let err = error {
                self?.delegate?.dataFetchError(message: err.localizedDescription)
            }
            guard let data = response as? Data else {
                print("No product data")
                return
            }
            guard let cities = try? JSONDecoder().decode(Cities.self, from: data ) else {
                print("Error: Couldn't decode data into Cities")
                return
            }
            for item in cities.result! {
                self?.cityList.append(item)
            }
            self?.delegate?.didFetchCities(cities: (self?.cityList)!)
        })
    }
    
    func onRegistratButtonPressed(name : String, email: String, password: String, phone: String, countrycode: String) {
        
        var message: String = ""
        if name.count == 0 {
            message = GOErrorAlertMessage.emptyName
        }
        else if email.count == 0 {
            message = GOErrorAlertMessage.emptyEmail
        }
        else if GOUtilities.checkEmailValidity(email) != true {
            message = GOErrorAlertMessage.invalidEmail
        }
        else if password.count == 0 {
            message = GOErrorAlertMessage.emptyPassword
        }
        else if phone.count == 0 {
            message = GOErrorAlertMessage.emptyMobile
        }
        else if countrycode.count == 0 {
            message = GOErrorAlertMessage.emptyCountryCode
        }
        else {
            //if validation successfull, call register api
            registerUser(name: name, email: email, password: password, phone: phone, countrycode: countrycode)
        }
    }
    
    private func registerUser(name : String, email: String, password: String, phone: String, countrycode: String) {
        GOAlertAndLoader.showLoading()
        GOWebServiceManager.sharedManager.registerUser(name: name, email: email, password: password, phone: phone, countrycode: countrycode, block: {[weak self](response, error) in
            GOAlertAndLoader.hideLoading()
            if let err = error {
                self?.delegate?.registraionError(err.localizedDescription)
            }
            else {
                self?.delegate?.registraionSucessfull()
            }
        })
    }
    
}
