//
//  ViewController.swift
//  TestingMultipleAssets
//
//  Created by Backlin,Gene on 11/13/17.
//  Copyright © 2017 Backlin,Gene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initializeViewFromConfig()
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Initialization
    
    func initializeViewFromConfig() {
        if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate {
            if let config = appDelegate.configurationValues {
                if let imageName = config.viewImage {
                    imageView.image = UIImage(named: imageName)
                    if let backgroundColor = config.backgroundColor {
                        let selector = Selector(backgroundColor)
                        let color = UIColor.perform(selector).takeUnretainedValue() as? UIColor
                        view.backgroundColor = color
                    }
                }
            }
        }
    }

}

