//
//  HomeViewController.swift
//  Skor Gift
//
//  Created by Lynda Erwan on 02/05/18.
//  Copyright © 2018 Skor. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableHeaderView: UIView!
    
    @IBOutlet var buttonTopUp: UIButton!
    @IBOutlet var buttonEVoucher: UIButton!
    @IBOutlet var buttonVoucher: UIButton!
    @IBOutlet var buttonECommerce: UIButton!
    @IBOutlet var buttonFoodBev: UIButton!
    @IBOutlet var buttonHealthFit: UIButton!
    @IBOutlet var buttonLifeStyle: UIButton!
    @IBOutlet var buttonEssential: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "VoucherListTableViewCell", bundle: nil), forCellReuseIdentifier: "VoucherListTableViewCell")
        
//        tableHeaderView.frame = CGRect(x: 0, y: 0, width: TheInterfaceManager.deviceWidth(), height: tableHeaderView.frame.size.height)
        
        tableView.tableHeaderView = tableHeaderView
        
        setUI()
    }
    
    func setUI() {
        buttonTopUp.alignImageAndTitleVertically()
        buttonEVoucher.alignImageAndTitleVertically()
        buttonVoucher.alignImageAndTitleVertically()
        buttonECommerce.alignImageAndTitleVertically()
        buttonFoodBev.alignImageAndTitleVertically()
        buttonHealthFit.alignImageAndTitleVertically()
        buttonLifeStyle.alignImageAndTitleVertically()
        buttonEssential.alignImageAndTitleVertically()
    }
    
    //MARK: - UITableViewDataSource, UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VoucherListTableViewCell", for: indexPath) as! VoucherListTableViewCell
        cell.selectionStyle = .default
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
