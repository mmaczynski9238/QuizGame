//
//  UploadQViewController.swift
//  ReviewS
//
//  Created by student3 on 10/20/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class UploadQViewController: UIViewController {
    
    
    let length:Int = 255
    
    let hieght:Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        createBlocks1()
        createBlocks2()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createBlocks1()
    {
        
        var x:Int = 20
        var y:Int = 179
        var textField = UITextField()
        
        for _ in 1...10
        {
            for _ in 1...2
            {
                
                textField = UITextField(frame:CGRect (x: x, y: y, width: length, height: hieght))
                view.addSubview(textField)
                
                
                x += 90
            }
            textField.placeholder = "ENTER TERM"
            
            x = 20
            y += 70
        }
        
    }
    func createBlocks2()
    {
        
        var x1:Int = 410
        var y1:Int = 179
        var textField = UITextField()
        
        
        for _ in 1...10
        {
            for _ in 1...2
            {
                
                textField = UITextField(frame:CGRect (x: x1, y: y1, width: length, height: hieght))
                view.addSubview(textField)
                
                x1 += 90
            }
            textField.placeholder = "ENTER ANSWER"
            
            x1 = 410
            y1 += 70
        }
        
    }
    
    //326
    //914
    
    
}
