//
//  PaperViewController.swift
//  WallpaperDemo
//
//  Created by Brian Moakley on 11/20/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

class PaperViewController: UIViewController {
  
  var monthToShow: Int = 0
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
  }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  override func viewWillAppear(animated: Bool) {
    let imageName = String(format: "%02d.jpg", arguments: [monthToShow])
    imageView.image = UIImage(named: imageName)
  }

}
