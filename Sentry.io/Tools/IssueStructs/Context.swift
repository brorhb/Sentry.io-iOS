//
//  Context.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 23/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import Foundation

struct Context: Decodable {
    let os: OS
    let browser: Browser
    let dateReceived: String?
    let dateCreated: String?
    let metaData: MetaData
    let platform: String?
}
