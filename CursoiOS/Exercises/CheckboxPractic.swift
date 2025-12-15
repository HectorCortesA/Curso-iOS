//
//  CheckboxPractic.swift
//  CursoiOS
//
//  Created by Hector Cortes  on 15/12/25.
//


import SwiftUI

struct CheckboxPractic:View {
    @State var isSelected: Bool = false
    
    var body: some View {
        Toggle(isOn: $isSelected) {
            Text("Hola")
            
        }
        .toggleStyle(iOSCheckboxToggleStyle())
        
        
    }
    
    struct iOSCheckboxToggleStyle :ToggleStyle{
        func makeBody(configuration: Configuration) -> some View {
            Button(action: {configuration.isOn.toggle()
            },
                   label: {
                HStack{
                    Image(systemName: configuration.isOn ? "checkmark.square": "square")
                    configuration.label
                }
            })
        }
    }
    
    
}


#Preview {
    CheckboxPractic()
}
