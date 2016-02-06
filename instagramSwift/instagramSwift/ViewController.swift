//
//  ViewController.swift
//  instagramSwift
//
//  Created by Enkhjargal Gansukh on 2/5/16.
//  Copyright © 2016 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func SignInClicked(sender: AnyObject) {

            InstagramLoginService().login()
    }
}

