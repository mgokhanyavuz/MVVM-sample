//
//  Service.swift
//  CicekSepetiPOC
//
//  Created by BEGUMKIRKGOZ on 14.10.2020.
//

import Foundation
import UIKit

struct ServiceConfig {
    private(set) var api:           String
    private(set) var baseUrl:       URL?
    
    var requestType:            HTTPRequestType
    var parameters:             [String: Any]?
    
    init(api: String, baseUrl: String = getBaseUrl()) {
        self.api = api
        self.requestType = HTTPRequestType.HTTPGet
        self.baseUrl = getUrl(baseUrl)
    }
}

func getUrl(_ baseUrl: String) -> URL? {
    let strUrl = baseUrl
    guard let serviceUrl = URL(string: strUrl) else { return nil }
    return serviceUrl
}

func getBaseUrl() -> String {
    return Service.kBaseUrlLive
}

//MARK: APi Calls

protocol ServiceProtocol {
    func getMails(completionHandler: @escaping (_ responseClass :SellerListModel?) -> Void) -> Void
}

class Service: ServiceProtocol {
    let request: RequestProtocol = Request()
    
    static let kBaseUrlLive = "https://run.mocky.io/v3/82f36280-0e03-4bc9-a4aa-a7a06c3b3366"
    
    func getMails(completionHandler: @escaping (_ responseClass :SellerListModel?) -> Void) -> Void {
        var serviceConfig = ServiceConfig(api: "https://run.mocky.io/v3/82f36280-0e03-4bc9-a4aa-a7a06c3b3366")
        serviceConfig.requestType = HTTPRequestType.HTTPGet
        request.networkRequest(serviceConfig) { (sellerListModel: SellerListModel?) in
            completionHandler(sellerListModel)
        }
    }
}
