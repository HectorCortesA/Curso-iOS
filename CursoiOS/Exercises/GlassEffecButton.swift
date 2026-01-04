//
//  GlassEffecButton.swift
//  CursoiOS
//
//  Created by Hector Cortes  on 03/01/26.
//

import SwiftUI

struct GlassEffecButton: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            HStack{
                
                if #available(iOS 26.0, *) {
                    Button("AQUI NO"){}
                        .font(.title)
                        .tint(Color.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .glassEffect(.clear, in: .rect(cornerRadius: 12))
                }
            }
        }
    }
      
}

#Preview {
    GlassEffecButton()
}
