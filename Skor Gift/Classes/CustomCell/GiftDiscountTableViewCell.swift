//
//  GiftDiscountTableViewCell.swift
//  Skor Gift
//
//  Created by Lynda Erwan on 03/05/18.
//  Copyright © 2018 Skor. All rights reserved.
//

import UIKit

class GiftDiscountTableViewCell: UITableViewCell {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundImageView.layer.cornerRadius = 5
        backgroundImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        backgroundImageView.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.3).cgColor
        backgroundImageView.layer.shadowOpacity = 1
        backgroundImageView.layer.shadowRadius = 3
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: 350, height: 90)
        gradient.colors = [
            UIColor(red:0.91, green:0.24, blue:0, alpha:1).cgColor,
            UIColor.black.cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.97, y: 0.5)
        gradient.endPoint = CGPoint(x: 0, y: 0.5)
        gradient.cornerRadius = 5
        gradient.opacity = 0.5
        backgroundImageView.layer.addSublayer(gradient)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setItem(_ imageName:String) {
        let image = UIImage(named:imageName)?.withRenderingMode(.alwaysTemplate)
        iconImageView.tintColor = UIColor.white
        iconImageView.image = image
    }
}
