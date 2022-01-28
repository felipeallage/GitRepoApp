//
//  NewTableViewCell.swift
//  GitRepoApp
//
//  Created by Admin on 1/28/22.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    static let identifier = "NewTableViewCell"
    
    lazy var repoImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    lazy var repoNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var repoAuthorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    lazy var starCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    lazy var labelStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [repoAuthorLabel, starCountLabel])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var vStack: UIStackView = {
       let imageStack = UIStackView(arrangedSubviews: [repoNameLabel, labelStack])
        imageStack.axis = .vertical
        imageStack.alignment = .leading
        imageStack.distribution = .fill
        imageStack.spacing = 10
        imageStack.translatesAutoresizingMaskIntoConstraints = false
        return imageStack
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(repoImageView)
        self.contentView.addSubview(vStack)
        repoImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
                repoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 10).isActive = true
        repoImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
                repoImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true

                vStack.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true

                vStack.leadingAnchor.constraint(
                    equalTo: self.repoImageView.trailingAnchor,
                    constant: 10).isActive = true

                self.contentView.trailingAnchor.constraint(
                    equalTo: self.vStack.trailingAnchor,
                    constant: 10
                ).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }

}
