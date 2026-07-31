//
//  GithubService.swift
//  GithubClient
//
//  Created by Usuario invitado on 21/7/26.
//
 
import Foundation
import Alamofire
 
class GithubService {
    
    static let shared = GithubService()
    
    private let baseUrl = AppConfig.apiBaseURL
    
    private init() {}
    
    private var headers: HTTPHeaders {
        [
            .authorization(
                bearerToken: AppConfig.apiToken
            ),
            .accept("application/vnd.github+json")
        ]
    }
    
    func getProfile() async throws -> UserInfo {

        let response = await AF.request(
            "\(baseUrl)/user",
            method: .get,
            headers: headers
        )
        .validate(statusCode: 200..<300)
        .serializingDecodable(UserInfo.self)
        .response

        if let data = response.data,
           let json = String(
                data: data,
                encoding: .utf8
           ) {
            print("***** Respuesta del perfil de usuario *****")
            print(json)
        }

        switch response.result {
            case .success(let userInfo):
                return userInfo
            case .failure(let error):
                print("Error al obtener el perfil de usuario:")
                print(error.localizedDescription)
                throw error
        }
    }

    func getRepositories() async throws -> [Repository] {
        
        let response = await AF.request(
            "\(baseUrl)/user/repos",
            method: .get,
            parameters: [
                "sort": "created",
                "direction": "desc",
                "per_page": 100,
                "affiliation": "owner",
                "t": Date().timeIntervalSince1970
            ],
            encoding: URLEncoding.default,
            headers: headers
        )
        .validate(statusCode: 200..<300)
        .serializingDecodable([Repository].self)
        .response
        
        if let data = response.data,
           let json = String(
                data: data,
                encoding: .utf8
           ) {
            print("***** Respuesta de GitHub *****")
            print(json)
        }
        
        switch response.result {
            case .success(let repositories):
                return repositories
            case .failure(let error):
                print("Error al obtener repositorios:")
                print(error.localizedDescription)
                throw error
        }
    }
    
    func createRepository(name: String, description: String) async throws -> Repository {
        let response = await AF.request(
            "\(baseUrl)/user/repos",
            method: .post,
            parameters: [
                "name": name,
                "description": description
            ],
            encoding: JSONEncoding.default,
            headers: headers
        )
            .validate(statusCode: 200..<300)
            .serializingDecodable(Repository.self)
            .response
        
        if let data = response.data,
           let json = String(
            data: data,
            encoding: .utf8
           ) {
            print("***** Respuesta al crear repositorio *****")
            print(json)
        }
        
        switch response.result {
        case .success(let repository):
            return repository
            
        case .failure(let error):
            print(error)
            throw error
        }
    }
}