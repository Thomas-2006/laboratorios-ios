//
//  ContentView.swift
//  GithubClient
//
//  Created by Usuario invitado on 13/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        TabView (selection: $selection) {
            RepoList()
                .tabItem{
                    Label("Repositorios", systemImage: "arrow.branch")
                }
                .tag(0)
            RepoForm(selectedTab: $selection)
                .tabItem{
                    Label("Crear Repo", systemImage: "plus.circle")
                }
                .tag(1)
            Profile()
                .tabItem{
                    Label("Perfil", systemImage: "person")
                }
                .tag(2)
        }
    }
}

#Preview {
    ContentView()
}