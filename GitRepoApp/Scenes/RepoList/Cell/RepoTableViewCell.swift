//
//  RepoTableViewCell.swift
//  GitRepoApp
//
//  Created by Admin on 1/17/22.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoAuthorLabel: UILabel!
    
    @IBOutlet weak var repoNameLabel: UILabel!
    
    @IBOutlet weak var repoImageView: UIImageView!

    @IBOutlet weak var starCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
