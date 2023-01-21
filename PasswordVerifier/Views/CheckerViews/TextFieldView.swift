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
        
        ZStack {
            
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.black)
                
                TextField("Enter Your Password" , text: $model.textField)
                    .keyboardType(.default)
                    .foregroundColor(.black)
                    .disableAutocorrection(true)
                    
            }
            .padding(.horizontal)
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                

            
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
