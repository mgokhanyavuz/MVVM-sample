//
//  BaseViewController.swift
//  MVVMBase
//
//  Created by Gokhan Yavuz on 21.11.2021.
//
import UIKit
import Foundation
import SnapKit

class BaseViewController: UIViewController {
    
    var vSpinner:           UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupNavigationBar()
    }
    
//MARK: NavigationBar Funcs
    func setupNavigationBar() {
        self.setNavigationTitle(title: "Base MVVM App")
    }
    
    func setNavigationTitle(title: String) {
        self.navigationController?.navigationBar.topItem?.title = title
    }
    
    func hideLefttBarBack(){
        self.navigationItem.leftBarButtonItem = nil
    }
    
    func hideRightBarSearch() {
        self.navigationItem.rightBarButtonItems = nil
    }

//MARK: Called from VC to Override
    
    @objc func dismissPageBack(){
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
//MARK: Spinner Funcs
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let indicator = UIActivityIndicatorView.init(style: .whiteLarge)
        indicator.startAnimating()
        indicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(indicator)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
    
//MARK: Show Error MEthods
    func showErrorVC(message: String) {
        DispatchQueue.main.async {
            let errorAlert = UIAlertController(title: "Hata", message: message, preferredStyle: UIAlertController.Style.alert)
            errorAlert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: { (action: UIAlertAction!) in
              }))
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
}


