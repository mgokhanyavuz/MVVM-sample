//
//  NotificationInfoBadgeViewModel.swift
//  SellerApp
//
//  Created by Berdil Ilyada Karacam on 18.11.2021.
//

import UIKit

struct NotificationInfoBadgeViewModel {
    let info: String
    let style: Style
    
    struct Style {
        let backgroundColor: UIColor
        let textColor: UIColor
        let font: UIFont
        let cornerRadius: CGFloat
    }
    
    init(info: String, style: Style = .newInfoStyle) {
        self.info = info
        self.style = style
    }
}

extension NotificationInfoBadgeViewModel.Style {
    
    static let newInfoStyle: Self = .init(backgroundColor: UIColor(red: 226, green: 247, blue: 225),
                                          textColor: UIColor(red: 81, green: 181, blue: 73),
                                          font: UIFont.boldSystemFont(ofSize: 12),
                                          cornerRadius: 4)

    static let readInfoStyle: Self = .init(backgroundColor: UIColor(red: 233, green: 236, blue: 245),
                                           textColor: UIColor(red: 112, green: 125, blue: 152),
                                           font: UIFont.boldSystemFont(ofSize: 12),
                                           cornerRadius: 4)
}
