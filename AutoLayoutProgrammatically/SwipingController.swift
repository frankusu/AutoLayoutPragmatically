//
//  SwipingController.swift
//  AutoLayoutProgrammatically
//
//  Created by Frank Su on 2019-10-31.
//  Copyright © 2019 frankusu. All rights reserved.
//

import Foundation
import UIKit

class SwipingController : UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //backgroundColor doesn't show any color... why ?
        //view.backgroundColor = .gray
        collectionView?.backgroundColor = .green
    }
}
