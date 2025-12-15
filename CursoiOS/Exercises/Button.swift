//
//  CustomButton.swift  // Better to rename to avoid conflict
//  CursoiOS
//
//  Created by Hector Cortes on 14/12/25.
//
//Button de Asignacion 
import SwiftUI

struct CustomButton: View {
    // Define the action function
    private func delete() {
        print("Delete button tapped")
        // Add your delete logic here
    }
    private func saveChanges(){
        print("Confirmar")
    }
    private func cancelar(){
        print("cancelar")
    }
    func dismiss(){
        print("Cancelar")
    }
    
    var body: some View {
        //iOS 15 +
        Button(role: .destructive) {
            delete()
            
        } label: {
            Label("Delete", systemImage: "trash")
        }

        //iOS 26 +
        if #available(iOS 26.0, *) {
            Button(role: .confirm){
                saveChanges()
            } label: {
                Label("Confirmar", systemImage: "checkmark.circle")
            }
        } else {
            // Fallback on earlier versions
        }
        //iOS 15 +
        Button(role:.cancel){
            cancelar()
        } label: {
            Label("Cancelar", systemImage: "xmark.circle")
        }
        
        //iOS 26 +
        if #available(iOS 26, *){
            Button(role: .close){
                dismiss()
            } label: {
                Label("Closed", systemImage: "checkmark.circle")
            }
            
        }
    }
}

#Preview {
    CustomButton()
}
