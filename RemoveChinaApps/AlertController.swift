//
//  AlertController.swift
//  RemoveChinaApps
//
//  Created by Santosh Botre on 01/06/20.
//  Copyright © 2020 Remove China. All rights reserved.
//

import UIKit

class AlertController {
  /**
   Simple Alert
   - Show alert with title and alert message and basic two actions
  */
  class func showSimpleAlert(AppName: String, controller: UIViewController) {
    let alert = UIAlertController(title: "Uninstall", message: "Settings -> General-> iPhone Storage -> Click on \"\(AppName)\" -> `Delete App` \n OR \nLong press on any application -> Delete all the apps listed here.", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
          //Cancel Action
      }))
      alert.addAction(UIAlertAction(title: "Go to Settings",
                                    style: UIAlertAction.Style.default,
                                    handler: {(_: UIAlertAction!) in
                                           if let url = URL(string:"App-Prefs:root=General&path=Storage") {
                                        if UIApplication.shared.canOpenURL(url) {
                                          if #available(iOS 10.0, *) {
                                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                          } else {
                                            UIApplication.shared.openURL(url)
                                          }
                                        }
                                      }

      }))
      controller.present(alert, animated: true, completion: nil)
  }
}
