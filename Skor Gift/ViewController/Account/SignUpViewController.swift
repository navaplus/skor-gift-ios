//
//  SignUpViewController.swift
//  Skor Gift
//
//  Created by Lynda Erwan on 02/05/18.
//  Copyright © 2018 Skor. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var confirmEmailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        //if success then push to main page
        let vc = MainViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
