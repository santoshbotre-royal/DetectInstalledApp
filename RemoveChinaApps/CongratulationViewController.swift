//
//  CongratulationViewController.swift
//  RemoveChinaApps
//
//  Created by Santosh Botre on 02/06/20.
//  Copyright © 2020 Remove China. All rights reserved.
//
import UIKit

class CongratulationViewController: UIViewController, UIViewControllerTransitioningDelegate {
  @IBOutlet weak var contentView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    contentView.layer.cornerRadius = 20
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
}
