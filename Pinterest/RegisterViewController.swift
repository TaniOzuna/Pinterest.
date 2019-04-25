//
//  RegisterViewController.swift
//  Pinterest
//
//  Created by Tania Ozuna on 28/02/19.
//  Copyright © 2019 Tania Ozuna. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let leftBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Left Item", style: .plain, target: self, action: nil)
        barButtonItem.tintColor = UIColor.red
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.red
        
        self.title = "Register"
        
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

