//
//  AchievementVC.swift
//  GrowFam
//
//  Created by Amos Ebenhaezer on 11/06/20.
//  Copyright © 2020 GAA. All rights reserved.
//

import UIKit

class AchievementVC: UIViewController {
    
    var collectionPlant: UICollectionView?
    var collectionAchievement: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        let sizeFrame = CGRect(x: 0, y: 0, width: 414, height: 896)
        
        let frame = UIView(frame: sizeFrame)
        frame.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.8431372549, blue: 0.8431372549, alpha: 1)
        
        let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)]
        
        let plantLabel = UILabel()
        plantLabel.frame = CGRect(x: 40, y: 80, width: 400, height: 100)
        let plantString = NSAttributedString(string: "Plants", attributes: titleAttributes)
//        let bold = UIFont.boldSystemFont(ofSize: 40)
        plantLabel.attributedText = plantString
        plantLabel.font = UIFont.boldSystemFont(ofSize: 45)
//        plantLabel.font = plantLabel.font.withSize(40)
        
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionPlant = UICollectionView(frame: CGRect(x: 30, y: 180, width: 350, height: 300), collectionViewLayout: layout)
        collectionPlant?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PlantCell")
        collectionPlant?.backgroundColor = .none
        
        let achievementLabel = UILabel()
        achievementLabel.frame = CGRect(x: 40, y: 420, width: 400, height: 100)
        let achievementString = NSAttributedString(string: "Achievements", attributes: titleAttributes)
        achievementLabel.attributedText = achievementString
        achievementLabel.font = achievementLabel.font.withSize(45)
        
        let layout2 : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout2.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        layout2.itemSize = CGSize(width: 100, height: 100)
        collectionAchievement = UICollectionView(frame: CGRect(x: 30, y: 530, width: 350, height: 300), collectionViewLayout: layout2)
        collectionAchievement?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "AchievementCell")
        collectionAchievement?.backgroundColor = .none
        
        view.addSubview(frame)
        view.addSubview(plantLabel)
        view.addSubview(achievementLabel)
        
        collectionPlant?.dataSource = self
        collectionPlant?.delegate = self
        view.addSubview(collectionPlant ?? UICollectionView())
        
        collectionAchievement?.dataSource = self
        collectionAchievement?.delegate = self
        view.addSubview(collectionAchievement ?? UICollectionView())
    }

}

extension AchievementVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionAchievement {
            let achievementCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AchievementCell", for: indexPath)
            achievementCell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            achievementCell.layer.cornerRadius = 20
            return achievementCell
        } else {
            let plantCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlantCell", for: indexPath)
            plantCell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            plantCell.layer.cornerRadius = 20
            return plantCell
        }
    }
}

extension AchievementVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionPlant {
            print("ini plant tau!")
        } else {
            print("ini achievement")
        }
    }
}