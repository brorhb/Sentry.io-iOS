//
//  Issue.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 23/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import Foundation

struct Issue: Decodable {
    let eventID: String?
    let tags: [Tags]?
    let context: Contexts
}
