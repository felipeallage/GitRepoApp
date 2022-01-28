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
        repositoryTableView.register(NewTableViewCell.self, forCellReuseIdentifier: NewTableViewCell.identifier)
        repositoryTableView.delegate = self
        repositoryTableView.dataSource = self
        repositoryApi.delegate = self
        repositoryApi.getRepository()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryResults?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewTableViewCell.identifier) as! NewTableViewCell
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func didGetRepository(repository: UserInfoContainer) {
        self.repositoryResults = repository
        repositoryTableView.reloadData()
    }
    

}

