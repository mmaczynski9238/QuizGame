//
//  StarredFlashCardsViewController.swift
//  ReviewS
//
//  Created by student3 on 12/6/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class StarredFlashCardsViewController: UIViewController {

    
    @IBOutlet var StarredFirstView: UIView!
    @IBOutlet var SFVimageView: UIImageView!
    @IBOutlet var SFVlabel: UILabel!

    
    @IBOutlet var StarredSecondView: UIView!
    @IBOutlet var SSVimageView: UIImageView!
    @IBOutlet var SSVlabel: UILabel!
    
    let cards: Array<Card> = [
        Card(front: "Penny - Front", back: "Penny - Back", imagef: "fpenny", imageb: "bpenny"),
        Card(front: "Nickel - Front", back: "Nickel - Back", imagef: "fnickel", imageb: "bnickel"),
        Card(front: "Dime - Front", back: "Dime - Back", imagef: "fdime", imageb: "bdime"),
        Card(front: "Dollar Coin - Front", back: "Dollar Coin - Back", imagef: "fdollarcoin", imageb: "bdollarcoin"),
        Card(front: "Dime - Front", back: "Dime - Back", imagef: "fdime", imageb: "bdime")
    ]
    var currentCard = 0
    var showFront = true

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        StarredSecondView.isHidden = true
        
        showCard()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FlashCardsViewController.touchHappen))
        view.addGestureRecognizer(tap)
        

    }
    
    func flip() {
        
        if self.StarredFirstView.isHidden == true
        {
            let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
            UIView.transition(with: StarredFirstView, duration: 1.0, options: transitionOptions, animations: {
                self.StarredFirstView.isHidden = false
            })
            
            UIView.transition(with: StarredSecondView, duration: 1.0, options: transitionOptions, animations: {
                self.StarredSecondView.isHidden = true
            })
            
        }
        else if self.StarredSecondView.isHidden == true
        {
            let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
            UIView.transition(with: StarredFirstView, duration: 1.0, options: transitionOptions, animations: {
                self.StarredFirstView.isHidden = true
            })
            UIView.transition(with: StarredSecondView, duration: 1.0, options: transitionOptions, animations: {
                self.StarredSecondView.isHidden = false
            })
        }
    }
    
    func touchHappen() {
        self.view.endEditing(true)
        print("tapped")
        flipCard()
    }
    
    @IBAction func swipeLeftSSV(_ sender: UISwipeGestureRecognizer) {
        StarredFirstView.slideInFromRight()
        StarredSecondView.slideInFromRight()
        
        self.currentCard += 1
        self.showFront = true
        
        if (self.currentCard >= self.cards.count) {
            self.currentCard = 0
        }
        showCard()
    }
    
    @IBAction func swipeRightSSV(_ sender: UISwipeGestureRecognizer) {
        
        self.showFront = true
        if (self.currentCard == 0) {
        } else {
            self.currentCard -= 1
            StarredFirstView.slideInFromLeft()
            StarredSecondView.slideInFromLeft()
        }
        showCard()
    }
    
    @IBAction func swipeLeftSFV(_ sender: UISwipeGestureRecognizer) {
        
        StarredFirstView.slideInFromRight()
        StarredSecondView.slideInFromRight()
        
        self.currentCard += 1
        self.showFront = true
        
        if (self.currentCard >= self.cards.count) {
            self.currentCard = 0
        }
        showCard()
    }
    
    @IBAction func swipeRightSFV(_ sender: UISwipeGestureRecognizer) {
        
        self.showFront = true
        
        if (self.currentCard == 0) {
            
        } else {
            self.currentCard -= 1
            StarredFirstView.slideInFromLeft()
            StarredSecondView.slideInFromLeft()
        }
        showCard()
    }
    
    func sRight()
    {
        StarredFirstView.slideInFromRight()
        StarredSecondView.slideInFromRight()
        
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
            StarredFirstView.slideInFromLeft()
            StarredSecondView.slideInFromLeft()
        }
        showCard()
    }
    @IBAction func SnextTapped(_ sender: UIButton) {
        sRight()
    }
    
    @IBAction func SbackTapped(_ sender: UIButton) {
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
        
        self.SSVlabel.text = self.cards[self.currentCard].back
        
        let cbimage = "\(self.cards[self.currentCard].imageb)"
        print(cbimage)
        SSVimageView.image = UIImage(named:"\(cbimage)")!
        
        self.SFVlabel.text = self.cards[self.currentCard].front
        
        let cimage = "\(self.cards[self.currentCard].imagef)"
        print(cimage)
        SFVimageView.image = UIImage(named:"\(cimage)")!
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func dismissButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)

    }

}
