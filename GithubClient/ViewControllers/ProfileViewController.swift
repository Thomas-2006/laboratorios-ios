//
//  ProfileViewController.swift
//  GithubClient
//
//  Created by Usuario invitado on 31/7/26.
//

import Foundation

@MainActor
class ProfileViewController: ObservableObject {
    @Published var userInfo: UserInfo? = nil
    @Published var isLoading: Bool = false
    @Published var errorMsg: String?

    private let githubService: GithubService

    init(service: GithubService = .shared) {
        self.githubService = service
    }

    func loadProfile() async {
        isLoading = true
        do {
            self.userInfo = try await githubService.getProfile()
            errorMsg = nil
        } catch {
            errorMsg = error.localizedDescription
        }
        isLoading = false
    }
}
