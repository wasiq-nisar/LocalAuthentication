//
//  ViewController.swift
//  FaceID
//
//  Created by Muhammad Wasiq  on 21/12/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if Authentication.shared.isFaceIDAvailable() {
            // Face ID is enabled
            // Add your logic here
        } else {
            // Face ID is not available or not enabled
            // Add your logic here
        }
    }
}

