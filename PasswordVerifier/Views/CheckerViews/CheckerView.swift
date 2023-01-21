//
//  PasswordCheckerView.swift
//  PasswordVerifier
//
//  Created by Gordon on 2023-01-21.
//

import SwiftUI

struct CheckerView: View {
    
    @EnvironmentObject var model:Model
    
    var body: some View {
        
        ZStack {
            
            Image("Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)

            VStack {
                TextFieldView()
                    .frame(maxWidth: 500 , minHeight:45, maxHeight: 45)
                
                StrengthBarView()
                    .padding(.top)
                
                HStack {
                    
                    Text(String(model.passwordStrength))
                    
                    Spacer()
                    
                    Text(timeFrame())
                }
                
                if !(model.isDigit && model.isUpper && model.isCount && model.isSymbol) {
                    Divider()
                    
                    SuggestionView()
                }
                
                
                
                
            }
            .frame(maxWidth: 500)
            .padding()
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20 , style: .continuous))
        }
        .navigationTitle("Password Checker Tool")
        
        
        
    }
    
    func timeFrame() -> String {
        
        var time = ""
        var plural = false
        
        let calendar = Calendar(identifier: .gregorian)

        let components = calendar
            .dateComponents([.year, .month, .day, .hour, .minute, .second],
                            from: Date(),
                            to: Date() + (Double(model.crackTime) ?? 0))
        
        if components.year! > 100 {
            return "Centuries"
        }
        else if components.year! > 0 {
            time = String(components.year!) + " year"
            if components.year! > 1 {
                plural = true
            }
        }
        else if components.month! > 0 {
            time = String(components.month!) + " month"
            if components.month! > 1 {
                plural = true
            }
        }
        else if components.day! > 0 {
            time = String(components.second!) + " day"
            if components.day! > 1 {
                plural = true
            }
        }
        else if components.hour! > 0 {
            time = String(components.second!) + " hour"
            if components.hour! > 1 {
                plural = true
            }
        }
        else if components.minute! > 0 {
            time = String(components.minute!) + " minute"
            if components.minute! > 1 {
                plural = true
            }
        }
        else if components.second! > 0 {
            time = String(components.second!) + " second"
            if components.second! > 1 {
                plural = true
            }
        }
        else {
            time = "Instantly"
        }
        
        if plural {
            time += "s"
            return time
        }
        else {
            return time
        }
    }
}


struct PasswordCheckerView_Previews: PreviewProvider {
    static var previews: some View {
        CheckerView()
    }
}
