//
//  Organization.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 23/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import Foundation

struct Organization: Decodable {
    let name: String?
    let slug: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case slug = "slug"
    }
}
