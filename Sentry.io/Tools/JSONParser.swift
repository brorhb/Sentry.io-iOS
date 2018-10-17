//
//  ProjectDataProcessor.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 17/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import Foundation

class JSONParser {
    static func parse(data: Data) -> [Project]? {
        guard let project = try? JSONDecoder().decode([Project].self, from: data) else {
            print("Could not map JSON to projects")
            return nil
        }
        print("project", project)
        return project
    }
}
