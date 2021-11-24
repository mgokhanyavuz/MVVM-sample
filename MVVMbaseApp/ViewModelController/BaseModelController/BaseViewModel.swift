//
//  BaseViewModel.swift
//  MVVMBase
//
//  Created by Gokhan Yavuz on 21.11.2021.
//

import Foundation

class BaseViewModel {
 //MARK: Base Closure
    var closeIndicator:             (()->())?
    var showError:                  (()->())?
    var showErrorWithServiceMessage:((String?)->())?
    
    let service: ServiceProtocol

    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
}
