//
//  MenuAction.swift
//  CursoiOS
//
//  Created by Hector Cortes  on 26/12/25.
//
import SwiftUI

struct MenuAction:View{
    @State private var bold = false
    @State private var italic = false
    @State private var normal = false
    
    var body: some View{
        //Normal
        Menu("Format"){
            Toggle("Bold", isOn: $bold)
            Toggle("Italic", isOn: $italic)
            Toggle("Normal", isOn: $normal)
        }
        .menuActionDismissBehavior(.disabled)
        
        
        // Avanzado
        Menu {
            Button(role: .destructive){
                
            } label:{
                Label("Delete",systemImage: "trash")
            }
            
            Menu {
                Button("Share with Firends"){
                    
                }
                Button("Save on Divace"){
                    
                }
            } label:{
                Label("Share", systemImage:"square.and.arrow.up")
            }
            Button{} label: {
                Label("Edit",systemImage: "pencil")
            }
            
        }label:{
            Label("More",systemImage:"ellipsis.circle")
                .foregroundStyle(.purple)
        }
    }
}

#Preview {
    MenuAction()
}
