//
//  PhotosCollectionViewController.swift
//  CameraFilterRxSwift
//
//  Created by mohamed  habib on 02/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit
import Photos

class PhotosCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populatePhotos()
        
    }
    
    private func populatePhotos(){
        
        PHPhotoLibrary.requestAuthorization { status in
            
            if status == .authorized {
                
                //access the photos from photo library
                
            }
        }
    }
}
