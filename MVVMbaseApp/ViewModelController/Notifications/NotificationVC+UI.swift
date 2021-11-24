//
//  NotificationVC+UI.swift
//  MVVMbaseApp
//
//  Created by Gökhan Yavuz on 19.11.2021.
//

import Foundation
import UIKit

extension NotificationVC {
    
    func prepareView() {
        self.view.addSubview(contentView)
        contentView.addSubview(contentStackView)
        
        contentView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentStackView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        contentStackView.addArrangedSubview(headerStackView)
        headerStackView.snp.makeConstraints { (maker) in
            maker.height.equalTo(50)
        }
        
        headerStackView.addArrangedSubview(alertLabel)
        headerStackView.addArrangedSubview(notificationLabel)
        
        alertLabel.snp.makeConstraints { (maker) in
            maker.height.equalTo(40)
            maker.centerY.equalToSuperview()
        }
        
        notificationLabel.snp.makeConstraints { (maker) in
            maker.height.equalTo(40)
            maker.centerY.equalToSuperview()
        }
        
        contentStackView.addArrangedSubview(customPickerview)
        customPickerview.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview().inset(10)
            maker.trailing.equalToSuperview().offset(-250)
            maker.height.equalTo(40)
        }
        
        contentStackView.addArrangedSubview(numberLabel)
        numberLabel.snp.makeConstraints { (maker) in
            maker.trailing.leading.equalToSuperview().inset(10)
            maker.height.equalTo(20)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NotificationsTableViewCell.self, forCellReuseIdentifier: "cellReuseIdentifier")
        
        contentStackView.addArrangedSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension NotificationVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.sellerList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NotificationsTableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! NotificationsTableViewCell?)!
        cell.backgroundColor = .clear
        cell.prepare(NotificationCellViewModel(model: (notificationVM.filteredList.sellerList?[indexPath.row])!))
        return cell
    }
}
