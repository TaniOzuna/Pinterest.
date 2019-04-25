//
//  EmailLoginPage.swift
//  Pinterest
//
//  Created by Tania Ozuna on 28/02/19.
//  Copyright © 2019 Tania Ozuna. All rights reserved.
//

import UIKit
import Firebase

class EmailLoginPage: UIViewController {
    
    enum LoginType {
        case mail
        case age
        case password
    }
    
    var lt : LoginType?
    var user: User?
    lazy var label : UILabel = {
        let label = UILabel()
        label.text = labelMessage
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tf : UITextField = {
        let tf = UITextField()
        //tf.backgroundColor = .green
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = placeholderMessage
        
        tf.layer.cornerRadius = 5
        tf.layer.masksToBounds = true
        
        return tf
    }()
    
    
    /*let leftBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Left Item", style: .plain, target: self, action: nil)
        barButtonItem.tintColor = UIColor.red
        return barButtonItem
        
    }()*/
    
    var labelMessage : String?
    var placeholderMessage : String?
    
    lazy var nextButton: UIButton = {
        let ub = UIButton()
        //ub.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1)
        ub.backgroundColor = .red
        ub.setTitle("Siguiente", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        ub.setTitleColor(UIColor.white, for: .normal)
        ub.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        ub.addTarget(self, action: #selector(onPress), for: .touchUpInside)
        return ub
        
    }()
    
    func conectarAFirebaseUsandoUsuarioYContraseña(emailParameter:String?, passwordParameter: String?, nameParameter:String?){
        guard let email = emailParameter, let password = passwordParameter, let name = nameParameter else {
            print("Not valid")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (authData:AuthDataResult?, error) in
            let usuarioQueRegresaFirebaseSolamenteSiLoPudoGuardar = authData?.user
            if error != nil {
                print(error)
                return
            }
            
            guard let uid = usuarioQueRegresaFirebaseSolamenteSiLoPudoGuardar?.uid else {
                return
            }
            
            //sucessfully
            var ref = Database.database().reference(fromURL: "https://pinterest-7574e.firebaseio.com/")
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

    

    
    @objc func onPress(){
        if let loginType = lt {
            
        switch loginType {
        case .mail:
            let loginVC = EmailLoginPage()
            user?.email = tf.text
            loginVC.labelMessage = "Cual es tu password"
            loginVC.placeholderMessage = "Password"
            loginVC.lt = .password
            self.navigationController?.pushViewController(loginVC, animated: true)
            
        case .password:
            let loginVC = EmailLoginPage()
            user?.password = tf.text
            loginVC.labelMessage = "Cual es tu edad?"
            loginVC.placeholderMessage = "Edad"
            loginVC.lt = .age
            self.navigationController?.pushViewController(loginVC, animated: true)
            
        case .age:
            let pinCollectionView = Cell()
            user?.age = tf.text
            print("Aqui es donde vamos a ir a firebase y guardar nuestro usuario")
            conectarAFirebaseUsandoUsuarioYContraseña(emailParameter: user?.email, passwordParameter: user?.password, nameParameter: user?.age)
           self.navigationController?.pushViewController(pinCollectionView, animated: true)
            
        }
        
        
    }
}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        self.title = "Email"
        
        view.addSubview(tf)
        view.addSubview(label)
        
        // para todo view se tienen que definir 4 constraints
        // x
        // textfield
        tf.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //tf.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tf.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        tf.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        
        //label
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        view.addSubview(nextButton)
        //nextButton
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
        
        
        
}

}

/*@objc func firstButton(){
    var email = EmailLoginPage()
    var user = user()
    email.message = "¿cual es su correo"?
    emial.placeholder = "correo"
    email.loginType = loginType = email
    self.navigationController?.pushViewController(email, animated: true)
}*/






