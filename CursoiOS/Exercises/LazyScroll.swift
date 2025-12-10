//
//  LazyScroll.swift
//  CursoiOS
//
//  Created by Hector Cortes  on 08/12/25.
//

import SwiftUI

struct LazyScroll:View {
    var body: some View {
        
        var elemtents = 1...500
        let gritItems = [GridItem(.fixed(100)),
                         GridItem(.fixed(100)),
                         GridItem(.fixed(100))]
        // adaptive: se adapta en esa columna pueda entras mas datos o reducir mas el tamaño
        //Flexible:
        
        ScrollView(.vertical){
            LazyVGrid(columns: gritItems, content:{   //GridItem esta diciendo que tenga una columna
                ForEach(elemtents, id: \.self) { elemtent in
                    VStack{
                        Text("\(elemtent)")
                        Circle()
                            .frame(height: 30)
                    }
                    }
            })
        }
        ScrollView(.horizontal){ //Define el Scrool de la pantalla
            LazyHGrid(rows: gritItems, content:{   //GridItem esta diciendo que tenga una fila
                ForEach(elemtents, id: \.self) { elemtent in
                    VStack{
                        Text("\(elemtent)") // Texto del numero
                            Circle() // Genera circulos
                            .frame(height: 30)} //Define el tamaño de circulos
                    }
               

            })
        }
        
    }
}

#Preview {
    LazyScroll()
}
