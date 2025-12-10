//
//  ColumnasFilas.swift
//  CursoiOS
//
//  Created by Hector Cortes  on 08/12/25.
//

import SwiftUI

struct ColumnasFilas:View{
    var body:some View{
        Grid(horizontalSpacing: 10, verticalSpacing: 10){
            GridRow{
                Text("Fila 1")
                ForEach(0..<2) { _ in Circle().fill(.red.gradient) }
                
            }
            GridRow{
                Text("Fila 2")
                ForEach(0..<6) { _ in Circle().fill(.orange.gradient)}
            }
            GridRow{
                Text("Fila 3")
                ForEach(0..<4) { _ in Circle().fill(.purple.gradient)}
            }
            GridRow{
                Text("Fila 4")
                ForEach(0..<10){ _ in Circle().fill(.blue.gradient)}
            }
        }
        Grid{ //    Columnas
            GridRow{
                Rectangle()
                    .fill(.green.gradient)
                    .gridCellColumns(2)
                Rectangle()
                    .fill(.red.gradient)
            }
            GridRow{
                Rectangle()
                    .fill(.blue.gradient)
                Rectangle()
                    .fill(.purple.gradient)
                    .gridCellColumns(2)
            }
            GridRow{ //Filas
                Rectangle()
                    .fill(.pink.gradient)
                Rectangle()
                    .fill(.gray.gradient)
            }
            GridRow{ //Filas
                Rectangle()
                    .fill(.pink.gradient)
                Rectangle()
                    .fill(.gray.gradient)
            }
            
        }
        
    }
}


#Preview {
    ColumnasFilas()
}
