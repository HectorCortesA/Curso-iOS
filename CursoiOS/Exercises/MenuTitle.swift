//
//  MenuTitle.swift
//  CursoiOS
//
//  Created by Hector Cortes on 03/01/26.
//

import SwiftUI

struct MenuTitle: View {
    var body: some View {
        NavigationStack {
            Text("Tasks Content")
                .navigationTitle("Tareas")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarTitleMenu {
                            Button("Completado", systemImage: "checkmark.circle") {}
                            Button("Mostrar Pendientes", systemImage: "clock") {}
                            Button("Mostrar todas", systemImage: "tray.full") {}
                        }
                    }
                }
        }

#Preview {
    MenuTitle()
}
