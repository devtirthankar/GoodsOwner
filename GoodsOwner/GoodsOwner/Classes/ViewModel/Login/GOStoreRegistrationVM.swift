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
}

class GOStoreRegistrationVM {
    
    var categoryList = [StoreCategory]()
    var countryList = [Country]()
    var cityList = [City]()
    var delegate: GOStoreRegistrationVMDelegate?
    
    func fetchStoreCategories() {
        GOWebServiceManager.sharedManager.getStoreCategoryList(block: {[weak self](response, error) in
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
        GOWebServiceManager.sharedManager.getCountryList(block : {[weak self](response, error) in
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
        GOWebServiceManager.sharedManager.getCityList(country: country, block: {[weak self](response, error) in
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
    
}
