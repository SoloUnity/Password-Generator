//
//  TextFieldView.swift
//  PasswordVerifier
//
//  Created by Gordon on 2023-01-21.
//

import SwiftUI

struct TextFieldView: View {
    
    @EnvironmentObject var model : Model
    
    var body: some View {
        
        HStack {
            Image(systemName: "lock")
            
            TextField("Enter Your Password" , text: $model.textField)
                .keyboardType(.default)
                .disableAutocorrection(true)
                .onChange(of: model.textField) { _ in
                    model.checkStrength()
                }
            
            Spacer()
            
            if model.textField != "" {
                
                Button {
                    model.textField = ""
                    
                    model.checkStrength()
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
