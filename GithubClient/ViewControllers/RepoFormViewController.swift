//
//  RepoFormViewController.swift
//  GithubClient
//
//  Created by Usuario invitado on 24/7/26.
//

import Foundation

@MainActor
class RepoFormViewController: ObservableObject {
    
    @Published var repoName: String = ""
    @Published var repoDescription: String = ""
    @Published var repository: Repository? = nil
    @Published var isLoading: Bool = false
    @Published var errorMsg: String?
    
    private let githubService: GithubService
    
    init(service: GithubService = .shared ) {
        self.githubService = service
    }
    
    func createRepository() async {
        isLoading = true
        do {
            self.repository = try await githubService.createRepository(name: repoName,
                                                                       description: repoDescription)
            self.repoName = ""
            self.repoDescription = ""
            errorMsg = nil
            
        } catch {
            errorMsg = error.localizedDescription
            
        }
        isLoading = false
    }
}