//
//  SwipingController.swift
//  AutoLayoutProgrammatically
//
//  Created by Frank Su on 2019-10-31.
//  Copyright © 2019 frankusu. All rights reserved.
//
//

import UIKit

class SwipingController : UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
    let pages = [
        Page(imageName: "ramen_first", descriptionText: "Join us for delcious Ramen!"),
        Page(imageName: "ramen_second", descriptionText: "Various flavors to choose from."),
        Page(imageName: "ramen_third", descriptionText: "Add toppings to make a bowl truly yours!")
    ]
//    let ramenItems = ["ramen_first","ramen_second","ramen_third"]
//    let ramenTitleText = ["Join us for delcious Ramen!","Various flavors to choose from.","Add toppings to make a bowl truly yours!"]
//    let ramenDescription = ["Ramen (拉麺, ラーメン) are pulled noodles that originated from Japan.", "There are various flavours to choose from! Most popular ones are Shoyu, Shio, and Miso"]
    
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
        //make pages as many ramen pictures
        return pages.count
    }
    //2 cellForItemAt
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PageCell
        //MARK: -- interview question!!
        //cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
//        cell.ramenFirstView.image = UIImage(named: ramenItems[indexPath.item])
//        cell.descriptionTextView.text = ramenTitleText[indexPath.item]
        
        let page = pages[indexPath.item]
        cell.ramenFirstView.image = UIImage(named: page.imageName)
        cell.descriptionTextView.text = page.descriptionText
        
        return cell
    }
    //3 collectionViewLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
