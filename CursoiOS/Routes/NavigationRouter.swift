//
//  NavigationRouter.swift
//  CursoiOS
//
//  Created by Hector Cortes  on 15/12/25.
//
//Segunda Forma Navigation Router Pattern
import SwiftUI

struct NavigationRouter {

    @ViewBuilder
    static func view(for screen: Screens) -> some View {
        switch screen {
        case .textoColor:
            TextoColor()

        case .buttons:
            Buttons()

        case .columnasFilas:
            ColumnasFilas()
        }
    }
}
