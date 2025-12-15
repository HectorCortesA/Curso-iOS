//
//  ToDo.swift
//  CursoiOS
//
//  Created by Hector Cortes on 15/12/25.
//

import SwiftUI

struct ToDo: View {
    @State private var tasks: [String] = []
    @State private var completed: Set<Int> = []
    @State private var newTask = ""
    @State private var isEditing = false
    @State private var editingIndex: Int?
    @State private var editingText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // Agregar nueva tarea
                HStack {
                    TextField("Nueva tarea", text: $newTask)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Agregar") {
                        if !newTask.isEmpty {
                            tasks.append(newTask)
                            newTask = ""
                        }
                    }
                    .disabled(newTask.isEmpty)
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                
                // Lista corregida
                if tasks.isEmpty {
                    ContentUnavailableView(
                        "No hay tareas",
                        systemImage: "checklist",
                        description: Text("Agrega tu primera tarea")
                    )
                } else {
                    List {
                        ForEach(tasks.indices, id: \.self) { index in
                            if isEditing && editingIndex == index {
                                // Modo edición
                                HStack {
                                    TextField("Editar tarea", text: $editingText)
                                        .textFieldStyle(.roundedBorder)
                                    
                                    Button("Guardar") {
                                        saveEditedTask()
                                    }
                                    .buttonStyle(.borderedProminent)
                                    .disabled(editingText.trimmingCharacters(in: .whitespaces).isEmpty)
                                    
                                    Button("Cancelar") {
                                        cancelEditing()
                                    }
                                    .buttonStyle(.bordered)
                                    .tint(.gray)
                                }
                                .padding(.vertical, 8)
                            } else {
                                // Modo visualización normal
                                HStack {
                                    // Checkbox como botón
                                    Button(action: {
                                        toggleCompletion(for: index)
                                    }) {
                                        Image(systemName: completed.contains(index) ?
                                              "checkmark.square.fill" : "square")
                                            .foregroundColor(completed.contains(index) ? .green : .gray)
                                    }
                                    .buttonStyle(.plain)
                                    .disabled(isEditing)
                                    
                                    Text(tasks[index])
                                        .strikethrough(completed.contains(index))
                                    
                                    Spacer()
                                    
                                    if isEditing {
                                        // Botones durante el modo edición
                                        HStack(spacing: 15) {
                                            Button(action: {
                                                startEditingTask(at: index)
                                            }) {
                                                Image(systemName: "pencil")
                                                    .foregroundColor(.blue)
                                            }
                                            .buttonStyle(.borderless)
                                            
                                            Button(action: {
                                                deleteTask(at: index)
                                            }) {
                                                Image(systemName: "trash")
                                                    .foregroundColor(.red)
                                            }
                                            .buttonStyle(.borderless)
                                        }
                                    } else {
                                        // Botón de eliminar solo cuando no se está editando
                                        Button(action: {
                                            deleteTask(at: index)
                                        }) {
                                            Image(systemName: "trash")
                                                .foregroundColor(.red)
                                        }
                                        .buttonStyle(.borderless)
                                    }
                                }
                                // Esto asegura que todo el HStack sea tappable
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    if !isEditing {
                                        toggleCompletion(for: index)
                                    }
                                }
                            }
                        }
                        .onMove(perform: moveTask)
                    }
                    .listStyle(.plain)
                }
                
                // Contador y botones de acción
                if !tasks.isEmpty {
                    VStack(spacing: 15) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(completed.count)/\(tasks.count) completadas")
                                    .font(.headline)
                                
                                if completed.count == tasks.count && !tasks.isEmpty {
                                    Text("Todas completadas")
                                        .font(.caption)
                                        .foregroundColor(.green)
                                }
                            }
                            .padding(.leading)
                            
                            Spacer()
                            
                            if isEditing {
                                Button("Terminar Edición") {
                                    withAnimation {
                                        isEditing = false
                                        editingIndex = nil
                                    }
                                }
                                .buttonStyle(.borderedProminent)
                                .padding(.trailing)
                            }
                        }
                        
                        HStack(spacing: 20) {
                            Button("Borrar completadas") {
                                deleteCompletedTasks()
                            }
                            .buttonStyle(.bordered)
                            .disabled(completed.isEmpty)
                            
                            Button("Borrar todas") {
                                deleteAllTasks()
                            }
                            .buttonStyle(.bordered)
                            .tint(.red)
                            .disabled(tasks.isEmpty)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("To-Do List")
            .toolbar {
                if !tasks.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(isEditing ? "Listo" : "Editar") {
                            withAnimation {
                                if isEditing {
                                    // Si estamos editando una tarea, cancelar antes de salir
                                    if editingIndex != nil {
                                        cancelEditing()
                                    }
                                }
                                isEditing.toggle()
                            }
                        }
                    }
                }
                
                if isEditing {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                }
            }
            .onDisappear {
                // Cancelar edición si salimos de la vista
                if editingIndex != nil {
                    cancelEditing()
                }
            }
        }
    }
    
    // MARK: - Funciones de edición
    
    private func startEditingTask(at index: Int) {
        editingIndex = index
        editingText = tasks[index]
    }
    
    private func saveEditedTask() {
        guard let index = editingIndex,
              !editingText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        withAnimation {
            tasks[index] = editingText
            editingIndex = nil
            editingText = ""
        }
    }
    
    private func cancelEditing() {
        withAnimation {
            editingIndex = nil
            editingText = ""
        }
    }
    
    private func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
        
        // Ajustar los índices en completed
        var newCompleted: Set<Int> = []
        
        for oldIndex in completed {
            var newIndex = oldIndex
            
            for sourceIndex in source {
                if sourceIndex < oldIndex {
                    newIndex -= 1
                }
            }
            
            if destination <= oldIndex {
                newIndex += 1
            }
            
            newCompleted.insert(newIndex)
        }
        
        completed = newCompleted
    }
    
    // MARK: - Funciones existentes
    
    private func toggleCompletion(for index: Int) {
        guard !isEditing else { return } // No permitir completar mientras se edita
        
        withAnimation {
            if completed.contains(index) {
                completed.remove(index)
            } else {
                completed.insert(index)
            }
        }
    }
    
    private func deleteTask(at index: Int) {
        withAnimation {
            // Si estamos editando esta tarea, cancelar primero
            if editingIndex == index {
                cancelEditing()
            }
            
            completed.remove(index)
            tasks.remove(at: index)
            
            // Ajustar índice de edición si es necesario
            if let editingIdx = editingIndex, editingIdx > index {
                editingIndex = editingIdx - 1
            }
            
            // Ajustar índices en completed
            var newCompleted: Set<Int> = []
            for oldIndex in completed {
                if oldIndex > index {
                    newCompleted.insert(oldIndex - 1)
                } else {
                    newCompleted.insert(oldIndex)
                }
            }
            completed = newCompleted
        }
    }
    
    private func deleteCompletedTasks() {
        withAnimation {
            // Borrar en orden inverso para no afectar índices
            for index in completed.sorted(by: >) {
                // Si estamos editando una tarea que será borrada, cancelar
                if editingIndex == index {
                    cancelEditing()
                }
                tasks.remove(at: index)
            }
            
            // Ajustar índice de edición
            if let editingIdx = editingIndex {
                var adjustments = 0
                for completedIndex in completed.sorted() {
                    if completedIndex < editingIdx {
                        adjustments += 1
                    }
                }
                editingIndex = editingIdx - adjustments
            }
            
            // Reiniciar completed
            completed.removeAll()
        }
    }
    
    private func deleteAllTasks() {
        withAnimation {
            tasks.removeAll()
            completed.removeAll()
            cancelEditing() // Cancelar cualquier edición en curso
            isEditing = false
        }
    }
}

#Preview {
    ToDo()
}
