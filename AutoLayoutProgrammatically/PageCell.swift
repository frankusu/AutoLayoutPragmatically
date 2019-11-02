//
//  PageCell.swift
//  AutoLayoutProgrammatically
//
//  Created by Frank Su on 2019-10-31.
//  Copyright © 2019 frankusu. All rights reserved.
//

import UIKit

class PageCell : UICollectionViewCell {
    
    // {} means closure. Need () to call it at end
    let ramenFirstView : UIImageView = {
        // type 'image Literal' to use inline picture
        let imageView = UIImageView(image: #imageLiteral(resourceName: "ramen_first"))
        //allows imageView to use autolayout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let descriptionTextView : UITextView = {
    //        let descriptionHeader = "Join us for delicious Ramen!"
    //        let descriptionSubtitle = "\n\n\nThere's a variety of flavors such as shio, miso, and shoyu to choose from."
            var textView = UITextView()
            var attributedText = NSMutableAttributedString(string: "Join us for delicious Ramen!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            //attributedText.append(NSAttributedString(string: "\n\n\nThere's a variety of flavors such as shio, miso, and shoyu to choose from.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray,NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13)]))
            
            textView.attributedText = attributedText
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.textAlignment = .center
            textView.isEditable = false
            textView.isScrollEnabled = false
            return textView
        }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutSetup()
    }
    
    
    
    func layoutSetup() {
        let topImageContainerView = UIView()
        //since PageCell is already a view, you don't need view.addSubview
        addSubview(topImageContainerView)
        //enable autolayout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.addSubview(ramenFirstView)
        
        ramenFirstView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
        ramenFirstView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        ramenFirstView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor,constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
