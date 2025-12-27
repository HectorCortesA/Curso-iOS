//
//  NavBar.swift
//  CursoiOS
//
//  Created by Hector Cortes  on 26/12/25.
//

import SwiftUI

struct NavBar: View {
   
        init(){
            let item = UITabBarItemAppearance()
            item.normal.badgeBackgroundColor = .systemGray
            item.selected.badgeBackgroundColor = .systemGreen
            
            item.selected.iconColor = .systemGray //Color de select del icon
            item.selected.titleTextAttributes = [.foregroundColor: UIColor.systemGray] //Color de teto seleccionado
            
            let appearance = UITabBarAppearance()
            appearance.stackedLayoutAppearance = item
            
            UITabBar.appearance().standardAppearance = appearance
        }
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("Inicio", systemImage: "house")
                        }
                        ExploreView()
                            .tabItem {
                                Label("Explorar", systemImage: "magnifyingglass")
                            }
                            .badge(5) // Ejemplo de badge
            
                        FavoritesView()
                            .tabItem {
                                Label("Favoritos", systemImage: "heart")
                            }
                        
                        // Pestaña 4: Perfil
                        ProfileView()
                            .tabItem {
                                Label("Perfil", systemImage: "person")
                            }
                            .badge("Nuevo") // Ejemplo de badge con texto
                    }
                    .accentColor(.blue) // Color para el estado seleccionado en SwiftUI
                }
            }
            
    


// Vistas de ejemplo para cada pestaña
struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Página de Inicio")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Inicio")
        }
    }
}

struct ExploreView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(1...10, id: \.self) { item in
                    Text("Elemento \(item)")
                }
            }
            .navigationTitle("Explorar")
        }
    }
}

struct FavoritesView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "heart.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.red)
                    .padding()
                
                Text("Tus Favoritos")
                    .font(.title)
                
                Spacer()
            }
            .navigationTitle("Favoritos")
        }
    }
}

struct ProfileView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .leading) {
                            Text("Héctor Cortes")
                                .font(.title2)
                            Text("Usuario Premium")
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Section("Configuración") {
                    Button("Editar Perfil") {}
                    Button("Privacidad") {}
                    Button("Notificaciones") {}
                }
            }
            .navigationTitle("Perfil")
        }
    }
}

#Preview {
    NavBar()
}
