//
//  Environment.swift
//  DemoEnvTest
//
//  Created by Kapil IIINC on 01/11/18.
//  Copyright © 2018 kite.work. All rights reserved.
//

import Foundation

enum PlistKey {
  case serverURL

  var value: String {
    switch self {
      case .serverURL   : return "server_url"
    }
  }
}

struct Environment {
  private init() { }

  private static var infoDict: [String: Any] {
    get {
      if let dict = Bundle.main.infoDictionary {
        return dict
      } else {
        fatalError("Plist file not found")
      }
    }
  }

  static func configuration(_ key: PlistKey) -> String {
    switch key {
    case .serverURL:
      return infoDict[PlistKey.serverURL.value] as! String
    }
  }
}
