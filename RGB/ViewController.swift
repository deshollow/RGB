//
//  ViewController.swift
//  RGB
//
//  Created by deshollow on 29.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
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
        
    }
    // MARK: - Action methods
    
    @IBAction func redSliderAction() {
        if redColorSlider.value < 0.01 {
            redColorValue.text = String(format: "%.1f", redColorSlider.value)
        } else {
            redColorValue.text = String(format: "%.2f", redColorSlider.value)
        }
        
        setCurrentColor()
    }
    
    @IBAction func greenSliderAction(){
        
        if greenColorSlider.value < 0.01 {
            greenColorValue.text = String(format: "%.1f", greenColorSlider.value)
        } else {
            greenColorValue.text = String(format: "%.2f", greenColorSlider.value)
        }
        
        setCurrentColor()
    }
    @IBAction func blueSliderAction(){
        
        if blueColorSlider.value < 0.01  {
            blueColorValue.text = String(format: "%.1f", blueColorSlider.value)
        } else {
            blueColorValue.text = String(format: "%.2f", blueColorSlider.value)
        }
        
        setCurrentColor()
    }
    // MARK: - Private method
    
    private func setCurrentColor(){
        rgbDisplay.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: CGFloat(1)
        )
    }
}

