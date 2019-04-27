//
//  ViewController.swift
//  Pinterest
//
//  Created by Tania Ozuna on 07/02/19.
//  Copyright © 2019 Tania Ozuna. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
      

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(firstButton)
        
        
       
        self.view.addSubview(imagen)
        
        //imagen.frame = CGRect(x: 50, y: 120, width: 50, height: 50)
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pinterest.png")!)
        //view.addSubview(profileImageView)
        
        //view.addSubview(nameTextField)
        
        
        //view.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        //view.addSubview(inputContainerView)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        //inputContainerView.addSubview()
        
        
        //imagen.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //imagen.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        firstButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 10).isActive = true
        secondButton.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor).isActive = true
        secondButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 10).isActive = true
        thirdButton.centerXAnchor.constraint(equalTo: secondButton.centerXAnchor).isActive = true
        thirdButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        thirdButton.heightAnchor.constraint(equalToConstant: 50).isActive = true


    }
    
    let imagen : UIImageView = {
        //let imageName = "pinterest"
        //let image = UIImage(named: imageName)
        let iv = UIImageView(frame: CGRect(x: 105, y: 150, width: 200, height: 200))
        iv.image = UIImage(named: "pinterest.png")
        //iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var firstButton : UIButton = {
    let ub = UIButton()
    ub.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
    ub.setTitle("Continuar con el correo electronico", for: .normal)
    ub.translatesAutoresizingMaskIntoConstraints = false
    ub.setTitleColor(UIColor.white, for: .normal)
    ub.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
    ub.addTarget(self, action: #selector(onButtonPressedFirst), for: .touchUpInside)
    return ub
  
}()
    lazy var secondButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 139/255, alpha: 1)
        ub.setTitle("Continuar con Facebook", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.setTitleColor(UIColor.white, for: .normal)
        ub.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        ub.addTarget(self, action: #selector(onButtonPressedSecond), for: .touchUpInside)
        return ub
        
    }()
    
    
    lazy var thirdButton: UIButton = {
        let ub = UIButton()
    ub.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1)
        //ub.backgroundColor = .red
        ub.setTitle("Continuar con Google", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.setTitleColor(UIColor.white, for: .normal)
        ub.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        ub.addTarget(self, action: #selector(onButtonPressedThird), for: .touchUpInside)
        return ub
        
    }()
    
    @objc func onButtonPressedThird(){
        let loginVC = EmailLoginPage()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc func onButtonPressedSecond(){
        let loginVC = EmailLoginPage()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc func onButtonPressedFirst(){
        let loginVC = EmailLoginPage()
        loginVC.labelMessage = "¿Cuál es tu correo electrónico?"
        loginVC.placeholderMessage = "Correo"
        loginVC.user = User()
        loginVC.lt = .mail
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
}











