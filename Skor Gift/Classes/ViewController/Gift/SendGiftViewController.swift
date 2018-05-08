//
//  SendGiftViewController.swift
//  Skor Gift
//
//  Created by Lynda Erwan on 02/05/18.
//  Copyright © 2018 Skor. All rights reserved.
//

import UIKit

class SendGiftViewController: UIViewController {
    
    @IBOutlet var voucherContainerView: UIView!
    @IBOutlet var recepientContainerView: UIView!
    @IBOutlet var messageContainerView: UIView!
    @IBOutlet var imageContainerView: UIView!
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        contentView.frame = CGRect(x: 0, y: 0, width: TheInterfaceManager.deviceWidth(), height: TheInterfaceManager.deviceHeight())
//        scrollView.contentSize = CGSize(width: TheInterfaceManager.deviceWidth(), height: 955)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
