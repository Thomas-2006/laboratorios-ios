//
//  RepoListViewController.swift
//  GithubClient
//
//  Created by Usuario invitado on 21/7/26.
//

import Foundation

@MainActor

class RepoListViewController: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var isLoading: Bool = false
    @Published var errorMsg: String?
    
    private let githubService: GithubService
    
    init(service: GithubService = .shared ) {
        self.githubService = service
    }
    
    func loadRepositories () async {
        isLoading = true
        do {
            self.repositories = try await githubService.getRepositories()
        } catch {
            errorMsg = error.localizedDescription
        }
        isLoading = false
    }
}
