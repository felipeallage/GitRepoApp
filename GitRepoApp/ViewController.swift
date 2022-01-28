//
//  ViewController.swift
//  GitRepoApp
//
//  Created by Admin on 1/11/22.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RepositoryApiDelegate {
    
    @IBOutlet weak var repositoryTableView: UITableView!
    
    var repositoryApi = RepositoryApi()
    
    var repositoryResults: UserInfoContainer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repositoryTableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "ID")
        repositoryTableView.delegate = self
        repositoryTableView.dataSource = self
        repositoryApi.delegate = self
        repositoryApi.getRepository()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryResults?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ID") as! RepoTableViewCell
        if let repo = repositoryResults, let items = repo.items  {
            let repository = items[indexPath.row]
            cell.repoNameLabel.text = repository.name
            cell.repoAuthorLabel.text = repository.full_name
            if let starcount = repository.stargazers_count {
                cell.starCountLabel.text = String(format: "\u{2b50}\(starcount)K")
            }
            
            if let owner = repository.owner, let imagePath = owner.avatar_url {
                cell.repoImageView.kf.setImage(with: URL(string: imagePath))
            }
        }
        return cell
    }
    
    
    
    func didGetRepository(repository: UserInfoContainer) {
        self.repositoryResults = repository
        repositoryTableView.reloadData()
    }
    

}

