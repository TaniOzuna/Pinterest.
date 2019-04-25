//
//  Cell.swift
//  Pinterest
//
//  Created by Tania Ozuna on 28/03/19.
//  Copyright © 2019 Tania Ozuna. All rights reserved.
//

//import Foundation

/*class cell: UICollectionViewCell {
    
    var pin:Pin? {
        
    }
}()*/



import UIKit


class Cell: UICollectionViewController {
    /* func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }*/
    

    //var collectionview: UICollectionView!
    var cellId = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: cellId)
    }
    
    //collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
 
    
    override func collectionView(_ _collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
}
