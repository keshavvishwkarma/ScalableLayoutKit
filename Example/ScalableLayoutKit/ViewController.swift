//
//  ViewController.swift
//  ScalableLayoutKit
//
//  Created by keshavvishwkarma on 09/14/2018.
//  Copyright (c) 2018 keshavvishwkarma. All rights reserved.
//

import UIKit
import ScalableLayoutKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.scaledLayoutDesign(from: .iPhone8Plus)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

