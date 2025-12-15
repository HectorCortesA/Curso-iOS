//
//  ScrollHorizontal2.swift
//  CursoiOS
//
//  Created by Hector Cortes  on 14/12/25.
//

import SwiftUI

struct ScrollHorizontal2: View{
    var items = [Color.gray, Color.pink, Color.black, Color.yellow, Color.green]
    // Para el desplazamiento horizontal, configure la dirección de desplazamiento en horizontal con un HStack. Si el contenido se extiende horizontalmente más allá del marco de la pantalla, se habilitará el desplazamiento.
    var body: some View{
        GeometryReader{ gr in
            ScrollView(Axis.Set.horizontal, showsIndicators: true){
                //indica que si quieres visualizar los indicadores de dezplazamiento
                HStack{
                    ForEach(items, id: \.self) { item in
                    RoundedRectangle(cornerRadius: 12)
                            .fill(item)
                            .frame(width: gr.size.width - 60, height: 200)
                            
                        //  El lector de geometría se utiliza para que el ancho de la vista sea siempre un poco menor que el ancho de la pantalla, de modo que se pueda ver la segunda vista saliendo de la pantalla.
                    }
                }
            }
            .contentMargins(.vertical, 30,  ) //Vertical define el ancho de del padding de vertical
            .border(Color.black)
            .padding(20)
            
            GeometryReader{ gr in
                ScrollView(.vertical, showsIndicators: false){
                   
                    VStack{
                        ForEach(items, id: \.self) { item in
                        RoundedRectangle(cornerRadius: 12)
                                .fill(item)
                                .frame(width: gr.size.width - 60, height: 200)
                            //  El lector de geometría se utiliza para que el ancho de la vista sea siempre un poco menor que el ancho de la pantalla, de modo que se pueda ver la segunda vista saliendo de la pantalla.
                        }
                    }
                }
                .contentMargins(.horizontal, 10,  )  //indica que si quieres visualizar los indicadores de dezplazamiento
                .border(Color.black)
                .padding(20)
                .padding(.top, 270,)
               
            }
        }
        
       
    }
}

#Preview {
    ScrollHorizontal2()
}
