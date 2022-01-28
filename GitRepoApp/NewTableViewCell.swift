//
//  NewTableViewCell.swift
//  GitRepoApp
//
//  Created by Admin on 1/28/22.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    static let identifier = "NewTableViewCell"
    
    let repoImageView = UIImageView()
    
    let repoNameLabel = UILabel()
    
    let repoAuthorLabel = UILabel()
    
    let starCountLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(repoImageView)
        contentView.addSubview(repoNameLabel)
        contentView.addSubview(repoAuthorLabel)
        contentView.addSubview(starCountLabel)
        repoAuthorLabel.font = .systemFont(ofSize: 17, weight: .bold)
        repoAuthorLabel.textColor = .green
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        repoImageView.frame = CGRect(x: 5, y: 5, width: 70, height: contentView.frame.size.height-10)
        repoNameLabel.frame = CGRect(x: 10+repoImageView.frame.size.width, y: 0, width: contentView.frame.size.width - 10 - repoImageView.frame.size.width, height: 30)
        repoAuthorLabel.frame = CGRect(x: 10+repoImageView.frame.size.width, y: 10+repoNameLabel.frame.size.height, width: contentView.frame.size.width - 10 - repoImageView.frame.size.width-100, height: 30)
        starCountLabel.frame = CGRect(x: 10+repoImageView.frame.size.width+repoAuthorLabel.frame.width, y: 10+repoNameLabel.frame.size.height, width: contentView.frame.size.width - 10 - repoImageView.frame.size.width - repoAuthorLabel.frame.size.width, height: 30)
    }

}
