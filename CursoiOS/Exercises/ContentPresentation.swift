//
//  ContentPresentation.swift
//  CursoiOS
//
//  Created by Hector Cortes on 03/01/26.
//

import SwiftUI

struct ContentPresentation: View {
    @State private var showModal = false
    @State private var modalMessage = "Hola hector"
    
    var body: some View {
        VStack {
            Text(modalMessage)
                .font(.title)
                .padding()
            
            Button("Mostrar Modal") {
                showModal = true
            }
            .buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showModal) {
            // Pass the message parameter here
            ModalView(message: modalMessage)
                .presentationSizing(.fitted)
        }
    }
}

struct ModalView: View {
    let message: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(message)
                    .font(.largeTitle)
                    .padding()
                
                Text("Este es un modal de ejemplo")
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button("Cerrar") {
                    dismiss()
                }
                .buttonStyle(.bordered)
                .padding()
            }
            .padding()
            .navigationTitle("Modal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Listo") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentPresentation()
}
