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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func redeemButtonTapped(_ sender: Any) {
    }
}
