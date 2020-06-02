//
//  AppTableViewCell.swift
//  RemoveChinaApps
//
//  Created by Santosh Botre on 01/06/20.
//  Copyright © 2020 Remove China. All rights reserved.
//

import Foundation
import UIKit

class AppTableViewCell: UITableViewCell {
  @IBOutlet weak var appIcon: UIImageView!
  @IBOutlet weak var appTitle: UILabel!
  @IBOutlet weak var appSeller: UILabel!
}

extension AppTableViewCell {
  func configureCell(scheme: Scheme) {
    self.appIcon.image = UIImage(named: scheme.icon)
    self.appTitle.text = scheme.appname
    self.appSeller.text = scheme.seller
  }
}
