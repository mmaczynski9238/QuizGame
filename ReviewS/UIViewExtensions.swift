//
//  UIViewExtensions.swift
//  ReviewS
//
//  Created by Michael Maczynski on 12/2/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    // slideFromLeft, slideRight, slideLeftToRight, etc. are great alternative names
    func slideInFromLeft(duration: TimeInterval = 0.3, completionDelegate: AnyObject? = nil) {
        // Create a CATransition animation
        let slideInFromLeftTransition = CATransition()
        
//        // Set its callback delegate to the completionDelegate that was provided (if any)
//        if let delegate: AnyObject = completionDelegate {
//            slideInFromLeftTransition.delegate = delegate
//        }
        
        // Customize the animation's properties
        slideInFromLeftTransition.type = kCATransitionPush
        slideInFromLeftTransition.subtype = kCATransitionFromLeft
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromLeftTransition.fillMode = kCAFillModeRemoved
        
        // Add the animation to the View's layer
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
    }
    
    func slideInFromRight(duration: TimeInterval = 0.3, completionDelegate: AnyObject? = nil) {
        // Create a CATransition animation
        let slideInFromRightTransition = CATransition()
        
        //        // Set its callback delegate to the completionDelegate that was provided (if any)
        //        if let delegate: AnyObject = completionDelegate {
        //            slideInFromRightTransition.delegate = delegate
        //        }
        
        // Customize the animation's properties
        slideInFromRightTransition.type = kCATransitionPush
        slideInFromRightTransition.subtype = kCATransitionFromRight
        slideInFromRightTransition.duration = duration
        slideInFromRightTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromRightTransition.fillMode = kCAFillModeRemoved
        
        // Add the animation to the View's layer
        self.layer.add(slideInFromRightTransition, forKey: "slideInFromLeftTransition")
    }

}
