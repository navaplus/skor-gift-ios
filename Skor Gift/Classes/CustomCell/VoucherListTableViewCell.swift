//
//  VoucherListTableViewCell.swift
//  Skor Gift
//
//  Created by Lynda Erwan on 03/05/18.
//  Copyright © 2018 Skor. All rights reserved.
//

import UIKit

class VoucherListTableViewCell: UITableViewCell {

    @IBOutlet var voucherImageView: UIImageView!
    @IBOutlet var voucherTitleLabel: UILabel!
    @IBOutlet var voucherPointsLabel: UILabel!
    @IBOutlet var uiContainerView: UIView!
    @IBOutlet var redeemButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        uiContainerView.layer.cornerRadius = 5
        uiContainerView.backgroundColor = UIColor.white
        uiContainerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        uiContainerView.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.3).cgColor
        uiContainerView.layer.shadowOpacity = 1
        uiContainerView.layer.shadowRadius = 3
        
        redeemButton.layer.cornerRadius = 3
        redeemButton.backgroundColor = UIColor(red:0.92, green:0.31, blue:0.15, alpha:1)
        redeemButton.layer.shadowOffset = CGSize.zero
        redeemButton.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.5).cgColor
        redeemButton.layer.shadowOpacity = 1
        redeemButton.layer.shadowRadius = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func redeemButtonTapped(_ sender: Any) {
    }
}
