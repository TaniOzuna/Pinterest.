//
//  Cell.swift
//  Pinterest
//
//  Created by Tania Ozuna on 25/04/19.
//  Copyright © 2019 Tania Ozuna. All rights reserved.
//


import UIKit


class Cell: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "Cell"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        //print("------- setteando controller ------")
        collectionView?.backgroundColor = .white
        collectionView?.register(pinCell.self, forCellWithReuseIdentifier: cellId )
        
    }
    
    let pines = ["Love", "Flowers", "Molecules", "Happy", "tips", "don´t", "yeii", "hello"]
    let imagenes = [#imageLiteral(resourceName: "hello7"), #imageLiteral(resourceName: "hello4"), #imageLiteral(resourceName: "hello10"), #imageLiteral(resourceName: "hello6"), #imageLiteral(resourceName: "hello8"), #imageLiteral(resourceName: "hello5"), #imageLiteral(resourceName: "hello2"), #imageLiteral(resourceName: "hello9")]
    
    //collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pines.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! pinCell
        
        cell.label1.text = pines[indexPath.item]
        let imageToUse : UIImage = imagenes[indexPath.item]
        cell.picture.image = imageToUse
        cell.picture.translatesAutoresizingMaskIntoConstraints = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("seleccionaste \(pines[indexPath.item])")
        animateCell(collectionView, indexPath: indexPath)
        //changeScreen(indexPath: indexPath)
        
        
    }
    
    func changeScreen(indexPath: IndexPath){
        var animateTransition : Bool = true
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        //transition.subtype = kCATransition
        self.navigationController!.view.layer.add(transition, forKey: nil)
        
        let pinDVC = pinDetail()
        pinDVC.pinImage.image = imagenes[indexPath.item]
        pinDVC.pinTitle.text = pines[indexPath.item]
        animateTransition = false
        self.navigationController?.pushViewController(pinDVC, animated: animateTransition)
        //self.present(pinDVC, animated: true, completion: nil)
    }
    
    func animateCell(_ collectionView: UICollectionView, indexPath : IndexPath){
        let cell = collectionView.cellForItem(at: indexPath) as! pinCell
        collectionView.bringSubviewToFront(cell)
        //cell.bringSubview(toFront: cell.imageView1)
        let zoomTopConstraint = cell.picture.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 85)
        let zoomLeftConstraint = cell.picture.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let zoomRightConstraint = cell.picture.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let zoomHeightConstraint = cell.picture.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: (self.imagenes[indexPath.item].size.height / self.imagenes[indexPath.item].size.width) )
        
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            
            //cell.alpha = 0
            
            zoomTopConstraint.isActive = true
            zoomLeftConstraint.isActive = true
            zoomRightConstraint.isActive = true
            zoomHeightConstraint.isActive = true
            self.view.layoutIfNeeded()
            
        }, completion: {finished in
            //cell.imageView1.frame = imageOriginalFrame
            cell.alpha = 1
            cell.backgroundColor = .white
            zoomTopConstraint.isActive = false
            zoomLeftConstraint.isActive = false
            zoomRightConstraint.isActive = false
            zoomHeightConstraint.isActive = false
            self.changeScreen(indexPath: indexPath)
            
        })
        
        
    }
    
}


extension Cell: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        //print("sacamos height de imagen \(indexPath.item)")
        return imagenes[indexPath.item].size.height
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        widthForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        return imagenes[indexPath.item].size.width
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        currentPhotoWidth indexPath:IndexPath) -> CGFloat {
        return (((view.frame.width / 2) - 16) * 0.8)
        
    }
}
