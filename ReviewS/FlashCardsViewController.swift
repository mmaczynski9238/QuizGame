//
//  FlashCardsViewController.swift
//  ReviewS
//
//  Created by student3 on 10/20/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit


//public extension UIView {
//    func fadeIn(duration duration: NSTimeInterval = 1.0) {
//        UIView.animateWithDuration(duration, animations: {
//            self.alpha = 1.0})}
//    func fadeOut(duration duration: NSTimeInterval = 1.0) {
//        UIView.animateWithDuration(duration, animations: {
//            self.alpha = 0.0})}}
//


class FlashCardsViewController: UIViewController {
    
    @IBOutlet var cardLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    let cards: Array<Card> = [
        Card(front: "Penny - Front", back: "Penny - Back", imagef: "fpenny", imageb: "bpenny"),
        Card(front: "Nickel - Front", back: "Nickel - Back", imagef: "fnickel", imageb: "bnickel"),
        Card(front: "Dime - Front", back: "Dime - Back", imagef: "fdime", imageb: "bdime"),
        Card(front: "Dollar Coin - Front", back: "Dollar Coin - Back", imagef: "fdollarcoin", imageb: "bdollarcoin"),
        Card(front: "Dime - Front", back: "Dime - Back", imagef: "fdime", imageb: "bdime")
        
    ]
    ////
    var currentCard = 0
    var showFront = true
    @IBOutlet var fcview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showCard()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FlashCardsViewController.touchHappen))
        view.addGestureRecognizer(tap)
        
        
    }
    
    func touchHappen() {
        self.view.endEditing(true)
        print("tapped")
        flipCard()
    }
    
    
    func receiveQuestions()
    {
        //        if error = nil
        //        {
        //            scorePlusLabel.text = "Flashcard Saved"
        //            scorePlusLabel.textColor = UIColor.blackColor()
        //            scorePlusLabel.alpha = 0.0
        //            scorePlusLabel.fadeIn(duration: 0.1)
        //            scorePlusLabel.fadeOut(duration: 0.3)
        //
        //        }
    }
    
    
    
    @IBAction func swipeLeft(sender: AnyObject) {
        sLeft()
        print("Swiped Left")
        
        
    }
    
    @IBAction func swipeRight(sender: AnyObject) {
        sRight()
        print("Swiped Right")
        
    }
    
    func sRight()
    {
        self.currentCard += 1
        self.showFront = true
        
        if (self.currentCard >= self.cards.count) {
            self.currentCard = self.cards.count - 1
        }
        
        showCard()
        
    }
    
    func sLeft()
    {
        self.currentCard -= 1
        self.showFront = true
        
        if (self.currentCard < 0) {
            self.currentCard = 0
        }
        
        showCard()
        
    }
    @IBAction func nextTapped(sender: AnyObject) {
        sRight()
    }
    
    @IBAction func backTapped(sender: AnyObject) {
        sLeft()
    }
    
    func flipCard()
    {
        
        
        if (self.showFront) {
            self.showFront = false
        }
        else {
            self.showFront = true
        }
        showCard()
        
        
    }
    
    func showCard() {
        if (self.showFront) {
            self.cardLabel.text = self.cards[self.currentCard].front
            
            let cimage = "\(self.cards[self.currentCard].imagef)"
            print(cimage)
            imageView.image = UIImage(named:"\(cimage)")!

        }
        else {
            self.cardLabel.text = self.cards[self.currentCard].back
            
            
            let cbimage = "\(self.cards[self.currentCard].imageb)"
            print(cbimage)
            imageView.image = UIImage(named:"\(cbimage)")!

        }
        
    }
    @IBAction func flipCardTapped(sender: AnyObject) {
        flipCard()
    }
}
