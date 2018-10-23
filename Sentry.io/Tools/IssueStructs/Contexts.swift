//
//  Context.swift
//  Sentry.io
//
//  Created by Bror Hammer Brurberg on 23/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import Foundation

struct Contexts: Decodable {
    let os: OS?
    let browser: Browser?
    
    private enum CodingKeys: String, CodingKey {
        case os = "os"
        case browser = "browser"
    }
}
