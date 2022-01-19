//
//  Api.swift
//  GitRepoApp
//
//  Created by Admin on 1/17/22.
//

import Foundation

protocol RepositoryApiDelegate {
    
    func didGetRepository(repository: UserInfoContainer)
    
}

struct RepositoryApi {
    
    var delegate: RepositoryApiDelegate?
    
    func getRepository() {
        let link = Constants.repoLink
        guard let url = URL(string: link) else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                let repositoryList = try! JSONDecoder().decode(UserInfoContainer.self, from: data)
                DispatchQueue.main.async {
                    delegate?.didGetRepository(repository: repositoryList)
                }
            }
        }.resume()
    }
}
