//
//  ProjectDataProcessor.swift
//  Sentry.io
//
//  Created by Bror Brurberg on 17/10/2018.
//  Copyright © 2018 Bror Brurberg. All rights reserved.
//

import Foundation

let json = """
[
  {
    "eventID": "e19e5d3441ac4551b7f034ce1450a4d3",
    "packages": {},
    "dist": null,
    "_meta": {
      "user": null,
      "context": null,
      "entries": {},
      "contexts": null,
      "message": null,
      "packages": null,
      "tags": {},
      "sdk": null
    },
    "tags": [
      {
        "value": "Chrome 55.0.2883",
        "key": "browser",
        "_meta": null
      },
      {
        "value": "Chrome",
        "key": "browser.name",
        "_meta": null
      },
      {
        "value": "error",
        "key": "level",
        "_meta": null
      },
      {
        "value": "javascript",
        "key": "logger",
        "_meta": null
      },
      {
        "value": "Windows 10",
        "key": "os.name",
        "_meta": null
      },
      {
        "value": "https://app.ecoonline.com/ecotron/",
        "key": "url",
        "_meta": null
      },
      {
        "value": "ip:34.232.127.140",
        "key": "user",
        "_meta": null
      }
    ],
    "contexts": {
      "os": {
        "type": "os",
        "name": "Windows 10"
      },
      "browser": {
        "version": "55.0.2883",
        "type": "browser",
        "name": "Chrome"
      }
    },
    "dateReceived": "2018-10-23T12:28:15Z",
    "dateCreated": "2018-10-23T12:28:15Z",
    "fingerprints": [
      "16dbb20c2a03977e42586cff60529a63"
    ],
    "metadata": {
      "type": "Error",
      "value": "TypeError: Failed to fetch"
    },
    "groupID": "580104828",
    "platform": "javascript",
    "errors": [],
    "user": {
      "username": null,
      "name": null,
      "ip_address": "34.232.127.140",
      "email": null,
      "data": {},
      "id": null
    },
    "context": {
      "session:duration": 775,
      "unhandledPromiseRejection": true
    },
    "entries": [
      {
        "type": "exception",
        "data": {
          "values": [
            {
              "stacktrace": {
                "frames": [
                  {
                    "function": null,
                    "colNo": null,
                    "vars": {},
                    "symbol": null,
                    "module": null,
                    "lineNo": null,
                    "errors": null,
                    "package": null,
                    "absPath": "<anonymous>",
                    "inApp": false,
                    "instructionAddr": null,
                    "filename": "<anonymous>",
                    "platform": null,
                    "context": [],
                    "symbolAddr": null
                  },
                  {
                    "function": "o.errorHandler",
                    "map": "ui.min.js.map",
                    "colNo": 11,
                    "vars": {},
                    "symbol": null,
                    "mapUrl": "https://app.ecoonline.com/cdn/ui/ui.min.js.map",
                    "module": "eco/fetch",
                    "origAbsPath": "?",
                    "lineNo": 25,
                    "origColNo": "?",
                    "origFunction": "?",
                    "errors": null,
                    "package": null,
                    "absPath": "webpack:///./eco/fetch.js",
                    "inApp": false,
                    "instructionAddr": null,
                    "filename": "./eco/fetch.js",
                    "origFilename": "?",
                    "platform": null,
                    "context": [
                      [
                        20,
                        "  return fetchIt.catch(ecoFetch.errorHandler)"
                      ],
                      [
                        21,
                        "}"
                      ],
                      [
                        22,
                        ""
                      ],
                      [
                        23,
                        "ecoFetch.errorHandler = function (error) {"
                      ],
                      [
                        24,
                        "  if (error.name !== 'AbortError') {"
                      ],
                      [
                        25,
                        "    throw Error(error || 'Server communication error')"
                      ],
                      [
                        26,
                        "  }"
                      ],
                      [
                        27,
                        "}"
                      ],
                      [
                        28,
                        ""
                      ],
                      [
                        29,
                        "function cleanOptions (options) {"
                      ],
                      [
                        30,
                        "  options = options || {}"
                      ]
                    ],
                    "symbolAddr": null,
                    "origLineNo": "?"
                  }
                ],
                "framesOmitted": null,
                "registers": null,
                "hasSystemFrames": false
              },
              "module": null,
              "rawStacktrace": {
                "frames": [
                  {
                    "function": null,
                    "colNo": null,
                    "vars": {},
                    "symbol": null,
                    "module": null,
                    "lineNo": null,
                    "errors": null,
                    "package": null,
                    "absPath": "<anonymous>",
                    "inApp": false,
                    "instructionAddr": null,
                    "filename": "<anonymous>",
                    "platform": null,
                    "context": [],
                    "symbolAddr": null
                  },
                  {
                    "function": "o.errorHandler",
                    "colNo": 177607,
                    "vars": {},
                    "symbol": null,
                    "module": null,
                    "lineNo": 28,
                    "errors": null,
                    "package": null,
                    "absPath": "https://app.ecoonline.com/cdn/ui/ui.min.js?v=1.11.1",
                    "inApp": false,
                    "instructionAddr": null,
                    "filename": "/cdn/ui/ui.min.js",
                    "platform": null,
                    "context": [
                      [
                        23,
                        " * Copyright (c) 2012-2017 Kirollos Risk (http://kiro.me)"
                      ],
                      [
                        24,
                        " * All Rights Reserved. Apache Software License 2.0"
                      ],
                      [
                        25,
                        " * "
                      ],
                      [
                        26,
                        " * http://www.apache.org/licenses/LICENSE-2.0"
                      ],
                      [
                        27,
                        " */"
                      ],
                      [
                        28,
                        "{snip} }o.errorHandler=function(t){if(\"AbortError\"!==t.name)throw Error(t||\"Server communication error\")}},function(t,e){!function(t){\"use strict\"; {snip}"
                      ],
                      [
                        29,
                        "//# sourceMappingURL=ui.min.js.map"
                      ]
                    ],
                    "symbolAddr": null
                  }
                ],
                "framesOmitted": null,
                "registers": null,
                "hasSystemFrames": false
              },
              "mechanism": null,
              "threadId": null,
              "value": "TypeError: Failed to fetch",
              "type": "Error"
            }
          ],
          "excOmitted": null,
          "hasSystemFrames": false
        }
      },
      {
        "type": "breadcrumbs",
        "data": {
          "values": [
            {
              "category": "fetch",
              "level": "info",
              "event_id": null,
              "timestamp": "2018-10-23T12:28:14.868Z",
              "data": {
                "url": "https://app.ecoonline.com/app/api/site-api/v1/frontendtexts?pagelist=101,350,50,101&language=5",
                "status_code": "200",
                "method": "GET"
              },
              "message": null,
              "type": "http"
            },
            {
              "category": "fetch",
              "level": "error",
              "event_id": null,
              "timestamp": "2018-10-23T12:28:15.079Z",
              "data": {
                "url": "https://app.ecoonline.com/app/api/login?method=JWT",
                "status_code": "null",
                "method": "POST"
              },
              "message": null,
              "type": "http"
            }
          ]
        }
      },
      {
        "type": "request",
        "data": {
          "fragment": "/login?language=5&locationID=0&JWT=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MTA5NzAyMywiYXBwX2lkIjo0LCJvcGVuIjowLCJpc3MiOiJodHRwczpcL1wvYXBwLmVjb29ubGluZS5jb21cL2FwcCIsImlhdCI6MTU0MDI5NzY5MywibmJmIjoxNTQwMjk3Njk…",
          "cookies": [],
          "inferredContentType": null,
          "env": null,
          "headers": [
            [
              "Referer",
              "[Filtered]"
            ],
            [
              "User-Agent",
              "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36"
            ]
          ],
          "url": "https://app.ecoonline.com/ecotron/",
          "query": "",
          "data": null,
          "method": null
        }
      }
    ],
    "message": "Error TypeError: Failed to fetch eco/fetch in o.errorHandler",
    "sdk": {
      "version": "3.24.2",
      "name": "raven-js",
      "upstream": {
        "url": "https://docs.sentry.io/clients/javascript/",
        "isNewer": false,
        "name": "raven-js"
      }
    },
    "type": "error",
    "id": "34164913049",
    "size": 2936
  },
  {
    "eventID": "e19e5d3441ac4551b7f034ce1450a4d3",
    "packages": {},
    "dist": null,
    "_meta": {
      "user": null,
      "context": null,
      "entries": {},
      "contexts": null,
      "message": null,
      "packages": null,
      "tags": {},
      "sdk": null
    },
    "tags": [
      {
        "value": "Chrome 55.0.2883",
        "key": "browser",
        "_meta": null
      },
      {
        "value": "Chrome",
        "key": "browser.name",
        "_meta": null
      },
      {
        "value": "error",
        "key": "level",
        "_meta": null
      },
      {
        "value": "javascript",
        "key": "logger",
        "_meta": null
      },
      {
        "value": "Windows 10",
        "key": "os.name",
        "_meta": null
      },
      {
        "value": "https://app.ecoonline.com/ecotron/",
        "key": "url",
        "_meta": null
      },
      {
        "value": "ip:34.232.127.140",
        "key": "user",
        "_meta": null
      }
    ],
    "contexts": {
      "os": {
        "type": "os",
        "name": "Windows 10"
      },
      "browser": {
        "version": "55.0.2883",
        "type": "browser",
        "name": "Chrome"
      }
    },
    "dateReceived": "2018-10-23T12:28:15Z",
    "dateCreated": "2018-10-23T12:28:15Z",
    "fingerprints": [
      "16dbb20c2a03977e42586cff60529a63"
    ],
    "metadata": {
      "type": "Error",
      "value": "TypeError: Failed to fetch"
    },
    "groupID": "580104828",
    "platform": "javascript",
    "errors": [],
    "user": {
      "username": null,
      "name": null,
      "ip_address": "34.232.127.140",
      "email": null,
      "data": {},
      "id": null
    },
    "context": {
      "session:duration": 775,
      "unhandledPromiseRejection": true
    },
    "entries": [
      {
        "type": "exception",
        "data": {
          "values": [
            {
              "stacktrace": {
                "frames": [
                  {
                    "function": null,
                    "colNo": null,
                    "vars": {},
                    "symbol": null,
                    "module": null,
                    "lineNo": null,
                    "errors": null,
                    "package": null,
                    "absPath": "<anonymous>",
                    "inApp": false,
                    "instructionAddr": null,
                    "filename": "<anonymous>",
                    "platform": null,
                    "context": [],
                    "symbolAddr": null
                  },
                  {
                    "function": "o.errorHandler",
                    "map": "ui.min.js.map",
                    "colNo": 11,
                    "vars": {},
                    "symbol": null,
                    "mapUrl": "https://app.ecoonline.com/cdn/ui/ui.min.js.map",
                    "module": "eco/fetch",
                    "origAbsPath": "?",
                    "lineNo": 25,
                    "origColNo": "?",
                    "origFunction": "?",
                    "errors": null,
                    "package": null,
                    "absPath": "webpack:///./eco/fetch.js",
                    "inApp": false,
                    "instructionAddr": null,
                    "filename": "./eco/fetch.js",
                    "origFilename": "?",
                    "platform": null,
                    "context": [
                      [
                        20,
                        "  return fetchIt.catch(ecoFetch.errorHandler)"
                      ],
                      [
                        21,
                        "}"
                      ],
                      [
                        22,
                        ""
                      ],
                      [
                        23,
                        "ecoFetch.errorHandler = function (error) {"
                      ],
                      [
                        24,
                        "  if (error.name !== 'AbortError') {"
                      ],
                      [
                        25,
                        "    throw Error(error || 'Server communication error')"
                      ],
                      [
                        26,
                        "  }"
                      ],
                      [
                        27,
                        "}"
                      ],
                      [
                        28,
                        ""
                      ],
                      [
                        29,
                        "function cleanOptions (options) {"
                      ],
                      [
                        30,
                        "  options = options || {}"
                      ]
                    ],
                    "symbolAddr": null,
                    "origLineNo": "?"
                  }
                ],
                "framesOmitted": null,
                "registers": null,
                "hasSystemFrames": false
              },
              "module": null,
              "rawStacktrace": {
                "frames": [
                  {
                    "function": null,
                    "colNo": null,
                    "vars": {},
                    "symbol": null,
                    "module": null,
                    "lineNo": null,
                    "errors": null,
                    "package": null,
                    "absPath": "<anonymous>",
                    "inApp": false,
                    "instructionAddr": null,
                    "filename": "<anonymous>",
                    "platform": null,
                    "context": [],
                    "symbolAddr": null
                  },
                  {
                    "function": "o.errorHandler",
                    "colNo": 177607,
                    "vars": {},
                    "symbol": null,
                    "module": null,
                    "lineNo": 28,
                    "errors": null,
                    "package": null,
                    "absPath": "https://app.ecoonline.com/cdn/ui/ui.min.js?v=1.11.1",
                    "inApp": false,
                    "instructionAddr": null,
                    "filename": "/cdn/ui/ui.min.js",
                    "platform": null,
                    "context": [
                      [
                        23,
                        " * Copyright (c) 2012-2017 Kirollos Risk (http://kiro.me)"
                      ],
                      [
                        24,
                        " * All Rights Reserved. Apache Software License 2.0"
                      ],
                      [
                        25,
                        " * "
                      ],
                      [
                        26,
                        " * http://www.apache.org/licenses/LICENSE-2.0"
                      ],
                      [
                        27,
                        " */"
                      ],
                      [
                        28,
                        "{snip} }o.errorHandler=function(t){if(\"AbortError\"!==t.name)throw Error(t||\"Server communication error\")}},function(t,e){!function(t){\"use strict\"; {snip}"
                      ],
                      [
                        29,
                        "//# sourceMappingURL=ui.min.js.map"
                      ]
                    ],
                    "symbolAddr": null
                  }
                ],
                "framesOmitted": null,
                "registers": null,
                "hasSystemFrames": false
              },
              "mechanism": null,
              "threadId": null,
              "value": "TypeError: Failed to fetch",
              "type": "Error"
            }
          ],
          "excOmitted": null,
          "hasSystemFrames": false
        }
      },
      {
        "type": "breadcrumbs",
        "data": {
          "values": [
            {
              "category": "fetch",
              "level": "info",
              "event_id": null,
              "timestamp": "2018-10-23T12:28:14.868Z",
              "data": {
                "url": "https://app.ecoonline.com/app/api/site-api/v1/frontendtexts?pagelist=101,350,50,101&language=5",
                "status_code": "200",
                "method": "GET"
              },
              "message": null,
              "type": "http"
            },
            {
              "category": "fetch",
              "level": "error",
              "event_id": null,
              "timestamp": "2018-10-23T12:28:15.079Z",
              "data": {
                "url": "https://app.ecoonline.com/app/api/login?method=JWT",
                "status_code": "null",
                "method": "POST"
              },
              "message": null,
              "type": "http"
            }
          ]
        }
      },
      {
        "type": "request",
        "data": {
          "fragment": "/login?language=5&locationID=0&JWT=eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpZCI6MTA5NzAyMywiYXBwX2lkIjo0LCJvcGVuIjowLCJpc3MiOiJodHRwczpcL1wvYXBwLmVjb29ubGluZS5jb21cL2FwcCIsImlhdCI6MTU0MDI5NzY5MywibmJmIjoxNTQwMjk3Njk…",
          "cookies": [],
          "inferredContentType": null,
          "env": null,
          "headers": [
            [
              "Referer",
              "[Filtered]"
            ],
            [
              "User-Agent",
              "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36"
            ]
          ],
          "url": "https://app.ecoonline.com/ecotron/",
          "query": "",
          "data": null,
          "method": null
        }
      }
    ],
    "message": "Error TypeError: Failed to fetch eco/fetch in o.errorHandler",
    "sdk": {
      "version": "3.24.2",
      "name": "raven-js",
      "upstream": {
        "url": "https://docs.sentry.io/clients/javascript/",
        "isNewer": false,
        "name": "raven-js"
      }
    },
    "type": "error",
    "id": "34164913049",
    "size": 2936
  }
]
""".data(using: .utf8)!

class JSONParser {
    static func parseProjects(data: Data) -> [Project]? {
        guard let project = try? JSONDecoder().decode([Project].self, from: data) else {
            print("Could not map JSON to projects")
            return nil
        }
        print("project", project)
        return project
    }
    
    static func parseIssues(data: Data) -> [Issue]? {
        do {
            let issue = try JSONDecoder().decode([Issue].self, from: data)
            return issue
        } catch let err {
            print("Error Decoding JSON: \(err)")
            return nil
        }
    }
}
