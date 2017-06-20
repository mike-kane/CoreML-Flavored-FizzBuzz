//
//  clf_helper.swift
//  Fizz-Buzz with Image Recognizer
//
//  Created by Michael Kane on 6/19/17.
//  Copyright © 2017 Mike Kane. All rights reserved.
//

import Foundation

class clfHelper {
    // Singleton helper class designed to abstract away all of the image classification tasks.
    
    
    
    func readOutput(outputFromModel: Array<Double>) -> String {
        // Helper function.  Takes the one-hot encoded output from the model
        // and returns a string representation of the number it was classified as.
        var classification: Int!
        for i in outputFromModel {
            if i == 1 {
                classification = outputFromModel.index(of: i)! + 1
            }
        }
        return "\(classification!)"
    }
        
        
}
