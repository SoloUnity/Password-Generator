//
//  PasswordStrengthView.swift
//  PasswordVerifier
//
//  Created by Gordon on 2023-01-21.
//

import SwiftUI


struct StrengthBarView: View {
    
    @EnvironmentObject var model : Model
    @State var barColour : Color = .clear
    
    var body: some View {
        
        ZStack (alignment: .leading){
            
            RoundedRectangle (cornerRadius: 20, style: .continuous)
                .frame (width: 500, height: 10)
                .foregroundColor(Color.black.opacity (0.1))
            
            // Percent bar that goes up
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .animation(.linear, value: model.passwordStrength)
                .animation(.linear, value: getStrength())
                .frame(width: getStrength() ? (500 * 0.1) : (500 * CGFloat(model.passwordStrength)), height: 10)
                .foregroundColor(barColour)
            
        }
        .onChange(of: model.textField, perform: { _ in
            model.checkStrength()
            getColour()
        })
    }
    
    func getColour() {
        
        switch model.passwordStrength {
        case 0:
            self.barColour = .red
        case 0.25:
            self.barColour = .orange
        case 0.5:
            self.barColour = .yellow
        case 0.75:
            self.barColour = .green
        case 1:
            self.barColour = .blue
        default:
            self.barColour = .clear
        }
        
    }
    
    func getStrength() -> Bool {
        if model.passwordStrength == 0 && model.textField != "" {
            return true
        }
        
        return false
    }
    
    
}

struct PasswordStrengthView_Previews: PreviewProvider {
    static var previews: some View {
        StrengthBarView()
    }
}
