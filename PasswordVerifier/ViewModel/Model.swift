//
//  Model.swift
//  PasswordVerifier
//
//  Created by Gordon on 2023-01-21.
//

import Foundation
import ZxcvbnSwift
import SwiftUI

class Model: ObservableObject {
    
    @Published var textField = ""
    @Published var passwordStrength : Double = 0
    @Published var crackTime = "0.0"
    @Published var isCount = false
    @Published var isUpper = false
    @Published var isSymbol = false
    @Published var isDigit = false

    @MainActor
    func checkStrength() {
        
        let checker = DBZxcvbn()
        var digit = false
        var upper = false
        var sym = false
        
        let strength = checker.passwordStrength(self.textField)
        self.passwordStrength = Double(strength!.score) * 0.25
        self.crackTime = strength!.crackTime!
        
        for letter in textField {
            if letter.isNumber {
                digit = true
            }
            else if letter.isLetter && letter >= "A" && letter <= "Z" {
                
                upper = true
                
            }
            else if letter.isSymbol || letter.isPunctuation || letter.isCurrencySymbol || letter.isMathSymbol {
                sym = true
            }
        }
        
        withAnimation(.easeInOut){
            if digit {
                self.isDigit = true
            }
            else {
                self.isDigit = false
            }
            
            if upper {
                self.isUpper = true
            }
            else {
                self.isUpper = false
            }
            
            if sym {
                self.isSymbol = true
            }
            else {
                self.isSymbol = false
            }
            
            if self.textField.count >= 6 {
                self.isCount = true
            }
            else {
                self.isCount = false
            }
        }
    }
}
