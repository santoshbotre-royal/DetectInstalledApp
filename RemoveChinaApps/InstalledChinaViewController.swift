//
//  InstalledChinaViewController.swift
//  RemoveChinaApps
//
//  Created by Santosh Botre on 01/06/20.
//  Copyright © 2020 Remove China. All rights reserved.
//

import UIKit

class InstalledChinaViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var congratulationView: UIView?
  var installedApps = SchemeManager.shared.schemes.filter { $0.isInstalled == true }
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.rowHeight = UITableView.automaticDimension
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    installedApps = SchemeManager.shared.schemes.filter { $0.isInstalled == true }
    tableView.reloadData()
    self.tableView.rowHeight = UITableView.automaticDimension
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1), execute: { [weak self] in
      self?.loadCongratulation()
    })
  }
  
  func loadCongratulation() {
    guard congratulationView == nil else {
      return
    }
    if installedApps.count == 0 {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let congratulations = storyboard.instantiateViewController(withIdentifier: String(describing: CongratulationViewController.self)) as! CongratulationViewController
      self.congratulationView = congratulations.view
      self.view.addSubview(self.congratulationView!)
    } else {
      congratulationView?.removeFromSuperview()
      congratulationView = nil
    }
  }
}

extension InstalledChinaViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return installedApps.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AppTableViewCell") as? AppTableViewCell
    cell?.configureCell(scheme: installedApps[indexPath.row])
    return cell!
  }
}

extension InstalledChinaViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let app = installedApps[indexPath.row]
    AlertController.showSimpleAlert(AppName: app.appname, controller: self)
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let howtodoit = storyboard.instantiateViewController(withIdentifier: String(describing: HowToDoItViewController.self))
//    self.view.addSubview(howtodoit.view)
  }
}

