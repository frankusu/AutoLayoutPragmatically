//
//  SwipingController+Extension.swift
//  AutoLayoutProgrammatically
//
//  Created by Frank Su on 2019-11-08.
//  Copyright © 2019 frankusu. All rights reserved.
//

import UIKit

extension SwipingController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        
        coordinator.animate(alongsideTransition: { (_) in
            //invalidates the current layout and triggers a layout update
            self.collectionViewLayout.invalidateLayout()
            //problem. When we rotate, its off center. You have to click it for it to snap back
            
            
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                //scrolls the items in collectionView to its proper page
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }) { (_) in
        
        }
    }
}
