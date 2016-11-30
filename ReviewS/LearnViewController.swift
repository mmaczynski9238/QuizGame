//
//  LearnViewController.swift
//  ReviewS
//
//  Created by student3 on 11/16/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController {

    
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var incorrectLabel: UILabel!
    
    
    
    typealias termAnswers = (String, String)
    var termAnswer: [termAnswers] = [termAnswers]()
    var score = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        termAnswer.append(("brent","gurvis"))
        termAnswer.append(("Mac and", "cheese"))
        print(termAnswer.last?.0)
        
        
        termLabel.text = termAnswer.last?.0
        
        
    }
    
    @IBAction func checkButton(_ sender: AnyObject) {
        if answerTextField.text == termAnswer.last?.1
        {
            correctLabel.text = "\(score)"
            score += 1
        }
        else{
            incorrectLabel.text = "\(score)"
            score += 1
            
        }

    }
    
}
    
    

    
    


