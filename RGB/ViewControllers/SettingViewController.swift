//
//  ViewController.swift
//  RGB
//
//  Created by deshollow on 29.09.2023.
//

import UIKit

protocol SettingViewControllerDelegate: AnyObject {
    func sendColorToStartView(_ color: UIColor)
}

final class SettingViewController: UIViewController {
    
    @IBOutlet weak var rgbDisplay: UIView!
    
    @IBOutlet weak var redColorValue: UILabel!
    @IBOutlet weak var greenColorValue: UILabel!
    @IBOutlet weak var blueColorValue: UILabel!
    
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    
    weak var delegate: SettingViewControllerDelegate!
    
    var currentColor: UIColor!
    var backgroundColorFromStartView: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rgbDisplay.layer.cornerRadius = 15
//        setCurrentColor()
        
        navigationItem.hidesBackButton = true
        
        rgbDisplay.backgroundColor = backgroundColorFromStartView
        
        // let color = backgroundColorFromStartView
        
        let ciColor = CIColor(color: backgroundColorFromStartView) //?? .red)
        
        redColorSlider.value = Float(ciColor.red)
        greenColorSlider.value = Float(ciColor.green)
        blueColorSlider.value = Float(ciColor.blue)
        
        setCurrentValue(slider: redColorSlider, label: redColorValue)
        setCurrentValue(slider: greenColorSlider, label: greenColorValue)
        setCurrentValue(slider: blueColorSlider, label: blueColorValue)
        
    }
    // MARK: - Action methods
    
    @IBAction func redSliderAction() {
        
        setCurrentColor()
        setCurrentValue(slider: redColorSlider, label: redColorValue)
    }
    
    @IBAction func greenSliderAction(){
        setCurrentColor()
        setCurrentValue(slider: greenColorSlider, label: greenColorValue)
    }
    
    @IBAction func blueSliderAction(){
        setCurrentColor()
        setCurrentValue(slider: blueColorSlider, label: blueColorValue)
        
    }
    
    @IBAction func doneButtonPressed() {
        delegate.sendColorToStartView(currentColor)
        dismiss(animated: true)
    }
    
    // MARK: - Private methods
    
    private func setCurrentColor() {
        currentColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: CGFloat(1)
        )
        rgbDisplay.backgroundColor = currentColor
    }
    private func getFormatValue(for slider: UISlider) -> String {
        slider.value < 0.01 ? "%.1f" : "%.2f"
    }
    private func setCurrentValue(slider: UISlider, label: UILabel) {
        label.text = String(format: getFormatValue(for: slider),
                            slider.value
        )
    }
}

