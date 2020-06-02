//
//  ChinaAppListViewController.swift
//  RemoveChinaApps
//
//  Created by Santosh Botre on 01/06/20.
//  Copyright © 2020 Remove China. All rights reserved.
//

import Foundation
import UIKit

class ChinaAppListViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.tableView.rowHeight = UITableView.automaticDimension
  }
}

extension ChinaAppListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return SchemeManager.shared.schemes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AppTableViewCell") as? AppTableViewCell
    cell?.configureCell(scheme: SchemeManager.shared.schemes[indexPath.row])
    return cell!
  }
}

extension ChinaAppListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //AlertController.showSimpleAlert(AppName: app.appname, controller: self)
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let howtodoit = storyboard.instantiateViewController(withIdentifier: String(describing: HowToDoItViewController.self))
//    self.view.addSubview(howtodoit.view)
  }
}

