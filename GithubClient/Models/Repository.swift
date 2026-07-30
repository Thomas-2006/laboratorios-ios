//
//  Repository.swift
//  GithubClient
//
//  Created by Usuario invitado on 14/7/26.
//
import Foundation

struct Repository: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String?
    let language: String?
    let owner: UserInfo
    
    static let sampleData: [Repository] = [
            Repository(
                id: 1,
                name: "Ejemplo REPO",
                description: "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto.",
                language: "Swift",
                owner: UserInfo(
                    login: "pabloperezmartinez",
                    name: "Pablo Pérez Martínez",
                    avatarUrl: "https://avatars.githubusercontent.com/u/48026030?v=4",
                    bio: "Esta es una Bio de prueba"
                )
            ),
            Repository(
                id: 2,
                name: "DataCruncher",
                description: "A powerful data processing tool for large datasets.",
                language: "Python",
                owner: UserInfo(
                    login: "sarah_jones",
                    name: "Sarah Jones",
                    avatarUrl: "https://avatars.githubusercontent.com/u/12345678?v=4",
                    bio: "Data scientist and Python enthusiast."
                )
            ),
            Repository(
                id: 3,
                name: "PixelArtist",
                description: "An intuitive pixel art editor for game developers.",
                language: "JavaScript",
                owner: UserInfo(
                    login: "mike_lee",
                    name: "Mike Lee",
                    avatarUrl: "https://avatars.githubusercontent.com/u/87654321?v=4",
                    bio: "Game developer and digital artist."
                )
            ),
            Repository(
                id: 4,
                name: "CloudSecure",
                description: "Cloud security tools and best practices for enterprises.",
                language: "Go",
                owner: UserInfo(
                    login: "anna_kim",
                    name: "Anna Kim",
                    avatarUrl: "https://avatars.githubusercontent.com/u/11223344?v=4",
                    bio: "Security engineer focused on cloud infrastructure."
                )
            )
        ]
}

