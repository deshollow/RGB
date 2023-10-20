//
//  StartViewController.swift
//  RGB
//
//  Created by deshollow on 18.10.2023.
//

import UIKit


class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let startVC = segue.destination as? SettingViewController else {return}
        startVC.delegate = self
        startVC.backgroundColorFromStartView = view.backgroundColor
    }
    
}

extension StartViewController: SettingViewControllerDelegate {
    func sendColorToStartView(_ color: UIColor) {
        view.backgroundColor = color
    }
}

