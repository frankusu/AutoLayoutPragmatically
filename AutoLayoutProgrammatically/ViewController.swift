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
        return imageView
    }()
    
    let descriptionTextView : UITextView = {
        var descriptionText = UITextView()
        descriptionText.text = "Join us for delicious Ramen!"
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.textAlignment = .center
        descriptionText.font = UIFont.boldSystemFont(ofSize: 18)
        descriptionText.isEditable = false
        descriptionText.isScrollEnabled = false
        return descriptionText
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(ramenFirstView)
        view.addSubview(descriptionTextView)
        
        layoutSetup()
        
    }

    func layoutSetup() {
        ramenFirstView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ramenFirstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        ramenFirstView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        ramenFirstView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: ramenFirstView.bottomAnchor, constant: 150).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
}

