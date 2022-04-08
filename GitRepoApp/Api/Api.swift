//
//  Api.swift
//  GitRepoApp
//
//  Created by Admin on 1/17/22.
//

import Foundation

protocol RepositoryApiDelegate {
    
    func didGetRepository(repository: UserInfoContainer, nextPage: Bool)
    
}

struct RepositoryApi {
    
    var delegate: RepositoryApiDelegate?
    
    func getRepository(link: String) {
        
        guard let url = URL(string: link) else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {data, response, error in
            var nextPageExists = false
            if let data = data, let response = response as? HTTPURLResponse{
                if let nextPage = response.allHeaderFields["Link"] as? String {
                    nextPageExists = nextPage.contains("next")
                }
                let repositoryList = try! JSONDecoder().decode(UserInfoContainer.self, from: data)
                DispatchQueue.main.async {
                    delegate?.didGetRepository(repository: repositoryList, nextPage: nextPageExists)
                }
            }
        }.resume()
    }
}
