//
//  SchemeRepository.swift
//  RemoveChinaApps
//
//  Created by Santosh Botre on 01/06/20.
//  Copyright © 2020 Remove China. All rights reserved.
//

import Foundation

class SchemeRepository {
  func loadSchemes() -> SchemeData? {
    if let path = Bundle.main.path(forResource: "schemes", ofType: "json") {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        let schemes: SchemeData = try JSONDecoder().decode(SchemeData.self, from: data)
          return schemes
        } catch {
        // handle error
        print(error)
        return nil
      }
    }
    return nil
  }
}
