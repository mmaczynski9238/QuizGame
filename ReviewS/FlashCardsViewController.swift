//
//  FlashCardsViewController.swift
//  ReviewS
//
//  Created by student3 on 10/20/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class FlashCardsViewController: UIViewController {
    
    @IBOutlet var firstView: UIView!
    @IBOutlet var FVLabel: UILabel!
    @IBOutlet var FVimageView: UIImageView!
    
    @IBOutlet var secondView: UIView!
    @IBOutlet var SVimageView: UIImageView!
    @IBOutlet var SVLabel: UILabel!
    
    @IBOutlet var cardLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var starButtonImageFV: UIButton!
    
    @IBOutlet var starButtonImageSV: UIButton!
    
    let starredCards: Array<StarredCard> = []
    
    let cards: Array<Card> = [
        Card(front: "Penny - Front", back: "Penny - Back", imagef: "fpenny", imageb: "bpenny"),
        Card(front: "Nickel - Front", back: "Nickel - Back", imagef: "fnickel", imageb: "bnickel"),
        Card(front: "Dime - Front", back: "Dime - Back", imagef: "fdime", imageb: "bdime"),
        Card(front: "Dollar Coin - Front", back: "Dollar Coin - Back", imagef: "fdollarcoin", imageb: "bdollarcoin"),
        Card(front: "Dime - Front", back: "Dime - Back", imagef: "fdime", imageb: "bdime")
    ]
    var currentCard = 0
    var showFront = true
    
    @IBOutlet var fcview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondView.isHidden = true
        
        showCard()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FlashCardsViewController.touchHappen))
        view.addGestureRecognizer(tap)
        
    }
    
    func flip() {
        
        if self.firstView.isHidden == true
        {
            let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
            UIView.transition(with: firstView, duration: 1.0, options: transitionOptions, animations: {
                self.firstView.isHidden = false
            })
            
            UIView.transition(with: secondView, duration: 1.0, options: transitionOptions, animations: {
                self.secondView.isHidden = true
            })
            
        }
        else if self.secondView.isHidden == true
        {
            let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
            UIView.transition(with: firstView, duration: 1.0, options: transitionOptions, animations: {
                self.firstView.isHidden = true
            })
            UIView.transition(with: secondView, duration: 1.0, options: transitionOptions, animations: {
                self.secondView.isHidden = false
            })
        }
    }
    
    func touchHappen() {
        self.view.endEditing(true)
        print("tapped")
        flipCard()
    }
    
    @IBAction func swipeLeftSV(_ sender: UISwipeGestureRecognizer) {
        firstView.slideInFromRight()
        secondView.slideInFromRight()
        
        self.currentCard += 1
        self.showFront = true
        
        if (self.currentCard >= self.cards.count) {
            self.currentCard = 0
        }
        showCard()
    }
    
    @IBAction func swipeRightSV(_ sender: UISwipeGestureRecognizer) {
        
        self.showFront = true
        if (self.currentCard == 0) {
        } else {
            self.currentCard -= 1
            firstView.slideInFromLeft()
            secondView.slideInFromLeft()
        }
        showCard()
    }
    
    @IBAction func swipeLeftFV(_ sender: UISwipeGestureRecognizer) {
        
        firstView.slideInFromRight()
        secondView.slideInFromRight()
        
        self.currentCard += 1
        self.showFront = true
        
        if (self.currentCard >= self.cards.count) {
            self.currentCard = 0
        }
        showCard()
    }
    
    @IBAction func swipeRightFV(_ sender: UISwipeGestureRecognizer) {
        
        self.showFront = true
        
        if (self.currentCard == 0) {
            
        } else {
            self.currentCard -= 1
            firstView.slideInFromLeft()
            secondView.slideInFromLeft()
        }
        showCard()
    }
    
    func sRight()
    {
        firstView.slideInFromRight()
        secondView.slideInFromRight()
        
        self.currentCard += 1
        self.showFront = true
        
        if (self.currentCard >= self.cards.count) {
            self.currentCard = 0
        }
        showCard()
    }
    
    func sLeft()
    {
        self.showFront = true
        
        if (self.currentCard == 0) {
            
        } else {
            self.currentCard -= 1
            firstView.slideInFromLeft()
            secondView.slideInFromLeft()
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
        perform(#selector(flip), with: nil, afterDelay: 0)
        
        if (self.showFront) {
            self.showFront = false
        }
        else {
            self.showFront = true
        }
        showCard()
        
    }
    
    func showCard() {
        
        self.SVLabel.text = self.cards[self.currentCard].back
        
        let cbimage = "\(self.cards[self.currentCard].imageb)"
        print(cbimage)
        SVimageView.image = UIImage(named:"\(cbimage)")!
        
        self.FVLabel.text = self.cards[self.currentCard].front
        
        let cimage = "\(self.cards[self.currentCard].imagef)"
        print(cimage)
        FVimageView.image = UIImage(named:"\(cimage)")!
        
    }
    
    
    @IBAction func starCurrentFlashcard(_ sender: UIButton) {
        let starredCards: Array<StarredCard> = [

        StarredCard(frontS: "\(self.cards[self.currentCard].front)", backS: "\(self.cards[self.currentCard].back)", imagefS: "\(self.cards[self.currentCard].imagef)", imagebS: "\(self.cards[self.currentCard].imageb)")
    ]
    
//        if starButtonImageSV.currentImage == UIImage(named: "highlightedStar") as UIImage?
//        {
//            
//            let S = UIImage(named: "star") as UIImage?
//            
//            starButtonImageSV.setImage(S, for: .normal)
//        } else {
            let HS = UIImage(named: "highlightedStar") as UIImage?
            
            starButtonImageSV.setImage(HS, for: .normal)
            
//        }

        
    }
    
    @IBAction func starCurrentFlashcardFIrstView(_ sender: UIButton) {
        let starredCards: Array<StarredCard> = [
            
            StarredCard(frontS: "\(self.cards[self.currentCard].front)", backS: "\(self.cards[self.currentCard].back)", imagefS: "\(self.cards[self.currentCard].imagef)", imagebS: "\(self.cards[self.currentCard].imageb)")
        ]
        
//        if starButtonImageFV.currentImage == UIImage(named: "highlightedStar") as UIImage?
//        {
//            
//        let S = UIImage(named: "star") as UIImage?
//
//        starButtonImageFV.setImage(S, for: .normal)
//            
//        } else if starButtonImageFV.currentImage == UIImage(named: "star") as UIImage? {
            let HS = UIImage(named: "highlightedStar") as UIImage?
            
            starButtonImageFV.setImage(HS, for: .normal)

//        }
        
    }
    
    
}
