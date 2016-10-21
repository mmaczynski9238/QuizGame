//
//  UploadQViewController.swift
//  ReviewS
//
//  Created by student3 on 10/20/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class UploadQViewController: UIViewController {

    
    let length:Int = 55
    
    let hieght:Int = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       createBlocks()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createBlocks()
    {
        
        var x:Int = 20
        var y:Int = 179
        var textField = UIView()
        
        
        for _ in 1...5
        {
            for _ in 1...12
            {
                //it has a vowel
                //its a word
                textField = UITextField(frame:CGRect (x: x, y: y, width: length, height: hieght))
                view.addSubview(textField)
                print ("textField")
                
                
                x += 90
            }
            x = 20
            y += 70
        }
        
    }

}
