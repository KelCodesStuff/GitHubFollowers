//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Kelvin Reid on 3/7/20.
//  Copyright © 2020 Kelvin Reid. All rights reserved.
//

import Foundation

class NetworkManager {
   static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    // completion handler returns a result type
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        // failure type
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // failure type
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            // failure type
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            // failure type
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                // success type
                completed(.success(followers))
            } catch {
                // failure type
                completed(.failure(.invalidData))
                
            }
        }
        
        task.resume()
    }
}
