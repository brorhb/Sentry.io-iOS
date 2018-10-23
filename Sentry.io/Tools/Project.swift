//
//  Project.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 17/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import Foundation

struct Project: Decodable {
    let id: String?
    let name: String?
    let status: String?
    let isBookmarked: Bool?
    let platform: String?
    let color: String?
    let slug: String?
    let organization: Organization?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case status = "status"
        case isBookmarked = "isBookmarked"
        case platform = "platform"
        case color = "color"
        case slug = "slug"
        case organization = "organization"
    }
}
