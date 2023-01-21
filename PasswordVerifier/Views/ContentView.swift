//
//  ContentView.swift
//  PasswordVerifier
//
//  Created by Gordon on 2023-01-21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model : Model
    @State var page = 0
    
    var body: some View {
        
        NavigationView {
            List {
                
                NavigationLink {
                    CheckerView()
                } label: {
                    Label("Checker", systemImage: "lock")
                }
                
                NavigationLink {
                    GeneratorView()
                } label: {
                    Label("Generator", systemImage: "pencil")
                }
                
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Sidebar")
            
            CheckerView()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
