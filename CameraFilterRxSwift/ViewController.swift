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
    @IBOutlet weak var applyFilterButton: UIButton!
    
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
            
            DispatchQueue.main.async {
                self?.updateUI(with: photo)
            }
            
        }).disposed(by: disposeBag)
    }
    
    @IBAction func applyFilterButtonPressed(){
        
        guard let sourceImage = self.photoImageView.image else { return  }
        
        
        //        FilterService().applyFilter(to: sourceImage) { [weak self] filtredImage in
        //
        //            DispatchQueue.main.async {
        //                self?.photoImageView.image = filtredImage
        //            }
        //        }
        
        // Transforming Apply Filter into an Observable
        FilterService().applyFilter(to: sourceImage)
            .subscribe(onNext: { filtredImage in
                
                DispatchQueue.main.async {
                    self.photoImageView.image = filtredImage
                }
            }).disposed(by: disposeBag)
        
    }
    
    private func updateUI(with image: UIImage){
        
        self.photoImageView.image = image
        self.applyFilterButton.isHidden = false
        
    }
}

