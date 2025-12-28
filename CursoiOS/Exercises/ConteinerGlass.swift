

//  ConteinerGlass.swift
//  CursoiOS
//
//  Created by Hector Cortes  on 27/12/25.
//
import SwiftUI

struct ConteinerGlass: View {
    var body: some View {
        
       
        if #available(iOS 26.0, *) {
            GlassEffectContainer(spacing: 20){
                HStack{
                    
                    Text("Now Playing")
                        .padding()
                        .glassEffect(.clear)
                    Image(systemName: "waveform")
                        .foregroundStyle(.mint)
                        .font(.largeTitle)
                        .padding()
                        .glassEffect(.clear)
                }
                .padding(20)
                .background(Color.pink)
                .cornerRadius(10)
                
            }
        } else {
            // Fallback on earlier versions
        }
        
  
    }
}


#Preview {
    ConteinerGlass()
}
