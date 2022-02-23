//
//  ViewController.swift
//  GitRepoApp
//
//  Created by Admin on 1/11/22.
//

import UIKit
import Kingfisher

class RepoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RepositoryApiDelegate {
    
    @IBOutlet weak var repositoryTableView: UITableView!
    
    var repositoryApi = RepositoryApi()
    
    var repositoryResults: UserInfoContainer?
    
    var repoAccumulated: [Repository] = []
    
    var pageNumber: Int = 1
    
    var hasNextPage = false
    
    var isSearching = false
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repositoryTableView.register(NewTableViewCell.self, forCellReuseIdentifier: NewTableViewCell.identifier)
        repositoryTableView.delegate = self
        repositoryTableView.dataSource = self
        repositoryApi.delegate = self
        repositoryApi.getRepository(link: Constants.repoLink)
        repositoryTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
    }
    
    @objc func didPullToRefresh() {
        repoAccumulated.removeAll()
        repositoryApi.getRepository(link: Constants.repoLink)
        pageNumber = 1
        hasNextPage = false
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoAccumulated.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewTableViewCell.identifier) as! NewTableViewCell
        let repository = repoAccumulated[indexPath.row]
        cell.update(model: repository)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func didGetRepository(repository: UserInfoContainer, nextPage: Bool) {
        if let items = repository.items {
            self.repoAccumulated.append(contentsOf: items)
        }
        self.refreshControl.endRefreshing()
        repositoryTableView.reloadData()
        haveNextPage(value: nextPage)
        isSearching = false
    }
    
    func haveNextPage(value: Bool) {
        if value {
            pageNumber += 1
        }
        hasNextPage = value
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if hasNextPage && indexPath.row >= self.repoAccumulated.count - 10 && !isSearching {
            repositoryApi.getRepository(link: Constants.baseLink + "\(pageNumber)")
            isSearching = true
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "RepoToOwnerSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RepoToOwnerSegue" {
            if let viewController = segue.destination as? OwnerViewController, let indexPath = self.repositoryTableView.indexPathForSelectedRow {
                viewController.repository = self.repoAccumulated[indexPath.row]
            }
        }
    }
}

