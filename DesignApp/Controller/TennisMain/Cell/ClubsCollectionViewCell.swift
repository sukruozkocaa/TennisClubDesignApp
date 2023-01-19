//
//  ClubsCollectionViewCell.swift
//  DesignApp
//
//  Created by Şükrü Özkoca on 16.01.2023.
//

import UIKit

class ClubsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var levelsBgView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        levelView.layer.cornerRadius = 10
        levelsBgView.layer.cornerRadius = 15
        bgView.backgroundColor = UIColor(red: 245/255, green: 240/255, blue: 237/255, alpha: 1)
        bgView.layer.cornerRadius = 30
    }

}
