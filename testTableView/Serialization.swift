//
//  Serialization.swift
//  testTableView
//
//  Created by Sergey Gusev on 15/11/2018.
//  Copyright © 2018 Sergey Gusev. All rights reserved.
//

import Foundation
class Serialization {
    static func parse(finish: @escaping (([Person]) -> Void)) {
        if let path = Bundle.main.path(forResource: "Person", ofType: "json") {
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    Data(contentsOf: URL(fileURLWithPath: path)), options: [])
                guard let jsonArray = jsonResponse as? [[String: String?]] else {
                    return
                }
                let persons = jsonArray.compactMap {
                    return Person(dictionary: $0)
                }
                finish(persons)
            } catch let parsingError {
                print("Error", parsingError)
            }
        } else {
            print("Error parse file")
        }
    }
}
