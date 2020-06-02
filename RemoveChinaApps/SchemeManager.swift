//
//  Scheme.swift
//  RemoveChinaApps
//
//  Created by Santosh Botre on 01/06/20.
//  Copyright © 2020 Remove China. All rights reserved.
//


import Foundation
import UIKit

class Scheme: Codable {
  let appname, scheme: String
  var seller: String?
  var icon: String
  var isInstalled: Bool? = false
}
typealias SchemeData = [Scheme]

class SchemeManager {
  static let shared = SchemeManager()

  private init() { }

  lazy var schemes: SchemeData = SchemeRepository().loadSchemes() ?? []
  func checkInstallApps(scheme: String) -> Bool {
    if let url = URL(string: scheme) {
      if UIApplication.shared.canOpenURL(url) {
        print("url -- \(url)")
          return true
      }
    } else {
      print("Invalid scheme")
    }
    return false
  }
}
