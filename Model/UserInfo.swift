//
//  File.swift
//  GitRepoApp
//
//  Created by Admin on 1/12/22.
//

import Foundation

class UserInfo: Codable {
    
    var id: Int
    var node_id: String
    var name: String
    var full_name: String
    var Private : Bool
    var owner: Owner
    
}

