//
//  NotificationCellViewModel.swift
//  SellerApp
//
//  Created by Berdil Ilyada Karacam on 18.11.2021.
//

import Foundation

struct NotificationCellViewModel {
    let title: String
    let description: String
    let date: String
    let infoBadge: NotificationInfoBadgeViewModel
    
    init(title: String, description: String, date: String, infoBadge: NotificationInfoBadgeViewModel) {
        self.title = title
        self.description = description
        self.date = date
        self.infoBadge = infoBadge
    }
}

extension NotificationCellViewModel {
    init(model: SellerModel) {
        title = model.title ?? ""
        description = model.preDescription ?? ""
        date = model.date ?? ""
        infoBadge = !(model.isRead ?? false) ?
            .init(info: "Yeni", style: .newInfoStyle) :
            .init(info: "Okundu", style: .readInfoStyle)
    }
}
