//
//  FollowersCollectionViewCell.swift
//  GitRepoApp
//
//  Created by Admin on 2/8/22.
//

import UIKit
import Kingfisher

class FollowersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var followerImageView: UIImageView!
    
    @IBOutlet weak var followerNameLabel: UILabel!
    
    func updateCell(follower: Owner) {
        
        if let imagePath = follower.avatar_url, let name = follower.login {
            followerImageView.kf.setImage(with: URL(string: imagePath))
            followerNameLabel.text = name
        }
    }
}
