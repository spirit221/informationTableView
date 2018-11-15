//
//  ViewController.swift
//  testTableView
//
//  Created by Sergey Gusev on 15/11/2018.
//  Copyright © 2018 Sergey Gusev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var persons: [Person] = []
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        self.title = "Список сотрудников"
        Serialization.parse { [weak self] persons in
            self?.persons = persons
            self?.tableView.reloadData()
        }
    }
    func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailedViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController else {
                return
        }
        detailedViewController.commonInit(person: persons[indexPath.row])
        detailedViewController.modalPresentationStyle = .overCurrentContext
        let navigatorViewController: UINavigationController = UINavigationController(rootViewController: detailedViewController)
        present(navigatorViewController, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Сотрудник №\(indexPath.row + 1) \(persons[indexPath.row].firstName ?? "") \(persons[indexPath.row].lastName ?? "")"
        return cell
    }
    
    
}
