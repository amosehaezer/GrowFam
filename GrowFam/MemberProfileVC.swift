//
//  MemberPageViewController.swift
//  GrowFam
//
//  Created by Andrew Novansky Ignatius on 12/06/20.
//  Copyright © 2020 GAA. All rights reserved.
//

import UIKit



class MemberProfileVC: UIViewController{
    @IBOutlet weak var MemberProfileCollectionView: UICollectionView!
    
    let margin:CGFloat = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let collectionView = MemberProfileCollectionView, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        
        MemberProfileCollectionView.register(MemberCollectionViewCell.nib(),forCellWithReuseIdentifier: "MemberCollectionViewCell")
        MemberProfileCollectionView.delegate = self
        MemberProfileCollectionView.dataSource = self
        
    }
    
    
    
    
}
extension MemberProfileVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        print("Tapped")
    }

}
extension MemberProfileVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Member.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemberCollectionViewCell", for: indexPath) as! MemberCollectionViewCell
        let item = Member[indexPath.item]
        cell.imageView.image = UIImage(named: item.imageName)
        cell.label1.text = item.role
        cell.label2.text = item.name
        cell.label3.text = item.task
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 2   //number of column you want
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size)
    }
}
//extension ViewController: UICollectionViewFlowLayout{
//
//}

