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
        view.addSubview(firstButton)
        //view.addSubview(profileImageView)
        
        //view.addSubview(nameTextField)
        
        
        view.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        view.addSubview(inputContainerView)
        inputContainerView.addSubview(nameTextField)
        inputContainerView.addSubview(passwordTextField)
        inputContainerView.addSubview(emailTextField)
        //inputContainerView.addSubview()
        
        firstButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 20).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstButton.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        firstButton.rightAnchor.constraint(equalTo: inputContainerView.rightAnchor).isActive = true
        
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        //inputsContainerViewHeightAnchor?.isActive = true
        
            
        nameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier:1/3).isActive = true
        //nameTextFieldHeightAnchor?.isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        //passwordTextFieldHeightAnchor?.isActive = true
        
        emailTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true

        // Do any additional setup after loading the view, typically from a nib.
        
    }
    let nameTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Name"
        tf.backgroundColor = .white
        return tf
    }()

let passwordTextField : UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "Password"
    tf.backgroundColor = .white
    tf.isSecureTextEntry = true
    return tf
}()

let emailTextField : UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.placeholder = "email"
    tf.keyboardType = .emailAddress
    tf.backgroundColor = .white
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

    lazy var firstButton : UIButton = {
    let ub = UIButton()
    ub.backgroundColor = UIColor(red: 88/255, green: 101/255, blue: 161/255, alpha: 1)
    ub.setTitle("Register", for: .normal)
    ub.translatesAutoresizingMaskIntoConstraints = false
    ub.setTitleColor(UIColor.white, for: .normal)
    ub.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
    ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
    return ub
  
}()

@objc func handleButton(){
    guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
        print("Not valid")
        return
    }
    Auth.auth().createUser(withEmail: email, password: password) { (auth:AuthDataResult?, error) in
        if error != nil {
            print(error)
            return
        }
        
        var user = auth?.user
        guard let uid = user?.uid else {
            return
        }
        
        //sucessfully
        var ref = Database.database().reference(fromURL: "https://pinterest-1c540.firebaseio.com/")
        let values = ["name" :name, "email": email]
        let usersRef = ref.child("users").child(uid)
        usersRef.updateChildValues(values, withCompletionBlock: { (error, databaseRef:DatabaseReference?) in
            if  error != nil {
                print(error)
            }
        })
        
        // successfully included
        print("Saved user successfully into our database")
        
    }
}

}






