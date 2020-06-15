//
//  PersonalQuestCustomCellTableViewCell.swift
//  GrowFam
//
//  Created by Amos Ebenhaezer on 15/06/20.
//  Copyright © 2020 GAA. All rights reserved.
//

import UIKit

class QuestTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let baseView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat.zero, height: CGFloat.zero))
        view.layer.cornerRadius = 12
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(baseView)
        baseView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            
            baseView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            baseView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            baseView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            baseView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            titleLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -10),
            titleLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setup()
//        // Initialization code
//    }
//
//    func setup() {
//
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
