//
//  DetailedViewController.swift
//  testTableView
//
//  Created by Sergey Gusev on 15/11/2018.
//  Copyright © 2018 Sergey Gusev. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var firstName: String?
    var lastName: String?
    var address: String?
    var phone: String?
    var position: String?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Детальная информация"
        initTableView()
        initBackButton()
    }
    func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    func initBackButton() {
        let back = UIBarButtonItem(title: "Назад", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backTapped))
        navigationItem.leftBarButtonItem = back
        
    }
    @objc func backTapped(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func commonInit(person: Person){
        self.firstName = person.firstName
        self.lastName = person.lastName
        self.address = person.address
        self.phone = person.phone
        self.position = person.position
        
    }
}
extension DetailedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension DetailedViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Имя: \(firstName ?? "")"
        case 1:
            cell.textLabel?.text = "Фамилия: \(lastName ?? "")"
        case 2:
            cell.textLabel?.text = "Адрес: \(address ?? "")"
        case 3:
            cell.textLabel?.text = "Телефон: \(phone ?? "")"
        case 4:
            cell.textLabel?.text = "Должность: \(position ?? "")"
        default:
            break
        }
        
        return cell
    }
    
    
}
