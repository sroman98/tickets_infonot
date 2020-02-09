//
//  File.swift
//  tickets-infonot-ios
//
//  Created by Sandra Roman on 07/02/20.
//  Copyright © 2020 sroman. All rights reserved.
//

import Foundation
import SwiftUI

class Catalogs: ObservableObject {
    static var shared = Catalogs()

    // MARK: - Properties
    private var notarias = [Notaria]()
    private var usuarios = [Usuario]()
    private var departamentos = [Departamento]()
    
    func update(catalog: String, array: [Any]) {
        
    }
    
    func getNotarias(completion: @escaping ([Notaria]) -> Void) {
        if notarias.isEmpty {
            Helper.sendRequest(path: "/notarias", method: .get, parameters: nil) { response in
                switch response.result {
                case .success(let data):
                    if data != nil {
                        guard let notDictionary = try? DECODER.decode([String: [Notaria]].self, from: data!) else {
                            print("Error: Couldn't decode data into dictionary of array of notarias")
                            completion(self.notarias)
                            return
                        }
                        self.notarias = notDictionary["data"] ?? [Notaria]()
                    }
                case .failure(let error):
                    print(error)
                }
                completion(self.notarias)
            }
        } else {
            completion(self.notarias)
        }
    }
}
