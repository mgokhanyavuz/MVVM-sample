//
//  CustomPickerView.swift
//  MVVMbaseApp
//
//  Created by Gökhan Yavuz on 22.11.2021.
//

import Foundation
import UIKit

protocol CustomPickerViewDelegate: AnyObject {
    func pickerSelectedRow(row: Int)
}

final class CustomPickerView: UIView {
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var contentStackView: UIStackView = {
        let stck = UIStackView()
        stck.backgroundColor = .clear
        stck.axis = .horizontal
        return stck
    }()
    
    lazy var pickerTextField: UITextField = {
        let txtfld = UITextField()
        txtfld.placeholder = "Durum"
        txtfld.font = .systemFont(ofSize: 15)
        txtfld.textColor = .darkGray
        txtfld.delegate = self
        return txtfld
    }()
    
    lazy var arrowImageview: UIImageView = {
       let imgv = UIImageView()
        imgv.image = UIImage(named: "arrow")
        return imgv
    }()
    
    var pickerView = UIPickerView()
    
    var delegate: CustomPickerViewDelegate?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        prepareView()
    }
    
    private func prepareView() {
        setupViews()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerTextField.inputView = pickerView
    }
}

extension CustomPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return row == 0 ? "Yeni" : "Okundu"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = row == 0 ? "Yeni" : "Okundu"
        pickerTextField.resignFirstResponder()
        delegate?.pickerSelectedRow(row: row)
    }
}

extension CustomPickerView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}
