//
//  DataModel.swift
//  Demo-Wipro
//
//  Created by Vineeta on 18/07/20.
//  Copyright © 2020 Vineeta. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct DataModel: Codable {
    let title: String
    let rows: [Row]
}

// MARK: - Row
struct Row: Codable {
    let title, rowDescription: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}
