//
//  ContentView.swift
//  PasswordVerifier
//
//  Created by Gordon on 2023-01-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
        
            HStack {
                Image("Banana")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height:100)
                
                Spacer()
                
            }
            .padding()
            
            TextFieldView()
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
