//
//  CardCollectionViewCell.swift
//  DesignApp
//
//  Created by Şükrü Özkoca on 15.01.2023.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 35
    }

}
