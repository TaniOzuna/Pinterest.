//
//  pinCell.swift
//  Pinterest
//
//  Created by Tania Ozuna on 26/04/19.
//  Copyright © 2019 Tania Ozuna. All rights reserved.
//

import UIKit


class pinCell : UICollectionViewCell {
    override init (frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        //Set image
        self.addSubview(picture)
        self.addSubview(label1)
        
        picture.topAnchor.constraint(equalTo: self.topAnchor, constant: (17 * (1/3) )).isActive = true
        picture.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        picture.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 8/10).isActive = true
        picture.heightAnchor.constraint(equalToConstant: self.bounds.height - 34).isActive = true

        
        //Set label
        
        label1.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: (17 / 3 )).isActive = true
        label1.leftAnchor.constraint(equalTo: picture.leftAnchor).isActive = true
        label1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 80/100).isActive = true
        label1.heightAnchor.constraint(equalToConstant: 17).isActive = true
        //label1.backgroundColor = .red //Coloracion de prueba
        
        
        self.addSubview(imageViewOptions)
        imageViewOptions.centerYAnchor.constraint(equalTo: label1.centerYAnchor).isActive = true
        imageViewOptions.rightAnchor.constraint(equalTo: picture.rightAnchor).isActive = true
        imageViewOptions.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 7/100).isActive = true
        imageViewOptions.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 7/100).isActive = true
        
        //Propieades de celda en general
        self.backgroundColor = .white
        //self.backgroundColor = .orange
        
    }
    
    func updateCellHeight(_ newWidth: CGFloat, currentHeight: CGFloat, currentWidth: CGFloat) -> CGFloat{
        var newHeight : CGFloat = (newWidth * currentHeight) / currentWidth
        newHeight = 2000
        return newHeight
    }
    
    func animateCell(duration: CGFloat, delay: CGFloat, newX: CGFloat, newY: CGFloat, newWidth: CGFloat, newHeight: CGFloat){
        
        UIView.animate(withDuration: TimeInterval(duration), delay: TimeInterval(delay), options: .curveEaseOut, animations: {
            let newFrame = CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
            self.picture.frame = newFrame

        }, completion: {finished in
            //cell.frame = originalFrame
            //cell.alpha = 1
        })
    }
    
    
    //Imagen
    let picture : UIImageView = {
        let imageView2 = UIImageView()
        imageView2.image = #imageLiteral(resourceName: "hello7")
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        return imageView2
    }()
    
    //Label
    let label1 : UILabel = {
        let label2 = UILabel()
        label2.textColor = .black
        label2.translatesAutoresizingMaskIntoConstraints = false
        return label2
    }()
    
    
    let imageViewOptions : UIImageView = {
        let imageView3 = UIImageView()
        imageView3.image = #imageLiteral(resourceName: "hello7")
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        return imageView3
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}



