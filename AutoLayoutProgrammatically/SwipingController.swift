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
        Page(imageName: "ramen_first", titleText: "Join us for delcious Ramen!", descriptionText: "Ramen (拉麺, ラーメン) are pulled noodles in soup broth that originated from Japan."),
        Page(imageName: "ramen_second", titleText: "Various flavors to choose from.", descriptionText: "There are various flavours to choose from! Most popular ones are Shoyu, Shio, and Miso"),
        Page(imageName: "ramen_third", titleText: "Add toppings to make a bowl truly yours!", descriptionText: "Soft boiled eggs(aji tamago), Chashu (fatty braised pork), Chili Oil, Kikurage and many more" ),
        Page(imageName: "ramen_first", titleText: "Join us for delcious Ramen!", descriptionText: "Ramen (拉麺, ラーメン) are pulled noodles in soup broth that originated from Japan."),
        Page(imageName: "ramen_second", titleText: "Various flavors to choose from.", descriptionText: "There are various flavours to choose from! Most popular ones are Shoyu, Shio, and Miso"),
        Page(imageName: "ramen_third", titleText: "Add toppings to make a bowl truly yours!", descriptionText: "Soft boiled eggs(aji tamago), Chashu (fatty braised pork), Chili Oil, Kikurage and many more" )
    ]
    private let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc func handlePrev() {
        print("Trying to go to prev page...")
        let prevIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControl.currentPage = prevIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.mainRed, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc func handleNext() {
        print("Trying to go to next page...")
        //even tho iOS 13 wraps around, this is safe way to ensure it doesn't acces pages that aren't there
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1 )
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    //Err Instance member 'pages' cannot be used on type 'SwipingController' so add lazy
    private lazy var pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .mainRed
        pc.numberOfPages = pages.count
        return pc
    }()
    
    fileprivate func setupBottomControls() {

        let bottomControlStackView = UIStackView(arrangedSubviews:
            [previousButton,pageControl,nextButton]
        )
        bottomControlStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlStackView)
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
             bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
            
            ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        //print(x, view.frame.width, x / view.frame.width)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()
        
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
        cell.page = page
//        cell.ramenFirstView.image = UIImage(named: page.imageName)
//        cell.descriptionTextView.text = page.descriptionText
        
        return cell
    }
    //3 collectionViewLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
