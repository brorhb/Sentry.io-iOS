//
//  Tags.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 23/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import Foundation

struct Tags: Codable {
    let value: String?
    let key: String?
    
    private enum CodingKeys: String, CodingKey {
        case value = "value"
        case key = "key"
    }
}
