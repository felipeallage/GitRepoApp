//
//  Model.swift
//  GitRepoApp
//
//  Created by Admin on 1/12/22.
//

import Foundation


class UserInfoContainer: Codable {
    
    var total_count: Int
    var incomplete_results: Bool
    var items: [Repository]
    
}

