//
//  FilterService.swift
//  CameraFilterRxSwift
//
//  Created by mohamed  habib on 02/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

class FilterService {
    
    private var context: CIContext
    
    init() {
        self.context = CIContext()
    }
    
    func applyFilter(to inputImage: UIImage, completion: @escaping ((UIImage) -> ())) {
        
        let filter = CIFilter(name: "CICMYKHalftone")!
        filter.setValue(5.0, forKey: kCIInputWidthKey)
        
        if let sourceImage = CIImage(image: inputImage){
            filter.setValue(sourceImage, forKey: kCIInputImageKey)
            
            if let cgimg = self.context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent ) {
                
                let proccessedImage = UIImage(cgImage: cgimg, scale: inputImage.scale, orientation: inputImage.imageOrientation)
                
                completion(proccessedImage)
            }
        }
        
        
    }
}
