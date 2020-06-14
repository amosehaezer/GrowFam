//
//  MemberPageViewController.swift
//  GrowFam
//
//  Created by Andrew Novansky Ignatius on 12/06/20.
//  Copyright © 2020 GAA. All rights reserved.
//

import UIKit

struct member {
    var imageName: String
    var role: String
    var name: String
    var task: String
}



var Member: [member] = [
    member(imageName: "Dad", role:  "Dad",name: "Filipo Gaspar",task: "3/3"),
    member(imageName: "Mom", role:  "Mom",name: "Nairobi",task: "1/3"),
    member(imageName: "Son", role:  "Son",name: "Oslo",task: "2/3"),
]
class MemberPageViewController: UIViewController{
    @IBOutlet weak var MemberCollectionView: UICollectionView!
    let margin:CGFloat = 10
    var imageNameTemp: String = ""
    var roleTemp: String = ""
    var nameTemp: String = ""
    var taskTemp: String = ""
    override func viewDidLoad() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.hidesBackButton = true
        
        
        super.viewDidLoad()
        guard let collectionView = MemberCollectionView, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        
        MemberCollectionView.register(MemberCollectionViewCell.nib(),forCellWithReuseIdentifier: "MemberCollectionViewCell")
        MemberCollectionView.delegate = self
        MemberCollectionView.dataSource = self
        
        
    }
    
    
    @IBAction func unwindToMember(_ unwindSegue: UIStoryboardSegue) {
      if unwindSegue.source is AddMemberViewController{
                let source = unwindSegue.source
        Member.append(member(imageName: imageNameTemp, role: roleTemp, name: nameTemp, task: taskTemp))
        MemberCollectionView.reloadData()
        print("Saved")
            }
        }
    }
    

extension MemberPageViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        

        print("Tapped")
        performSegue(withIdentifier: "MemberToRegister", sender: nil)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "addMember") as UIViewController
//        present(vc, animated: true, completion: nil)
    }

}
extension MemberPageViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Member.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemberCollectionViewCell", for: indexPath) as! MemberCollectionViewCell
        let item = Member[indexPath.item]
        cell.imageView.image = UIImage(named: item.imageName)
        cell.label1.text = item.role
        cell.label2.text = item.name
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
