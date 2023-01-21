//
//  Model.swift
//  PasswordVerifier
//
//  Created by Gordon on 2023-01-21.
//

import Foundation

class Model: ObservableObject {
    
    @Published var textField = ""
    
    
    @MainActor
    func checkStrength() {
        if textField.count < 7 {
            print("bad pass")
        }
    }
    
}
