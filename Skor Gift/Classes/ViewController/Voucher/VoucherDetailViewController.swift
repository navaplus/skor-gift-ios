//
//  VoucherDetailViewController.swift
//  Skor Gift
//
//  Created by Lynda Erwan on 02/05/18.
//  Copyright © 2018 Skor. All rights reserved.
//

import UIKit
import SnapKit

class VoucherDetailViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textContainer: UIView!
    @IBOutlet var imageContainer: UIView!
    @IBOutlet var textBacking: UIView!
    
    //temporary
    private let infoText = UILabel()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpScrollView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.scrollIndicatorInsets = view.safeAreaInsets
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: view.safeAreaInsets.bottom, right: 0)
    }
    
    func setUpScrollView() {
        view.backgroundColor = .gray
        
        scrollView.contentInsetAdjustmentBehavior = .never
        
        imageView.clipsToBounds = true
        
        infoText.textColor = .clear
        infoText.numberOfLines = 0
        let text =  """
                    Lorem ipsum dolor sit amet, in alia adhuc aperiri nam. Movet scripta tractatos cu eum, sale commodo meliore ea eam, per commodo atomorum ea. Unum graeci iriure nec an, ea sit habeo movet electram. Id eius assum persius pro, id cum falli accusam. Has eu fierent partiendo, doming expetenda interesset cu mel, tempor possit vocent in nam. Iusto tollit ad duo, est at vidit vivendo liberavisse, vide munere nonumy sed ex.

                    Quod possit expetendis id qui, consequat vituperata ad eam. Per cu elit latine vivendum. Ei sit nullam aliquam, an ferri epicuri quo. Ex vim tibique accumsan erroribus. In per libris verear adipiscing. Purto aliquid lobortis ea quo, ea utinam oportere qui.

                    Lorem ipsum dolor sit amet, in alia adhuc aperiri nam. Movet scripta tractatos cu eum, sale commodo meliore ea eam, per commodo atomorum ea. Unum graeci iriure nec an, ea sit habeo movet electram. Id eius assum persius pro, id cum falli accusam. Has eu fierent partiendo, doming expetenda interesset cu mel, tempor possit vocent in nam. Iusto tollit ad duo, est at vidit vivendo liberavisse, vide munere nonumy sed ex.

                    """
        infoText.text = text

        imageContainer.backgroundColor = .darkGray
        
        textContainer.backgroundColor = .clear
        
        textBacking.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1235740449, blue: 0.2699040081, alpha: 1)
        
        view.addSubview(scrollView)
        
        textContainer.addSubview(infoText)
        
        scrollView.snp.makeConstraints {
            make in
            
            make.edges.equalTo(view)
        }
        
        imageContainer.snp.makeConstraints {
            make in
            
            make.top.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.height.equalTo(imageContainer.snp.width).multipliedBy(0.7)
        }
        
        imageView.snp.makeConstraints {
            make in
            
            make.left.right.equalTo(imageContainer)
            
            //** Note the priorities
            make.top.equalTo(view).priority(.high)
            
            //** We add a height constraint too
            make.height.greaterThanOrEqualTo(imageContainer.snp.height).priority(.required)
            
            //** And keep the bottom constraint
            make.bottom.equalTo(imageContainer.snp.bottom)
        }
        
        textContainer.snp.makeConstraints {
            make in
            
            make.top.equalTo(imageContainer.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(scrollView)
        }
        
        textBacking.snp.makeConstraints {
            make in
            
            make.left.right.equalTo(view)
            make.top.equalTo(textContainer)
            make.bottom.equalTo(view)
        }
        
        infoText.snp.makeConstraints {
            make in

            make.edges.equalTo(textContainer).inset(14)
        }
    }
    
    //MARK: - Scroll View Delegate
    
    private var previousStatusBarHidden = false
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if previousStatusBarHidden != shouldHideStatusBar {
            
            UIView.animate(withDuration: 0.2, animations: {
                self.setNeedsStatusBarAppearanceUpdate()
            })
            
            previousStatusBarHidden = shouldHideStatusBar
        }
    }
    
    //MARK: - Status Bar Appearance
    
    @IBAction func sendAsGiftButtonTapped(_ sender: Any) {
        let vc = SendGiftViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return shouldHideStatusBar
    }
    
    private var shouldHideStatusBar: Bool {
        if let textContainer = textContainer {
            let frame = textContainer.convert(textContainer.bounds, to: nil)
            return frame.minY < view.safeAreaInsets.top
        }
        
        return false
    }
}
