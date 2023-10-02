//
//  ViewController.swift
//  RGB
//
//  Created by deshollow on 29.09.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var rgbDisplay: UIView!
    
    @IBOutlet weak var redColorValue: UILabel!
    @IBOutlet weak var greenColorValue: UILabel!
    @IBOutlet weak var blueColorValue: UILabel!
    
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbDisplay.layer.cornerRadius = 15
        setCurrentColor()
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
    // MARK: - Private methods
    
    private func setCurrentColor(){
        rgbDisplay.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: CGFloat(1)
        )
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

