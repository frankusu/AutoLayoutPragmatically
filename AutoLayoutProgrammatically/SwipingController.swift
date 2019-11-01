//
//  SwipingController.swift
//  AutoLayoutProgrammatically
//
//  Created by Frank Su on 2019-10-31.
//  Copyright © 2019 frankusu. All rights reserved.
//

import Foundation
import UIKit

class SwipingController : UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //backgroundColor doesn't show any color... why ?
        //view.backgroundColor = .gray
        collectionView?.backgroundColor = .white
        //how to add stuff to cell register(CustomCell.self ...
        //collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        //invokes snap to page feeling
        collectionView?.isPagingEnabled = true
    }
    //4 minimumLineSpacingForSectionAt no space in between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //1 numberOfItemsInSection
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    //2 cellForItemAt
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        //MARK: -- interview question!!
        //cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    //3 collectionViewLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
