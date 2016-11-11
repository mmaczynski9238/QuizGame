//
//  UploadQViewController.swift
//  ReviewS
//
//  Created by student3 on 10/20/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit


public extension UIView {
    func fadeIn(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0})}
    func fadeOut(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0})}}




class UploadQViewController: UIViewController {
    
    @IBOutlet var savedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func saveFlashcard(_ sender: UIButton) {
        
        
        savedLabel.text = "Flashcard Saved"
        savedLabel.textColor = UIColor.black
        savedLabel.alpha = 0.0
        savedLabel.fadeIn(duration: 0.1)
        savedLabel.fadeOut(duration: 0.5)

    }
}
