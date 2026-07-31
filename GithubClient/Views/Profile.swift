//
//  Profile.swift
//  GithubClient
//
//  Created by Usuario invitado on 10/7/26.
//

import SwiftUI

struct Profile: View {
    @StateObject private var viewController = ProfileViewController()

    var body: some View {
        NavigationStack {
            Group {
                if viewController.isLoading {
                    ProgressView("Cargando Perfil...")
                } else if let errorMsg = viewController.errorMsg {
                    Text(errorMsg)
                        .foregroundStyle(.red)
                        .padding()
                } else if let userInfo = viewController.userInfo {
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: userInfo.avatarUrl)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Image(uiImage: .imageNotFound)
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding(.bottom, 8)

                        Text(userInfo.name ?? userInfo.login)
                            .font(.title)

                        Text("@\(userInfo.login)")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                            .padding(.top, 2)

                        if let bio = userInfo.bio, !bio.isEmpty {
                            Text(bio)
                                .font(.caption)
                                .padding(.top)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Perfil")
        }
        .onAppear {
            Task {
                await viewController.loadProfile()
            }
        }
    }
}

#Preview {
    Profile()
}
