//
//  PaperViewController.swift
//  WallpaperDemo
//
//  Created by Brian Moakley on 11/20/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit
import MessageUI

class PaperViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Vars
    var monthToShow: Int = 0
    var mfComposer: MFMailComposeViewController!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        mfComposer = MFMailComposeViewController()
        mfComposer.mailComposeDelegate = self
        let imageName = String(format: "%02d", arguments: [monthToShow])
        if let path = NSBundle.mainBundle().pathForResource(imageName, ofType: "jpg") {
            if let data = NSData(contentsOfFile: path) {
                mfComposer.addAttachmentData(data, mimeType: "image/jpg", fileName: "Wallpaper")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let imageName = String(format: "%02d.jpg", arguments: [monthToShow])
        imageView.image = UIImage(named: imageName)
    }
    
    //MARK: - Actions
    @IBAction func mailPhoto() {
        if MFMailComposeViewController.canSendMail() {
            presentViewController(mfComposer, animated: true, completion: nil)
        }
    }
    
    @IBAction func goBack(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    //MARK: - MFMailComposeViewControllerDelegate
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
