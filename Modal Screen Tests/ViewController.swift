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
        let datePickerController = DatePickerViewController()
        datePickerController.present(on: self, with: sender)
        
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            let datePickerController = DatePickerViewController()
//            datePickerController.modalPresentationStyle = .popover
//            datePickerController.preferredContentSize = datePickerController.datePicker?.frame.size ?? CGSize(width: 300, height: 200)
//
//            let popoverPresentation = datePickerController.popoverPresentationController
//            popoverPresentation?.sourceView = sender
//            popoverPresentation?.sourceRect = sender.bounds
//            self.present(datePickerController, animated: true, completion: nil)
//        } else {
//            let datePickerController = DatePickerViewController()
//            let presentationDelegate = DatePickerPresentetionDelegate()
//            presentationDelegate.datePicker = datePickerController.datePicker
//            datePickerController.transitioningDelegate = presentationDelegate
//            datePickerController.modalPresentationStyle = .custom
//            self.present(datePickerController, animated: true, completion: nil)
//        }
//
    //  let popoverController = TestPopoverViewController()
    //MARK: - Custom
//        let presentationDelegate = DatePickerPresentetionDelegate()
//        presentationDelegate.datePicker = popoverController.datePicker
//        popoverController.transitioningDelegate = presentationDelegate
//        popoverController.modalPresentationStyle = .custom
//
    //MARK: - POPOVER
//        popoverController.modalPresentationStyle = .popover
//        popoverController.preferredContentSize = CGSize(width: 300, height: 200)
//
//        let popoverPresentation = popoverController.popoverPresentationController
//        popoverPresentation?.sourceView = sender
//        popoverPresentation?.sourceRect = sender.bounds
        
     //   self.present(popoverController, animated: true, completion: nil)
    }
    
}

