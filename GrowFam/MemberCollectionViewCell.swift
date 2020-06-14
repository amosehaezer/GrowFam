//
//  MemberCollectionViewCell.swift
//  GrowFam
//
//  Created by Andrew Novansky Ignatius on 12/06/20.
//  Copyright © 2020 GAA. All rights reserved.
//

import UIKit

class MemberCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MemberCollectionViewCell", bundle: nil)
    }
}
