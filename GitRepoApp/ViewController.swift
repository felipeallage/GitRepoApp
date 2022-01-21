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
    
    var repositoryResults: UserInfoContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repositoryTableView.register(UINib(nibName: "RepoTableViewCell", bundle: nil), forCellReuseIdentifier: "ID")
        repositoryTableView.delegate = self
        repositoryTableView.dataSource = self
        repositoryApi.delegate = self
        repositoryApi.getRepository()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryResults.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ID") as! RepoTableViewCell
        let repository = repositoryResults.items[indexPath.row]
        cell.repoNameLabel.text = repository?.user?.name
        cell.repoAuthorLabel.text = repository?.user?.full_name
        cell.starCountLabel.text = (String(describing: repository?.stargazers_count))
        if let imagePath = repository?.user?.owner?.avatar_url {
            cell.repoImageView.kf.setImage(with: URL(string: imagePath))
        }
        return cell
    }

    func didGetRepository(repository: UserInfoContainer) {
        self.repositoryResults = repository
        repositoryTableView.reloadData()
    }
    
}

