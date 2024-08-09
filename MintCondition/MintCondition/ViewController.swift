//
//  ViewController.swift
//  MintCondition
//
//  Created by Alok Sahay on 08.08.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ContentManager.sharedManager.signIn()
    }
}
