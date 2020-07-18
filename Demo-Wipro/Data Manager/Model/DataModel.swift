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
    let title : String?
    let rows : [Rows]?
}

// MARK: - Row
struct Rows: Codable {
    let title : String?
    let description : String?
    let imageHref : String?
}
