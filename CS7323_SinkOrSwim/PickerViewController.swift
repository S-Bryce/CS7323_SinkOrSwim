//
//  PickerViewController.swift
//  CS7323_SinkOrSwim
//
//  Created by Bryce Shurts on 9/12/23.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    lazy var imageModel:ImageModel = {
        return ImageModel.sharedInstance()
    }()
    
    private var _old_scaler: Double = 1.0
    
    @IBOutlet weak var inverter: UISegmentedControl!
    @IBOutlet weak var flipper: UISwitch!
    @IBOutlet weak var sizeStepper: UIStepper!
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var miniImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        
        sizeStepper.maximumValue = 1.2
        sizeStepper.minimumValue = 0.8
        sizeStepper.stepValue = 0.1
        sizeStepper.value = 1.0
        
        flipper.setOn(false, animated: false)
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        
        var corrective_scaler: Double = 1.0
        if _old_scaler < 1.0 {
            corrective_scaler = 1 + (1 - _old_scaler)
        } else {
            corrective_scaler = 1 - (_old_scaler - 1)
        }
        
        miniImage.transform = CGAffineTransformScale(miniImage.transform, corrective_scaler, corrective_scaler)
        
        miniImage.transform = CGAffineTransformScale(miniImage.transform, sizeStepper.value, sizeStepper.value)
        _old_scaler = sizeStepper.value
    }
    
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if flipper.isOn {
            miniImage.transform = CGAffineTransformRotate(miniImage.transform, CGFloat.pi)
        } else {
            miniImage.transform = CGAffineTransformRotate(miniImage.transform, -0.999 * CGFloat.pi)
        }
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        if inverter.selectedSegmentIndex == 0 {
            miniImage.tintColor = nil
        } else {
            miniImage.tintColor = UIColor.red
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageModel.numberOfImages()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageModel.getImageNameIndex(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        miniImage.image = imageModel.getImageWith(row)
    }
}
