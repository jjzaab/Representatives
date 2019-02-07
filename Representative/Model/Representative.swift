//
//  Representative.swift
//  Representative
//
//  Created by XMS_JZhan on 2/7/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import Foundation

struct TopLevelJson: Codable {
    let results: [Representative]
}

struct Representative: Codable {
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}
