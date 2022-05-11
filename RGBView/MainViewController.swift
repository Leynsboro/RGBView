//
//  MainViewController.swift
//  RGBView
//
//  Created by Илья Гусаров on 11.05.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setViewColor(_ color: UIColor)
}

class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {return}
        settingsVC.mainColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setViewColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
