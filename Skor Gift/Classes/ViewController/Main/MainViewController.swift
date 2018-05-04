//
//  MainViewController.swift
//  Skor Gift
//
//  Created by Lynda Erwan on 02/05/18.
//  Copyright © 2018 Skor. All rights reserved.
//

import UIKit
import PagingMenuController

class MainViewController: UIViewController {
    @IBOutlet var buttonHome: UIButton!
    @IBOutlet var buttonGifts: UIButton!
    @IBOutlet var buttonDiscount: UIButton!
    @IBOutlet var buttonAccount: UIButton!
    
    var homeVC:HomeViewController = HomeViewController()
    var giftsVC:GiftsViewController = GiftsViewController()
    var discountsVC:DiscountsViewController = DiscountsViewController()
    var accountVC:AccountViewController = AccountViewController()
    var pagingMenuController:PagingMenuController!
    
    @IBOutlet var containerView: UIView!
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setupPaging()
        getDataFromServer()
    }
    
    func setUI() {
        buttonHome.alignImageAndTitleVertically()
        buttonGifts.alignImageAndTitleVertically()
        buttonDiscount.alignImageAndTitleVertically()
        buttonAccount.alignImageAndTitleVertically()
    }
    
    //MARK: - PagingMenuController
    //MARK: - start of menu options code
    //note: actually we are not using menu option's code because of UI requirements, but can't remove the code totally because it's needed to run the entire paging menu, we set the height to 0 instead.
    //MARK: - Menu Options
    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        var focusMode: MenuFocusMode {
            return .none
        }
        var height: CGFloat {
            return 0
        }
        var backgroundColor: UIColor {
            return TheInterfaceManager.baseGreenColor()
        }
        var selectedBackgroundColor: UIColor {
            return TheInterfaceManager.baseGreenColor()
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemHome(), MenuItemGifts(), MenuItemDiscounts(), MenuItemAccount()]
        }
    }
    
    //MARK: - Menu Items
    struct MenuItemHome: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Home", color: UIColor.white, selectedColor: UIColor.white, font: TheInterfaceManager.regularFont(), selectedFont: TheInterfaceManager.boldFont())
            return .text(title: title)
        }
    }

    struct MenuItemGifts: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Gifts", color: UIColor.white, selectedColor: UIColor.white, font: TheInterfaceManager.regularFont(), selectedFont: TheInterfaceManager.boldFont())
            return .text(title: title)
        }
    }

    struct MenuItemDiscounts: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Discounts", color: UIColor.white, selectedColor: UIColor.white, font: TheInterfaceManager.regularFont(), selectedFont: TheInterfaceManager.boldFont())
            return .text(title: title)
        }
    }

    struct MenuItemAccount: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Account", color: UIColor.white, selectedColor: UIColor.white, font: TheInterfaceManager.regularFont(), selectedFont: TheInterfaceManager.boldFont())
            return .text(title: title)
        }
    }
    //MARK: - end of menu options code
    
    //MARK: - PagingMenuOptions
    struct PagingMenuOptions: PagingMenuControllerCustomizable {
        var componentType: ComponentType {
            return .all(menuOptions: MenuOptions(), pagingControllers: [HomeViewController(), GiftsViewController(), DiscountsViewController(), AccountViewController()])
        }
    }
    
    // MARK: - PagingMenuController Delagate
    func didMoveToPageMenuController(_ menuController: UIViewController, previousMenuController: UIViewController){
        if menuController .isKind(of: HomeViewController.self){
            currentPage = 0
        }else if menuController .isKind(of: GiftsViewController.self){
            currentPage = 1
        }else if menuController .isKind(of: DiscountsViewController.self){
            currentPage = 2
        }else {
            currentPage = 3
        }
    }
    //
    
    func setupPaging()->Void{
        let options = PagingMenuOptions()
        
        pagingMenuController = PagingMenuController(options: options)
        pagingMenuController.onMove = { state in
            switch state {
            case let .didMoveController(menuController, _):
                if menuController .isKind(of: HomeViewController.self){
                    self.currentPage = 0
                }else if menuController .isKind(of: GiftsViewController.self){
                    self.currentPage = 1
                }else if menuController .isKind(of: DiscountsViewController.self){
                    self.currentPage = 2
                }else {
                    self.currentPage = 3
                }
            default:
                print("do nothing")
            }
        }
        
        var frame = pagingMenuController.view.frame
        frame.size.height = containerView.frame.height
        frame.size.width = containerView.frame.width
        pagingMenuController.view.frame = frame
        pagingMenuController.view.backgroundColor = UIColor.appGreyColor()
        
        self.addChildViewController(pagingMenuController)
        self.containerView.addSubview(pagingMenuController.view)
        
        pagingMenuController.didMove(toParentViewController: self)
    }
    
    func getDataFromServer(){
    }
    
    
    //first menu section
    @IBAction func homeButtonTapped(_ sender: Any) {
        pagingMenuController.move(toPage: 0, animated: true)
    }
    
    @IBAction func giftButtonTapped(_ sender: Any) {
        pagingMenuController.move(toPage: 1, animated: true)
    }
    
    @IBAction func discountButtonTapped(_ sender: Any) {
        pagingMenuController.move(toPage: 2, animated: true)
    }
    
    @IBAction func accountButtonTapped(_ sender: Any) {
        pagingMenuController.move(toPage: 3, animated: true)
    }
    
    //second menu section
    @IBAction func buyPointsButtonTapped(_ sender: Any) {
        let vc = PointsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func transferButtonTapped(_ sender: Any) {
        let vc = TransferViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func sendEgiftButtonTapped(_ sender: Any) {
        let vc = SendGiftViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
