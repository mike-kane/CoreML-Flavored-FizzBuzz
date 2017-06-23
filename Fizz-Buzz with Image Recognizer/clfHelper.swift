//
//  clf_helper.swift
//  Fizz-Buzz with Image Recognizer
//
//  Created by Michael Kane on 6/19/17.
//  Copyright © 2017 Mike Kane. All rights reserved.
//

import Foundation
import UIKit
import CoreML

class clfHelper {
    // Singleton helper class designed to abstract away all of the image classification tasks.
    
    func readOutput(outputFromModel: Keras_MNISTOutput) -> String {
        // Helper function.  Takes the one-hot encoded output from the model
        // and returns a string representation of the number it was classified as.
//        var classification: Int!
        
        let oneHot = outputFromModel.output1
        print(oneHot)
        print(oneHot.shape)
        return ""
    }
    
    func prepareInputs(image: CGImage) -> Array<Double> {
        // TODO: Get Image
        // Resize to 28 x 28
        // Flatten to 1-dimensional array and return
        
        //placeholder return statement to silence error
        return [0.0]
    }
    
    func resizeImage(image: UIImage) -> UIImage? {
        let heightScale = 28 / image.size.height
        let widthScale = 28 / image.size.width
        
        let scaledHeight = image.size.height * heightScale
        let scaledWidth = image.size.width * widthScale
        
        UIGraphicsBeginImageContext(CGSize(width: scaledWidth, height: scaledHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: scaledWidth, height: scaledHeight))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
//    func processImage(image: CGImage) -> CVPixelBuffer? {
//        
//        let frameSize = CGSize(width: image.width, height: image.height)
//        var pixelBuffer: CVPixelBuffer? = nil
//        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(frameSize.width), Int(frameSize.height), kCVPixelFormatType_32BGRA, nil, &pixelBuffer)
//        
//        if status !=  kCVReturnSuccess {
//            print("error creating the pixel buffer!")
//            return nil
//        }
//        
//        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags.init(rawValue: 0))
//        let data = CVPixelBufferGetBaseAddress(pixelBuffer!)
//        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
//        let bitmapInfo = CGBitmapInfo(rawValue:  CGBitmapInfo.byteOrder32Little.rawValue | )
//        
//    }
    
}


