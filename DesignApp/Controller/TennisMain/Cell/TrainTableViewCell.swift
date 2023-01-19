//
//  TrainTableViewCell.swift
//  DesignApp
//
//  Created by Şükrü Özkoca on 16.01.2023.
//

import UIKit

class TrainTableViewCell: UITableViewCell {

    @IBOutlet weak var bgImageView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var priceView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgImageView.layer.cornerRadius = 15
        priceView.layer.cornerRadius = 15
        priceView.backgroundColor = .black
        priceLabel.textColor = .white
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
