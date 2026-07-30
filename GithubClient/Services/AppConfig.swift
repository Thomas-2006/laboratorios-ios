//
//  AppConfig.swift
//  GithubClient
//
//  Created by Usuario invitado on 21/7/26.
//
import Foundation

enum AppConfig {
    private static let filename = "config"
    
    private enum Keys {
        static let apiBaseURL = "API_BASE_URL"
        static let apiToken = "API_TOKEN"
    }
    
    private static var config: [String: Any] {
        guard
            let url = Bundle.main.url(
                forResource: filename, withExtension: "plist"
            ),
            let data = try? Data(contentsOf: url),
            let plist = try? PropertyListSerialization.propertyList(
                from: data,
                options: [],
                format: nil
            ),
            let dict = plist as? [String: Any]
                
        else {
            fatalError("No se pudo cargar \(filename).plist")
        }
        
        return dict
    }
    
    static var apiBaseURL: String {
        guard let value = config[Keys.apiBaseURL] as? String else {
            fatalError("No se pudo obtener la URL de base de config.plist")
        }
        return value
    }
    
    static var apiToken: String {
        guard let value = config[Keys.apiToken] as? String else {
            fatalError("No se pudo obtener el token de config.plist")
        }
        return value
    }
}
