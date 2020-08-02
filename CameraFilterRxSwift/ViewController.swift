//
//  ViewController.swift
//  CameraFilterRxSwift
//
//  Created by mohamed  habib on 02/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navC = segue.destination as? UINavigationController,
            let photosCVC = navC.viewControllers.first as? PhotosCollectionViewController
            
        else { fatalError(" segue destination is not found ") }
        
        photosCVC.selectedPhoto.subscribe(onNext: { [weak self] (photo) in
            
            self?.photoImageView.image = photo
            
            }).disposed(by: disposeBag)
    }
}

