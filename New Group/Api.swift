//
//  Api.swift
//  GitRepoApp
//
//  Created by Admin on 1/17/22.
//

import Foundation

protocol GitRepoDelegate {
    
    func didGetRepo(repo: UserInfoContainer)
    
}

struct GitRepoApi {
    
    var delegate: GitRepoDelegate?
    
    func getRepo() {
        let link = "https://api.github.com/search/repositories?q=language&=swift&sort=stars"
        guard let url = URL(string: link) else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                let repository = try! JSONDecoder().decode(UserInfoContainer.self, from: data)
                DispatchQueue.main.async {
                    delegate?.didGetRepo(repo: repository)
                }
            }
        }.resume()
    }
}
