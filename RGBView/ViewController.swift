//
//  ViewController.swift
//  RGBView
//
//  Created by Илья Гусаров on 09.04.2022.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var hudFilmSpizdili: UILabel!
    
    @IBOutlet var redNumber: UILabel!
    @IBOutlet var greenNumber: UILabel!
    @IBOutlet var blueNumber: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    @IBOutlet var colorizedView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redNumber.text = String(redSlider.value)
        greenNumber.text = String(greenSlider.value)
        blueNumber.text = String(blueSlider.value)
        
        settingViewColor(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
        
        hudFilmSpizdili.text = "storyboard смело украл, но в свое оправдание скажу, что  сделал абсолютно так же, без указания ширины внутренних стэков, из-за чего у меня не получалось"
    }

    @IBAction func redSliderAction() {
        redNumber.text = String(format:"%.2f", redSlider.value)
        settingViewColor(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
    
    @IBAction func greenSliderAction() {
        greenNumber.text = String(format:"%.2f", greenSlider.value)
        settingViewColor(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
    
    
    @IBAction func blueSliderAction() {
        blueNumber.text = String(format:"%.2f", blueSlider.value)
        settingViewColor(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
}

extension ViewController {
    private func settingViewColor(red: Float, green: Float, blue: Float) {
        colorizedView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
        
    }
}

