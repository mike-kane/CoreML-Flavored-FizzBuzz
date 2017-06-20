//
//  ViewController.swift
//  Fizz-Buzz with Image Recognizer
//
//  Created by Michael Kane on 6/16/17.
//  Copyright © 2017 Mike Kane. All rights reserved.
//

import UIKit
import CoreML

class ViewController: UIViewController {
    
    var lastPoint = CGPoint.zero
    var swiped = false
    var opacity: CGFloat = 1.0
    
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        // Clears all curent user inputs
    }
    
    @IBAction func submitNumberButtonPressed(_ sender: Any) {
        // submits user input for image classification
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        // converts all user input to a number and plays fizzbuzz
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let test = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0]
        let helper = clfHelper()
        print("The output is a \(helper.readOutput(outputFromModel: test))!")
    }
    
}

