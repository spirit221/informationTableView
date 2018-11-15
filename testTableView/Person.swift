//
//  Person.swift
//  testTableView
//
//  Created by Sergey Gusev on 15/11/2018.
//  Copyright © 2018 Sergey Gusev. All rights reserved.
//

import Foundation

struct Person {
    
    let firstName: String?
    let lastName: String?
    let address: String?
    let phone: String?
    let position: String?
    
}


extension Person {
    init? (dictionary: [String: String?]){
        let firstName = dictionary["firstName"] as? String
        let lastName = dictionary["lastName"] as? String
        let address = dictionary["address"] as? String
        let phone = dictionary["phone"] as? String
        let position = dictionary["position"] as? String
        
        self.init(firstName: firstName,
                  lastName: lastName,
                  address: address,
                  phone: phone,
                  position: position
        )
        
    }
}
