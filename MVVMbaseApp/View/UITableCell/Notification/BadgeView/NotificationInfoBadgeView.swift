//
//  NotificationInfoBadgeView.swift
//  SellerApp
//
//  Created by Berdil Ilyada Karacam on 18.11.2021.
//

import UIKit
import SnapKit

final class NotificationInfoBadgeView: UIView {

    private let infoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}

// MARK: - Setup
private extension NotificationInfoBadgeView {
    func setupUI() {
        addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(2)
            make.left.right.equalToSuperview().inset(6)
        }
    }
}

// MARK: - Prepare
extension NotificationInfoBadgeView {
    func prepare(_ model: NotificationInfoBadgeViewModel) {
        infoLabel.font = model.style.font
        infoLabel.text = model.info
        infoLabel.textColor = model.style.textColor
        backgroundColor = model.style.backgroundColor
        layer.cornerRadius = model.style.cornerRadius
    }
}
