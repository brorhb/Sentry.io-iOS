//
//  Issue.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 23/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import Foundation

struct Issue: Codable {
    let eventID: String?
    let tags: [Tags]?
    let contexts: Contexts?
    let dateReceived: String?
    let dateCreated: String?
    let metaData: MetaData?
    let platform: String?
    let message: String?
    let type: String?
    
    private enum CodingKeys: String, CodingKey {
        case eventID = "eventID"
        case tags = "tags"
        case contexts = "contexts"
        case dateReceived = "dateReceived"
        case dateCreated = "dateCreated"
        case metaData = "metadata"
        case platform = "platform"
        case message = "message"
        case type = "type"
    }
}
