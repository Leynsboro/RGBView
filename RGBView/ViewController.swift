//
//  ViewController.swift
//  RGBView
//
//  Created by Илья Гусаров on 09.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redNumber: UILabel!
    @IBOutlet var greenNumber: UILabel!
    @IBOutlet var blueNumber: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var colorizedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setValue()
        setViewColor()
    }
    
    @IBAction func sliderChange() {
        setValue()
        setViewColor()
    }
}

extension ViewController {
    private func setViewColor() {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue() {
        redNumber.text = setFormatOf(value: redSlider.value)
        greenNumber.text = setFormatOf(value: greenSlider.value)
        blueNumber.text = setFormatOf(value: blueSlider.value)
    }
    
    private func setFormatOf(value: Float) -> String {
        String(format: "%.2f", value)
    }
}

