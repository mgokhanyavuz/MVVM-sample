//
//  NotificationVM.swift
//  MVVMbaseApp
//
//  Created by Begum Demirci on 19.11.2021.
//

import Foundation


class NotificationVM: BaseViewModel {
    
    var processSellerList: ((SellerListModel?)->())?
    var data: SellerListModel?
    var filteredList = SellerListModel()
    
    func getMailList() {
        service.getMails { response in
            self.processSellerList!(response)
            self.data = response
            self.filteredList = self.data!
        }
    }
    
    func applyFilter(isRead: Bool) {
        filteredList.sellerList = data?.sellerList?.filter{($0.isRead == isRead)}
        self.processSellerList!(filteredList)
    }
}
