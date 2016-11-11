//
//  UploadQViewController.swift
//  ReviewS
//
//  Created by student3 on 10/20/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit
import CloudKit

public extension UIView {
    func fadeIn(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0})}
    func fadeOut(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0})}}




class UploadQViewController: UIViewController {
    
    typealias termAnswers = (String, String)
    var termAnswer: [termAnswers] = [termAnswers]()
    var terms = [CKRecord]()
    var answers = [CKRecord]()
    var publicData = CKContainer.default().publicCloudDatabase
    let newTA = CKRecord(recordType: "Flashcard")
    

    
    
    
    @IBOutlet var answerTextField: UITextField!
    @IBOutlet var termTextField: UITextField!
    @IBOutlet var savedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    
    
        func loadData(){
            terms = [CKRecord]()
            answers = [CKRecord]()
            let publicData = CKContainer.default().publicCloudDatabase
    
            let query = CKQuery(recordType: "Flashcard", predicate: NSPredicate(format: "TRUEPREDICATE", argumentArray: nil))
            query.sortDescriptors = [NSSortDescriptor(key: "creationDate",ascending: false)]
            publicData.perform(query, inZoneWith: nil) { (results:[CKRecord]?, NSError) in
                if let students = results{
                    self.terms = students
                    self.answers = students
    
                    }
                }
        }

    
    @IBAction func saveFlashcard(_ sender: UIButton) {
        
        if termTextField != nil && answerTextField != nil{
            var terms = termAnswer.last?.0
            var answers = termAnswer.last?.1
            
            let term = termTextField.text!
            let answer = answerTextField.text!
            termAnswer.append((term,answer))
            print(termAnswer.self)
            
            
            
            
            
            newTA["backcontent"] = answer as CKRecordValue?
            var publicData = CKContainer.default().publicCloudDatabase
            publicData.save(newTA, completionHandler: {(record, error) -> Void in
                if error == nil{
                    print("Answer Saved")
                }
                else{
                    print("Answer Not Saved")
                }
            })
            
            newTA["frontcontent"] = term as CKRecordValue?
            publicData = CKContainer.default().publicCloudDatabase
            publicData.save(newTA, completionHandler: {(record, error) -> Void in
                if error == nil{
                    print("Term Saved")
                }
                else{
                    print("Term Not Saved")
                    
                }
            })
            
            
        }
        termTextField.text = ""
        answerTextField.text = ""

        
        
        
        savedLabel.text = "Flashcard Saved"
        savedLabel.textColor = UIColor.black
        savedLabel.alpha = 0.0
        savedLabel.fadeIn(duration: 0.1)
        savedLabel.fadeOut(duration: 0.5)

    }
}
