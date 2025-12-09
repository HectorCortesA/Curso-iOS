//
//  Imagen.swift
//  CursoiOS
//
//  Created by Hector Cortes  on 08/12/25.
//

import SwiftUI

struct Imagen: View{
    var body:some View{
        
        Image(.bosque)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding()
        
        Image(.bosque)
            .resizable()
            .frame(width: 100,height: 100, alignment: .bottom)
            .clipShape(Circle())
        
        Image(.bosque)
            .resizable()
            .frame(width: 250, height: 250, alignment: .bottom)
        
        Image(systemName: "cloud")
            .font(.largeTitle)
    }
    
}

#Preview{
    Imagen()
}

