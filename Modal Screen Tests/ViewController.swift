//
//  ViewController.swift
//  Modal Screen Tests
//
//  Created by Sergey Kulikov on 11/1/19.
//  Copyright © 2019 Sergey Kulikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showModal(_ sender: Any) {
        let modalController = TestModalViewController()
        modalController.modalPresentationStyle = .formSheet
        modalController.preferredContentSize = CGSize(width: 300, height: 300)
        self.present(modalController, animated: true, completion: nil)
    }
    
    @IBAction func showPopover(_ sender: UIButton) {
        let datePicker = UIDatePicker()
        datePicker.backgroundColor = .white
        let modalController = CustomModalController(containerView: datePicker)
        modalController.present(on: self, with: sender)
    }
    
}

