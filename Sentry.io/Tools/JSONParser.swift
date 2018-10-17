//
//  JSONParser.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 17/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import Foundation

class JSONParser {
    static func parse (data: Data) -> [Project]? {
        do {
            let decoder = JSONDecoder()
            let json = try decoder.decode([Project].self, from: data)
            return json
        } catch let parseErr {
            print("There was an error parsing JSON \(parseErr.localizedDescription)")
        }
        return nil
    }
}
