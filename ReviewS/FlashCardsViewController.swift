//
//  FlashCardsViewController.swift
//  ReviewS
//
//  Created by student3 on 10/20/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class FlashCardsViewController: UIViewController {
    
    @IBOutlet var cardLabel: UILabel!
    
    let cards: Array<Card> = [
        Card(front: "front1", back: "back1"),
        Card(front: "front2", back: "back2"),
        Card(front: "front3", back: "back3")
    ]
    
    var currentCard = 0
    var showFront = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showCard()
    }
    @IBAction func nextTapped(sender: AnyObject) {
        self.currentCard += 1
        self.showFront = true
        
        if (self.currentCard >= self.cards.count) {
            self.currentCard = self.cards.count - 1
        }
        
        showCard()
    }
    
    @IBAction func backTapped(sender: AnyObject) {
        self.currentCard -= 1
        self.showFront = true
        
        if (self.currentCard < 0) {
            self.currentCard = 0
        }
        
        showCard()
    }
    
    @IBAction func flipCardTapped(sender: AnyObject) {
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
        }
        else {
            self.cardLabel.text = self.cards[self.currentCard].back
        }
    }
}
