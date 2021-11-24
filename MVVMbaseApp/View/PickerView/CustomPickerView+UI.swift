//
//  CustomPickerView+UI.swift
//  MVVMbaseApp
//
//  Created by Gökhan Yavuz on 22.11.2021.
//

import Foundation
import SnapKit

extension CustomPickerView {
    func setupViews() {
        self.addSubview(contentView)
        contentView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        contentView.addSubview(contentStackView)
        contentStackView.snp.makeConstraints { maker in
            maker.top.bottom.equalToSuperview()
            maker.leading.trailing.equalToSuperview().inset(10)
        }
        
        contentStackView.addArrangedSubview(pickerTextField)
        contentStackView.addArrangedSubview(arrowImageview)
        
        pickerTextField.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.top.bottom.equalToSuperview()
        }
        
        arrowImageview.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.trailing.equalToSuperview().offset(-30)
            maker.top.bottom.equalToSuperview().inset(14)
            maker.width.equalTo(15)
        }
        
    }
}
