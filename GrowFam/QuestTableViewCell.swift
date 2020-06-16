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
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let baseView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat.zero, height: CGFloat.zero))
        view.layer.cornerRadius = 12
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        
        self.addSubview(baseView)
        baseView.addSubview(titleLabel)
        baseView.addSubview(descLabel)
        
        NSLayoutConstraint.activate([
            
            baseView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            baseView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            baseView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            baseView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            titleLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: -50),
            titleLabel.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: 0),
            
            descLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 50),
            descLabel.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -15),
            descLabel.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 20),
            descLabel.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
