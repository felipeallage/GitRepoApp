//
//  OwnerApi.swift
//  GitRepoApp
//
//  Created by Admin on 2/8/22.
//

import Foundation

protocol OwnerApiDelegate {
    
    func didGetOwner(owner: Owner)
    
    func didGetFollowers(followers: [Owner])
    
}

struct OwnerApi {
    
    var delegate: OwnerApiDelegate?
    
    func getOwner(link: String) {
        
        guard let url = URL(string: link) else {
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                let owner = try! JSONDecoder().decode(Owner.self, from: data)
                DispatchQueue.main.async {
                    delegate?.didGetOwner(owner: owner)
                }
            }
        }.resume()
    }
    
    func getFollowers(link: String) {
        
        guard let url = URL(string: link) else {
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                let followers = try! JSONDecoder().decode([Owner].self, from: data)
                DispatchQueue.main.async {
                    delegate?.didGetFollowers(followers: followers)
                }
            }
        }.resume()
        
    }
    
    
}
