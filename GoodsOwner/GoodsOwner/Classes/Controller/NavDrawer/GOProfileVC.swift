//
//  GOProfileVC.swift
//  GoodsOwner
//
//  Created by nabanita on 11/02/18.
//  Copyright © 2018 company. All rights reserved.
//

import UIKit

class GOProfileVC: GOBaseVC {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    private lazy var generalVC: GOProfileGeneralVC = {

        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        var viewController = storyboard.instantiateViewController(withIdentifier: "GOProfileGeneralVC") as! GOProfileGeneralVC
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var reviewVC: GOProfileReviewVC = {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        var viewController = storyboard.instantiateViewController(withIdentifier: "GOProfileReviewVC") as! GOProfileReviewVC
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton){
        let _ = self.navigationController?.popViewController(animated: true)
    }

    private func setupView() {
        setupSegmentedControl()
        updateView()
    }
    
    private func setupSegmentedControl() {
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "General", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Reviews", at: 1, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: reviewVC)
            add(asChildViewController: generalVC)
        } else {
            remove(asChildViewController: generalVC)
            add(asChildViewController: reviewVC)
        }
    }
    
    
    
    private func add(asChildViewController viewController: UIViewController) {
        /* Add Child View Controller. the child view controller automatically receives a message of willMove(toParentViewController:) with the container view controller as the only argument.*/
        addChildViewController(viewController)
        
        // Add Child View as Subview and Configure Child View
        view.addSubview(viewController.view)
        viewController.view.frame = containerView.frame
        //viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
}
