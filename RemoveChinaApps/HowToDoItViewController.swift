//
//  HowToDoIt.swift
//  RemoveChinaApps
//
//  Created by Santosh Botre on 01/06/20.
//  Copyright © 2020 Remove China. All rights reserved.
//

import Foundation
import UIKit

class HowToDoItViewController: UIViewController {
  @IBOutlet var scrollView: UIScrollView!

  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet var skip: UIButton!
  @IBOutlet weak var showSwitch: UISwitch!
  
  var scrollWidth: CGFloat! = 0.0
  var scrollHeight: CGFloat! = 0.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.scrollView.delegate = self
    self.scrollView.isPagingEnabled = true
    let images = ["step1", "step2", "step3"]
    //crete the slides
    for index in 0..<images.count {
      //subviews
      let imageView = UIImageView.init(image: UIImage.init(named: images[index]))
      imageView.frame = CGRect(x:0 + (Int(self.view.frame.size.width) * index) + 20, y:0, width: 300, height:500)
      imageView.center = CGPoint(x: self.view.frame.size.width/2 + CGFloat((Int(self.view.frame.size.width) * index)), y: imageView.frame.size.height/2)
      scrollView.addSubview(imageView)
    }
    //set width of scrollview to accomodate all the slides
    scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(images.count), height: scrollHeight)
    //initial state
    pageControl.numberOfPages = images.count
    pageControl.currentPage = 0
  }
  
  @IBAction func pagevalueChanged(_ sender: Any) {
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
  }
  @IBAction func showSwitchValueChanged(_ sender: Any) {
    print(sender)
  }
  //get dynamic width and height of scrollview and save it
  override func viewDidLayoutSubviews() {
      scrollWidth = scrollView.frame.size.width
      scrollHeight = scrollView.frame.size.height
  }

  @IBAction func skipButtonAction(_ sender: Any) {
    print("skip")
  }
  
  func setIndiactorForCurrentPage()  {
      let page = (scrollView?.contentOffset.x)!/scrollWidth
      pageControl?.currentPage = Int(page)
  }
}

extension HowToDoItViewController: UIScrollViewDelegate {
//  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//    setIndiactorForCurrentPage()
//  }
  //MARK: - Use For Pegination -
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    print(scrollView)
  }
}
