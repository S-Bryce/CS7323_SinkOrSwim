//
//  ViewController.swift
//  CS7323_SinkOrSwim
//
//  Created by Bryce Shurts on 9/6/23.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var topLeftImageView: UIImageView!
    @IBOutlet weak var bottomHalfImageView: UIScrollView!
    
    
    @IBOutlet weak var selectedImageLabel: UILabel!
    @IBOutlet weak var selectedImage: UIImageView!
    
    @IBOutlet weak var colorSlider: UISlider!
    
    private var _timer: Timer?
    private var _imageIndex = 0
    private var _selectedImageName: String? = "exclamationmark.3"
    
    lazy var imageModel:ImageModel = {
        return ImageModel.sharedInstance()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize the timer to change images every 5 seconds
        _timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
        // Initially set the image in the top left ImageView
        topLeftImageView.image = imageModel.getImageWith(_imageIndex)
    }
    
    
    @IBAction func colorSliderChanged(_ sender: Any) {
        selectedImage.tintColor = UIColor(red: 0.0, green: 0.0, blue: CGFloat(colorSlider.value), alpha: 1.0)
    }
    
    @objc func changeImage() {
        _imageIndex += 1
        if _imageIndex >= imageModel.numberOfImages() {
            _imageIndex = 0
        }
        topLeftImageView.image = imageModel.getImageWith(_imageIndex)
        _selectedImageName = imageModel.getImageNameIndex(_imageIndex)
        
    }
    
    // Implement the action for the button to select a picture for the bottom half ImageView
    @IBAction func selectPictureButtonTapped(_ sender: UIButton) {
        selectedImage.image = topLeftImageView.image
        selectedImageLabel.text = _selectedImageName
    }

}



