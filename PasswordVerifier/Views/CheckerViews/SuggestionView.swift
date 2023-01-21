//
//  SuggestionView.swift
//  PasswordVerifier
//
//  Created by Gordon on 2023-01-21.
//

import SwiftUI

struct SuggestionView: View {
    
    @EnvironmentObject var model : Model
    
    var body: some View {
        
        HStack {
            
            VStack (alignment: .leading) {
                
                Text("Suggestions")
                
                if !model.isCount {
                    Text("Make Your Password Longer 6+ Characters")
                }
               
                if !model.isUpper {
                    Text("Add Capitals to Your Password")
                }
                
                if !model.isDigit {
                    Text("Add Numbers to Your Password")
                }
                
                if !model.isSymbol {
                    Text("Add Symbols to Your Password")
                }
            }
            
            Spacer()
            
        }
        
        
    }
}

struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView()
    }
}
