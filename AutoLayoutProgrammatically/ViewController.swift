//
//  ViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by Frank Su on 2019-10-25.
//  Copyright © 2019 frankusu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        let descriptionHeader = "Join us for delicious Ramen!"
        let descriptionSubtitle = "\n\n\nThere's a variety of flavors such as shio, miso, and shoyu to choose from."
        var descriptionText = UITextView()
        var attributedText = NSMutableAttributedString(string: descriptionHeader, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: descriptionSubtitle, attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]))
        
        descriptionText.attributedText = attributedText
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.textAlignment = .center
        descriptionText.isEditable = false
        descriptionText.isScrollEnabled = false
        return descriptionText
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //needs to addSubview before layout or else 'Unable to activate constraint with anchors'
        view.addSubview(descriptionTextView)
        
        layoutSetup()
        
    }

    func layoutSetup() {
        let topImageContainerView = UIView()
        
        view.addSubview(topImageContainerView)
        //enable autolayout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.addSubview(ramenFirstView)
        
        ramenFirstView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
        ramenFirstView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        ramenFirstView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

