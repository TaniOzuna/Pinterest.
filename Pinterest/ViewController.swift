//
//  ViewController.swift
//  Pinterest
//
//  Created by Tania Ozuna on 07/02/19.
//  Copyright © 2019 Tania Ozuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
      

    override func viewDidLoad() {
        
        view.addSubview(firstButton)
        view.addSubview(profileImageView)
        super.viewDidLoad()
        //view.addSubview(nameTextField)
        //view.addSubview(passwordTextField)
        
        view.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        view.addSubview(inputContainerView)
        inputContainerView.addSubview(nameTextField)
        //inputContainerView.addSubview(passwordTextField)
        
        
        
        firstButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstButton.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
            
        nameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor).isActive = true
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    let nameTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Name"
        tf.backgroundColor = .white
        return tf
    }()
}

let passwordTextField : UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Password"
    tf.backgroundColor = .white
    tf.isSecureTextEntry = true
    return tf
}()


let inputContainerView : UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.layer.cornerRadius = 5
    view.layer.masksToBounds = true
    
    return view
}()

let firstButton : UIButton = {
    let ub = UIButton()
    ub.backgroundColor = UIColor(red: 80/125, green: 101/255, blue: 161/255, alpha: 1)
    ub.setTitle("Register",for: .normal)
    ub.translatesAutoresizingMaskIntoConstraints = false
    ub.setTitleColor(UIColor.white, for: .normal)
    //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    return ub
}()

    var profileImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "profileImage")
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    //imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
    imageView.isUserInteractionEnabled = true
    return imageView
}()

func setupProfileImageView(){
    profileImageView.centerXAnchor.constraint(equalTo: inputContainerView.centerXAnchor).isActive = true
    profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
}
