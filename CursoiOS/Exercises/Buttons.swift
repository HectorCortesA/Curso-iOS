//
//  Buttons.swift
//  CursoiOS
//
//  Created by Hector Cortes  on 15/12/25.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        
        VStack(spacing: 60){
            Button("Enabled"){}
            
            Button("Disable"){}
                .disabled(true)
            
            Button("Enable"){}
                .buttonStyle(.bordered)
            
            Button("Disable"){}
                .buttonStyle(.bordered)
                .disabled(true)
            
            Button("Enable"){}
                .buttonStyle(.borderedProminent)
            
            Button("Disable"){}
                .buttonStyle(.borderedProminent)
                .disabled(true)
                
            
            
            //Button Personalizado
            
            Button("Personalizado"){}
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .foregroundStyle(.green)
                .fontWeight(.bold)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                // .frame(width: 200, height: 50) Tamaño del button
                // .background(Color.yellow)
                .background(  //Persobaliza todo el botton
                    LinearGradient(
                        colors: [.purple, .blue],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(20) //Esquinas redondeadas
                .shadow(color: .purple.opacity(0.3), radius: 10, y: 10) //Sombra
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 10) // Borde blanco
                )
            
            //funcion Personalizado 2
            //Lo que hace es llamar una funcion donde ya se le asigno todo los Stylos que tiene el button
            Button("Tap me") {
                       // Handle button's tap
                   }
            .buttonStyle(AnimatedButtonStyle())
            
        }
        .controlSize(.large)
        .font(.title)
        .tint(.purple)
      
    }
    //Funcion Personalizado 2
    struct AnimatedButtonStyle: ButtonStyle{
     
        func makeBody(configuration: ButtonStyleConfiguration) -> some View {
            return configuration.label
                .padding()
                .foregroundStyle(Color.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .scaleEffect(configuration.isPressed ? 0.95 : 1)
                .animation(.linear(duration: 0.2), value: configuration.isPressed)
        }
    }
    //Aqui termina Personalizar 2
}

#Preview {
    Buttons()
}
