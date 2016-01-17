//
//  ViewController.swift
//  WallpaperDemo
//
//  Created by Brian Moakley on 11/20/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Vars
    
    //MARK: - Outlets
    @IBOutlet weak var currentMonth: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        currentMonth.text = "\(Int(slider.value))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    @IBAction func sliderUpdated(sender: AnyObject) {
        let slider = sender as! UISlider
        currentMonth.text = "\(Int(slider.value))"
    }
    
    @IBAction func goTapped(sender:AnyObject) {
        performSegueWithIdentifier("GoToWallpaper", sender: sender)
    }
    
    //MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToWallpaper" {
            let paperViewController = segue.destinationViewController as! PaperViewController
            paperViewController.monthToShow = Int(currentMonth.text!)!
        }
    }
    
}

