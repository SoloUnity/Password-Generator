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
                .foregroundColor(.white)
            
            TextField("Enter Your Password" , text: $model.textField)
                .disableAutocorrection(true)
                
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
