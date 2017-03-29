//
//  TestViewController.swift
//  ReviewS
//
//  Created by student3 on 11/16/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit
import CloudKit

struct Question{
    var Question : String!
    var Answers : [String]!
    var Answer : Int!
}



class TestViewController: UIViewController {
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet weak var incorrectLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var theEnd: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet var labelButton1: UILabel!
    @IBOutlet var labelButton2: UILabel!
    @IBOutlet var labelButton3: UILabel!
    @IBOutlet var labelButton4: UILabel!
    var counter = 1
    
    var CQCount = 0
    
    var numOfQuestions = 0

    
    var timerCounter = 0
    
    var scoreLbl = UILabel()
    
    var timer = Timer()
    
    var score = Int()
    
    var Questions = [Question]()
    
    var QNumber = Int()
    
    var AnswerNumber = Int()
    
    var wrongAnswers = Int()
    
    var correctAnswers = Int()
    
    var incorrectAnswers = 0
    
    var timeScore = 0
    
    var newCounter = 0
    
    var saveScore = [CKRecord]()
    
    var publicData = CKContainer.default().publicCloudDatabase
    
    var newScore = CKRecord(recordType: "Score")

    
    
    @IBOutlet weak var QLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resetQuestions()
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        
        scoreLbl = UILabel(frame: CGRect(x: 35, y: 45, width: 77, height: 45))
        scoreLbl.textAlignment = NSTextAlignment.center
        scoreLbl.text = "0"
        scoreLbl.textColor = UIColor.white
        self.scoreLbl.font = UIFont(name: "HelveticaNeue", size:35)
        self.view.addSubview(scoreLbl)
        
