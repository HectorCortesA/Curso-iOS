//
//  Sliders.swift
//  CursoiOS
//
//  Created by Hector Cortes  on 15/12/25.
//

import SwiftUI

struct SlidersView: View {
    @State private var sliderValue = 0.5
    var body: some View {
        
        
        Text("slider 1:  En el momento de escribir esto, no hay forma de colorear la miniatura. Pero podemos cambiar el color de fondo y aplicar otros modificadores")
            .padding(.horizontal)
        Slider(value: $sliderValue)
            .padding(.horizontal, 10)
            .background(Color.orange.shadow(radius:2))
            // .cornerRadius(10)
            .padding(.horizontal)
            .tint(Color.pink)
        
        Text("slider 2: Usa el modificador accentColor para cambiar el color de la pista.")
            .padding(.horizontal)
        Slider(value: $sliderValue)
            .padding(.horizontal)
            .tint(Color.green)
        
        Text("slider 3: Usando formas y contornos")
            .padding(.horizontal)
        Slider(value: $sliderValue)
            .padding(10)
            .background(Capsule().stroke(Color.orange, lineWidth: 1))
            .padding(.horizontal)
        
        //Personalizado
        
        Text("Personalizado")
            .padding(.horizontal)
        Slider(value: $sliderValue)
            .padding(10)
            .background(Capsule().fill(Color.orange))
            .tint(.black)
            .padding(.horizontal)
        
    }
}
#Preview {
    SlidersView()
}
