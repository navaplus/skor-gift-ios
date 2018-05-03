//
//  OnBoardingViewController.swift
//  Skor Gift
//
//  Created by Lynda Erwan on 03/05/18.
//  Copyright © 2018 Skor. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        let vc = SignInViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
