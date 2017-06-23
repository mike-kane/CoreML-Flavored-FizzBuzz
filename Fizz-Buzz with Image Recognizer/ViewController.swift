//
//  ViewController.swift
//  Fizz-Buzz with Image Recognizer
//
//  Created by Michael Kane on 6/16/17.
//  Copyright © 2017 Mike Kane. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {
    
    var lastPoint = CGPoint.zero
    var swiped = false
    var opacity: CGFloat = 1.0
    
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    func drawLines(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        mainImageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setStrokeColor(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor)
        context?.strokePath()
        
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLines(fromPoint: lastPoint, toPoint: lastPoint)
        }
    }
    
    
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
        
//        let test = Keras_MNIST.prediction()
        print(testInput())
        
        
    }
    
    
    func testInput() {
        
        guard let y = try? MLMultiArray(shape: [1, 28, 28], dataType: MLMultiArrayDataType.double) else {
            fatalError("Error creating MLMultiArray!")
    }
        
        print(y.shape)
        print(y)
    
    }

}
