//
//  TextoColor.swift
//  CursoiOS
//
//  Created by Hector Cortes  on 08/12/25.
//
import SwiftUI

struct TextoColor: View {
    var body: some View {
        VStack {
            Text("Hola mundo red")
                .foregroundStyle(Color.red) //Color Definido
            
            Text("Azul")
                .foregroundStyle(Color.blue)
            Text("Green")
                .foregroundStyle(.green.gradient) //Color Gradiente
            
            Text("Rosa")
                .foregroundStyle(Color(red: 0.5, green: 0.2, blue: 0.100)) // Color RGB
        }
        
    }
}
#Preview {
    TextoColor()
}

