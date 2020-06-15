//
//  QuestVC.swift
//  GrowFam
//
//  Created by Amos Ebenhaezer on 15/06/20.
//  Copyright © 2020 GAA. All rights reserved.
//

import UIKit

class QuestVC: UIViewController {
    
    let QuestTV = UITableView()
    var totalCount: Int = 0
    var currentCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        let sizeFrame = CGRect(x: 0, y: 0, width: 414, height: 896)
        
        let frame = UIView(frame: sizeFrame)
        frame.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.8431372549, blue: 0.8431372549, alpha: 1)
        
        let titleAttribute = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)]
        
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 30, y: 70, width: 400, height: 100)
        let titleString = NSAttributedString(string: "Today's Mission:    \(currentCount) / \(totalCount)", attributes: titleAttribute)
        titleLabel.attributedText = titleString
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        let segmentedItem = ["Family", "Personal"]
        let control = UISegmentedControl(items: segmentedItem)
        control.frame = CGRect(x: 50, y: 150, width: (self.view.frame.width - 100), height: 40)
        control.addTarget(self, action: #selector(segmentedControl(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0
        
        QuestTV.frame = CGRect(x: 30, y: 225, width: (self.view.frame.width - 60), height: 750)
        registerTableViewCells()
        
        view.addSubview(frame)
        view.addSubview(titleLabel)
        view.addSubview(control)
        view.addSubview(QuestTV)
    }
    
    @objc func segmentedControl(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("Ini Family")
            registerTableViewCells()
        case 1:
            print("Ini Personal")
        default:
            break
        }
    }
    
    func registerTableViewCells() {
        let tableviewCell = UINib(nibName: "PersonalQuestTableViewCell", bundle: nil)
        self.QuestTV.register(tableviewCell, forCellReuseIdentifier: "QuestCell")
    }
}

extension QuestVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = QuestTV.dequeueReusableCell(withIdentifier: "QuestCell") as? QuestTableViewCell {
            return cell
        }
        return UITableViewCell()
    }
}

extension QuestVC: UITableViewDelegate {
    
}
