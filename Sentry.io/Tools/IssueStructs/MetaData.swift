//
//  MetaData.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 23/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import Foundation

struct MetaData: Codable {
    let type: String?
    let value: String?
    
    private enum CodingKeys: String, CodingKey {
        case type = "type"
        case value = "value"
    }
}
