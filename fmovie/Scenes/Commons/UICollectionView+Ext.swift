//
//  UICollectionView+Ext.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/8/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = UIColor(named: "secondary_color")
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "Avenir-Light", size: 30)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
    }
    
    func removeGaps() {
        let flow = self.collectionViewLayout as! UICollectionViewFlowLayout
        
        //Removing gap betweem collection view elements.
        let itemSpacing: CGFloat = 1
        let itemsInOneLine: CGFloat = 2
        
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let width = UIScreen.main.bounds.size.width - itemSpacing * CGFloat(itemsInOneLine - 1)
        flow.itemSize = CGSize(width: floor(width/itemsInOneLine), height: width*1.5/itemsInOneLine)
        flow.minimumInteritemSpacing = 1
        flow.minimumLineSpacing = 1
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
