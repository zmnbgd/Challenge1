//
//  DetailViewController.swift
//  Challenge1
//
//  Created by Marko Zivanovic on 13.3.21..
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var pictureView: UIImageView!
    
    var selectedPicture: String?
    
    var selectedPictureNumber = 0
    var totalPicturesNumber = 0 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title = selectedPicture
        title = "Picture \(selectedPictureNumber) of \(totalPicturesNumber)"
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedPicture {
            pictureView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false 
    }
}
