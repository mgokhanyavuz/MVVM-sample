//
//  ViewController.swift
//  MVVMbaseApp
//
//  Created by Gökhan Yavuz on 19.11.2021.
//

import UIKit
import SnapKit

class NotificationVC: BaseViewController {
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 250, green: 251, blue: 255)
        return view
    }()
    
    lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()
    
    lazy var headerStackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = UIColor(red: 42, green: 88, blue: 204)
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var alertLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 15)
        lbl.textColor = .white
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var notificationLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 15)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.text = "Bildirimler (14)"
        return lbl
    }()
    
    lazy var customPickerview: CustomPickerView = {
        let pckr = CustomPickerView()
        pckr.backgroundColor = .clear
        pckr.delegate = self
        return pckr
    }()
    
    lazy var numberLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.textColor = UIColor(red: 85, green: 105, blue: 142)
        return lbl
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .plain)
        table.backgroundColor = .clear
        table.separatorStyle = .none
        var frame = CGRect.zero
        frame.size.height = .leastNormalMagnitude
        table.tableHeaderView = UIView(frame: frame)
        return table
    }()
    
    var notificationVM = NotificationVM()
    
    var data: SellerListModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Bildirimler"
        prepareView()
        initVM()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showSpinner(onView: self.view)
        self.notificationVM.getMailList()
    }
    
    private func initVM() {
        notificationVM.processSellerList = { [weak self] data in
            self?.removeSpinner()
            self?.data = data
            DispatchQueue.main.async {
                self?.numberLabel.text = "\(data?.sellerList?.count ?? 0) Adet Duyuru"
                self?.alertLabel.text =  "Duyurular (\(data?.sellerList?.count ?? 0))"
                self?.tableView.reloadData()
            }
        }
    }
    
    private func applyFilter(isRead: Bool) {
        notificationVM.applyFilter(isRead: isRead)
    }

}

extension NotificationVC: CustomPickerViewDelegate {
    func pickerSelectedRow(row: Int) {
        applyFilter(isRead: row == 0 ? false : true)
    }
}
