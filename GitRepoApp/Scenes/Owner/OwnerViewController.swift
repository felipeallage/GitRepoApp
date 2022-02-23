//
//  OwnerViewController.swift
//  GitRepoApp
//
//  Created by Admin on 2/8/22.
//

import Foundation
import UIKit
import Kingfisher

class OwnerViewController: UIViewController, UICollectionViewDataSource, OwnerApiDelegate, UICollectionViewDelegateFlowLayout {
    
    var ownerApi = OwnerApi()
    
    var repository: Repository!
    
    var followers: [Owner] = []
    
    var owner: Owner!

    @IBOutlet weak var ownerImageView: UIImageView!
    
    @IBOutlet weak var ownerNameLabel: UILabel!
    
    @IBOutlet weak var ownerBioLabel: UILabel!
    
    @IBOutlet weak var followersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ownerApi.delegate = self
        followersCollectionView.dataSource = self
        followersCollectionView.delegate = self
        followersCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        getLinks()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FollowersCollectionViewCell", for: indexPath) as! FollowersCollectionViewCell
        cell.updateCell(follower: followers[indexPath.row])
        return cell
    }
    
    func didGetOwner(owner: Owner) {
        self.owner = owner
        updateOwner()
    }
    
    func didGetFollowers(followers: [Owner]) {
        if followers.count <= 0 {
            followersCollectionView.isHidden = true
        } else {
            self.followers = followers
            followersCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 128)
    }
    
    func updateOwner() {
        if let name = owner.login, let bio = owner.bio {
            ownerNameLabel.text = name
            ownerBioLabel.text = bio
        }
        if let imagePath = owner.avatar_url {
            ownerImageView.kf.setImage(with: URL(string: imagePath))
        }
    }
    
    func getLinks() {
        if let owner = repository.owner, let ownerLink = owner.url, let followersLink = owner.followers_url {
            ownerApi.getOwner(link: ownerLink)
            ownerApi.getFollowers(link: followersLink)
        }
    }
}

