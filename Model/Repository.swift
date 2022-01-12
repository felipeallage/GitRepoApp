//
//  Repository.swift
//  GitRepoApp
//
//  Created by Admin on 1/12/22.
//

import Foundation

class Repository: Codable {
    
    var user: UserInfo?
    var html_url: String?
    var description: String?
    var fork: Bool?
    var url: String?
    var forks_url: String?
    var keys_url: String?
    var collaborators_url: String?
    var teams_url: String?
    var hooks_url: String?
    var issue_events_url: String?
    var events_url: String?
    var assingnees_url: String?
    var branches_url: String?
    var tags_url: String?
    var blobs_url: String?
    var git_tags_url: String?
    var git_refs_url: String?
    var trees_url: String?
    var statuses_url: String?
    var languages_url: String?
    var stargazer_url: String?
    var conrtibutors_url: String?
    var subscribers_url: String?
    var subscription_url: String?
    var commits_url: String?
    var git_commits_url: String?
    var comments_url: String?
    var issue_coment_url: String?
    var contents_url: String?
    var compare_url: String?
    var merges_url: String?
    var archive_url: String?
    var downloads_url: String?
    var issues_url: String?
    var pulls_url: String?
    var milestones_url: String?
    var notifications_url: String?
    var labels_url: String?
    var releases_url: String?
    var deployments_url: String?
    var created_at: String?
    var updated_at: String?
    var pushed_at: String?
    var git_url: String?
    var ssh_url: String?
    var clone_url: String?
    var svn_url: String?
    var homepage: String?
    var size: Int?
    var stargazers_count: Int?
    var watchers_count: Int?
    var language: String?
    var has_issues: Bool?
    var has_projects: Bool?
    var has_downloads: Bool?
    var has_wiki: Bool?
    var has_pages: Bool?
    var forks_count: Int?
    var mirror_url: Bool?
    var archived: Bool?
    var disabled: Bool?
    var open_issues_count: Int?
    var license: License?
    var allow_forking: Bool?
    var is_template: Bool?
    var topics: [String]?
    var visibility: String?
    var forks: Int?
    var open_issues: Int?
    var watchers: Int?
    var default_branch: String?
    var score: Int?
    
}



