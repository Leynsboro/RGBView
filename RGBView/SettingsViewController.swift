//
//  ViewController.swift
//  RGBView
//
//  Created by Илья Гусаров on 09.04.2022.
//

//Не нашел как сделать норм кнопку Done

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var redNumber: UILabel!
    @IBOutlet var greenNumber: UILabel!
    @IBOutlet var blueNumber: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    @IBOutlet var colorizedView: UIView!
    
    var mainColor: UIColor!
    
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        
        setSliderValues()
        updateValues()

        colorizedView.backgroundColor = mainColor
    }
    
    @IBAction func sliderChange() {
        updateValues()
        setViewColor()
    }
    
    @IBAction func resultButtonPressed() {
        view.endEditing(true)
        delegate.setViewColor(colorizedView.backgroundColor!) //так можно?
        dismiss(animated: true)
    }
}

extension SettingsViewController {
    private func setViewColor() {
        colorizedView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setSliderValues() {
        redSlider.value = Float(mainColor.rgba.red)
        greenSlider.value = Float(mainColor.rgba.green)
        blueSlider.value = Float(mainColor.rgba.blue)
    }
    
    private func updateValues() {
        redNumber.text = setFormatOf(value: redSlider.value)
        greenNumber.text = setFormatOf(value: greenSlider.value)
        blueNumber.text = setFormatOf(value: blueSlider.value)
        
        redTF.text = setFormatOf(value: redSlider.value)
        greenTF.text = setFormatOf(value: greenSlider.value)
        blueTF.text = setFormatOf(value: blueSlider.value)
    }
    
    private func setFormatOf(value: Float) -> String {
        String(format: "%.2f", value)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {return}
        guard let value = Float(text) else {return}
        
        if value > Float(1) || text.isEmpty { //на пустоту почему-то не работает. много что пробовал
            textField.text = "1.0"
            showAlert(message: "nelzya")
        }
        
        switch textField {
            case redTF:
                redSlider.setValue(value, animated: true)
                redNumber.text = redTF.text
            case greenTF:
                greenSlider.setValue(value, animated: true)
                greenNumber.text = greenTF.text
            case blueTF:
                blueSlider.setValue(value, animated: true)
                blueNumber.text = blueTF.text
            default:
            break
        }
        setViewColor()
    }
}

extension SettingsViewController {
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}

