//
//  Sentry.io
//
//  Created by Bror Brurberg on 15/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import UIKit
import Foundation

class HTTPHandler {
    
    static func getProjectsJSON (token: String, completionHandler: @escaping (Data?) -> (Void)) {
        let url = URL(string: "https://sentry.io/api/0/projects/")
        let auth: String = "Bearer \(token)"
        
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Authorization": auth]
        
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url!) { data, res, err in
            if let data = data {
                let httpres = res as! HTTPURLResponse
                let statusCode = httpres.statusCode
                print("request completed with statuscode \(statusCode)")
                if statusCode == 200 {
                    print("return to the completion handler with data")
                    completionHandler(data as Data)
                }
            } else if let err = err {
                print("**There was an error making the HTTP Request**")
                print(err.localizedDescription)
                completionHandler(nil)
            }
        }
        task.resume()
    }
    
    static func getIssuesJSON (token: String, orgSlug: String, projectSlug: String, completionHandler: @escaping (Data?) -> (Void)) {
        let url = URL(string: "https://sentry.io/api/0/projects/\(orgSlug)/\(projectSlug)/events/")
        let auth: String = "Bearer \(token)"
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Authorization": auth]
        
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url!) { data, res, err in
            if let data = data {
                let httpres = res as! HTTPURLResponse
                let statusCode = httpres.statusCode
                print("request completed with statuscode \(statusCode)")
                if statusCode == 200 {
                    print("return to the completion handler with data")
                    completionHandler(data as Data)
                }
            } else if let err = err {
                print("**There was an error making the HTTP Request**")
                print(err.localizedDescription)
                completionHandler(nil)
            }
        }
        task.resume()
    }
}
