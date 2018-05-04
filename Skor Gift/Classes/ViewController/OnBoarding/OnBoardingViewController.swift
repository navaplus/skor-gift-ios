//
//  OnBoardingViewController.swift
//  Skor Gift
//
//  Created by Lynda Erwan on 03/05/18.
//  Copyright © 2018 Skor. All rights reserved.
//

import UIKit
import EAIntroView

class OnBoardingViewController: UIViewController, EAIntroDelegate {
    
    @IBOutlet var introViewContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadOnBoardingView()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        let vc = SignInViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func loadOnBoardingView() {
        let page1 = EAIntroPage(customViewFromNibNamed: "IntroPage1")
        let page2 = EAIntroPage(customViewFromNibNamed: "IntroPage2")
        let page3 = EAIntroPage(customViewFromNibNamed: "IntroPage3")
        
        let intro = EAIntroView(frame: introViewContainerView.bounds, andPages: [page1,page2,page3])
        intro!.skipButton = nil
        intro!.pageControlY = 250
        
        intro!.delegate = self
        intro!.show(in: introViewContainerView, animateDuration: 0.3)
    }
}
