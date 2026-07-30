//  RepoList.swift
//  GithubClient
//
//  Created by Usuario invitado on 10/7/26.
//

import SwiftUI

struct RepoList: View {
    @StateObject private var viewController = RepoListViewController()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewController.isLoading {
                    ProgressView("Cargando Repositorios...")
                } else if let errorMsg = viewController.errorMsg {
                    Text(errorMsg)
                        .foregroundStyle(.red)
                        .padding()
                } else {
                    List(viewController.repositories) { repo in
                        RepoItem(repository: repo)
                    }
                }
            }
            .navigationTitle("Repositorios")
        }
        .onAppear {
            Task {
                await viewController.loadRepositories()
            }
        }
    }
}

#Preview {
    RepoList()
}
