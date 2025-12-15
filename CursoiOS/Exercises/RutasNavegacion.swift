


// State-Driven Navigation con NavigationStack - 
import SwiftUI
/*
 //Primera Forma
enum Screens {
    case textoColor
    case buttons
    case columnasfilas
}
 */

struct RutasNavegacion: View {
    @State private var navPath: [Screens] = []

    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                Button("Text Color") {
                    navPath.append(.textoColor)
                }
                Button("Buttons") {
                    navPath.append(.buttons)
                }
                Button("Columnas Filas") {
                    navPath.append(.columnasFilas)
                }
            }
            /*
             //Primera Forma
            .navigationDestination(for: Screens.self) { screen in
                switch screen {
                case .textoColor:
                    TextoColor()
                case .buttons:
                    Buttons()
                case .columnasfilas:
                    ColumnasFilas()
                }
            }
             */
            //Segunda Forma Navigation Router Pattern
            .navigationDestination(for: Screens.self) { screen in
                NavigationRouter.view(for: screen)
            }
            .navigationTitle("Navigate with path")
        }
    }
}
#Preview {
    RutasNavegacion()
}
