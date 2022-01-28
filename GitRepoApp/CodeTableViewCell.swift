//
//  CodeTableViewCell.swift
//  GitRepoApp
//
//  Created by Admin on 1/28/22.
//

import UIKit

class CodeTableViewCell: UITableViewCell {
    
    static let identifier = "CodeTableViewCell"
    
    let repoImageView = UIImageView()

    let repoNameLabel = UILabel()
    
    let repoAuthorLabel = UILabel()
    
    let starCountLabel = UILabel()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        contentView.addSubview(repoImageView)
        contentView.addSubview(repoNameLabel)
        contentView.addSubview(repoAuthorLabel)
        contentView.addSubview(starCountLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        repoImageView.frame = CGRect(x: 5, y: 5, width: 70, height: 70)
    }
}

