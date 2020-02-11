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
    private var municipios = [Municipio]()
    private var estados = [Estado]()
    
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
    
    func getMunicipios(completion: @escaping ([Municipio]) -> Void) {
        if municipios.isEmpty {
            Helper.sendRequest(path: "/municipios", method: .get, parameters: nil) { response in
                switch response.result {
                case .success(let data):
                    if data != nil {
                        guard let munDictionary = try? DECODER.decode([String: [Municipio]].self, from: data!) else {
                            print("Error: Couldn't decode data into dictionary of array of municipios")
                            completion(self.municipios)
                            return
                        }
                        self.municipios = munDictionary["data"] ?? [Municipio]()
                    }
                case .failure(let error):
                    print(error)
                }
                completion(self.municipios)
            }
        } else {
            completion(self.municipios)
        }
    }
    
    func getEstados(completion: @escaping ([Estado]) -> Void) {
        if estados.isEmpty {
            Helper.sendRequest(path: "/estados", method: .get, parameters: nil) { response in
                switch response.result {
                case .success(let data):
                    if data != nil {
                        guard let edoDictionary = try? DECODER.decode([String: [Estado]].self, from: data!) else {
                            print("Error: Couldn't decode data into dictionary of array of estados")
                            completion(self.estados)
                            return
                        }
                        self.estados = edoDictionary["data"] ?? self.estados
                    }
                case .failure(let error):
                    print(error)
                }
                completion(self.estados)
            }
        } else {
            completion(self.estados)
        }
    }
}