        pickQuestions()
        findCount()
    }
    
    func findCount()
    {
        numOfQuestions = Questions.count
    }
    
    func findCurrentQuestion()
    {
        
        
        CQCount += 1
        
        if CQCount == numOfQuestions+1 {
            var count = 0
        }
        currentQuestionLabel.text = "\(CQCount)" + "/" + "\(numOfQuestions)"
        
    }
    
    func resetQuestions(){
        Questions = [Question(Question: "What is the Biggest Hit of Bing Crosby?" , Answers: ["Swinging on a Star", "Now is the Hour", "White Christmas", "Beautiful Dreamer"], Answer: 2),
                     Question(Question: "What is Elvis Presely's Middle Name?", Answers: ["Aaron", "Michael", "George", "Matthew"], Answer: 0),
                     Question(Question: "How Many Oscars did Titanic win?", Answers: ["5", "7", "10", "11"], Answer: 3),
                     Question(Question: "From which country did Pita Bread originate?", Answers: ["Spain", "France", "Greece", "Russia"], Answer: 2),
                     Question(Question: "What is the largest living creature on Earth?", Answers: ["Whale", "Shark", "Sea Turtle", "Alligator"], Answer: 0),
                     Question(Question: "What does ATM stand for?", Answers: ["Automatic Treasure Machine", "Automatic Tax Machine", "Anti-Tax Machine", "Automatic Teller Machine"], Answer: 3),
                     Question(Question: "What's the world's second largest French speaking city?", Answers: ["Paris", "Montreal", "Versailles", "Québec"], Answer: 1),
                     Question(Question: "Which country is the largest exporter of potassium?", Answers: ["Kazakhstan", "France", "Greece", "Spain"], Answer: 0),
                     Question(Question: "How long is the Great Wall of China?", Answers: ["3200 miles", "4000 miles", "2000 kilometers", "4500 miles"], Answer: 1),
                     Question(Question: "Who is on the 10 dollar bill?", Answers: ["George Washington", "Thomas Jefferson", "Alexander Hamilton", "John Adams" ], Answer: 2),
                     Question(Question: "How many World Series did Yogi Berra win as a player?", Answers: ["11", "10", "5", "7" ], Answer: 1),
                     Question(Question: "Which three countries hosted the Winter Olympics during the 1990's?", Answers: ["Norway, France, Russia", "US, Sweden, Canada", "Japan, Canada, Germany", "Slovenia, France, South Korea" ], Answer: 0),
                     Question(Question: "Which of these foods is high in Vitamin C?", Answers: ["Carrot", "Potato", "Corn", "Tomato" ], Answer: 3),
                     Question(Question: "How did John D. Rockefeller make his fortune?", Answers: ["Steel Industry", "Car Industry", "Oil Industry", "RailRoads" ], Answer: 2),
                     Question(Question: "Who won the NBA Finals in 2014-2015?", Answers: ["Golden State Warriors", "Clevland Cavaliers", "Chicago Bulls", "Miami Heat" ], Answer: 3),
                     Question(Question: "How many branches of government are there in the US?", Answers: ["2", "1", "3", "4" ], Answer: 2),
                     Question(Question: "What were two common foods eaten by Americans during the Great Depression?", Answers: ["Soup and Bread", "Beans and Bread", "Potatos and Soup", "Bread and Potatos" ], Answer: 1),
                     //                     Question(Question: "Where are the Aleutian Islands?", Answers: ["Alaska, USA", "Northwest Territory, Canada", "Siberia, Russia", "Hawaii"], Answer: 1),
            Question(Question: "Which of the following NBA players below was drafted first overall?", Answers: ["Michael Jordan", "Stephen Curry", "Kevin Durant", "Lebron James"], Answer: 3),]
        
    }
    func pickQuestions(){
        
        
        restartBtn.isEnabled = false
        if Questions.count > 0 && counter <= 15 {
            QNumber = Int(arc4random_uniform(UInt32(Questions.count)))
            QLabel.text = Questions[QNumber].Question
            
            AnswerNumber = Questions[QNumber].Answer
            
            for i in 0..<Buttons.count{
                //button1.setTitle(Questions[QNumber].Answers[0], for: UIControlState())
                labelButton1.text = Questions[QNumber].Answers[0]
                //button2.setTitle(Questions[QNumber].Answers[1], for: UIControlState())
                labelButton2.text = Questions[QNumber].Answers[1]
                //button3.setTitle(Questions[QNumber].Answers[2], for: UIControlState())
                labelButton3.text = Questions[QNumber].Answers[2]
                //button4.setTitle(Questions[QNumber].Answers[3], for: UIControlState())
                labelButton4.text = Questions[QNumber].Answers[3]
                
            }
            Questions.remove(at: QNumber)
        }
            
            
        else{
            timer.invalidate()
            theEnd.text = "Click Restart to Play Again"
            theEnd.alpha = 1
            button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
            button4.isEnabled = false
            restartBtn.isEnabled = true
            savedScore()
            reset()
        }
        
        
        incorrectLabel.alpha = 0
        
    }
    
    func loadData()
    {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Score", predicate: predicate)
        
        publicData.perform(query, inZoneWith: nil) { (records, error) in
            
            let variable = records!.last!.object(forKey: "timerScore1")
            print(variable!)
        }
    }
    

    func savedScore(){
        newScore["timerScore1"] = score as CKRecordValue?
        var publicData = CKContainer.default().publicCloudDatabase
        publicData.save(newScore , completionHandler: {(record, error) -> Void in
            if error == nil{
                print("Answer Saved")
            }
            else{
                print("Answer Not Saved")
            }
        })
        self.loadData()

    }
    func reset(){
       // var alert = UIAlertController(title: "You Win", message: "Click Restart To Play Again", preferredStyle: UIAlertControllerStyle.alert)
        //var okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
      //  alert.addAction(okAction)
  //      present(alert, animated: true, completion:nil)
   //     counter = 0
        //        print(incorrectAnswers)
 //       pickQuestions()
        
        
        
        
        
        
    }
   
    
    
    
    @IBAction func startButton(_ sender: UIButton) {
        //createTimer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: ("updateTimer"), userInfo: nil, repeats: true)
        button4.isEnabled = true
        button3.isEnabled = true
        button2.isEnabled = true
        button1.isEnabled = true

        
    }
    func updateTimer(){
        score += 1
        scoreLbl.text = "\(score)"
        startButton.isEnabled = false
        
        
        
    }
    @IBAction func Btn1(_ sender: AnyObject) {
        if AnswerNumber == 0{
            
            pickQuestions()
            findCurrentQuestion()
        }
        else{
            incorrectLabel.text = "Incorrect!"
            incorrectLabel.alpha = 1
            score += 1
            scoreLbl.text = "\(score)"
            
            
        }
    
        
    }
    @IBAction func Btn2(_ sender: AnyObject) {
        if AnswerNumber == 1{
            
            pickQuestions()
            findCurrentQuestion()
        }
        else{
            incorrectLabel.text = "Incorrect!"
            incorrectLabel.alpha = 1
            score += 1
            scoreLbl.text = "\(score)"
            
        }
}
    @IBAction func Btn3(_ sender: AnyObject) {
        if AnswerNumber == 2{
            
            pickQuestions()
            findCurrentQuestion()
        }
        else{
            incorrectLabel.text = "Incorrect!"
            incorrectLabel.alpha = 1
            score += 1
            scoreLbl.text = "\(score)"
            
        }
}

    @IBAction func Btn4(_ sender: AnyObject) {
        if AnswerNumber == 3{
            
            pickQuestions()
            findCurrentQuestion()
        }
            
        else{
            incorrectLabel.text = "Incorrect!"
            incorrectLabel.alpha = 1
            score += 1
            scoreLbl.text = "\(score)"
            
        }
    }
}
