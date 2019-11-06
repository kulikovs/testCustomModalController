//
//  TestPopoverViewController.swift
//  Modal Screen Tests
//
//  Created by Sergey Kulikov on 11/1/19.
//  Copyright © 2019 Sergey Kulikov. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
//    var containerView: UIView
    
    @IBOutlet var datePicker: UIDatePicker?
    
    //MARK: - Initializations and deallocations
    
    func present(on conroller: UIViewController, with sourceView: UIView?)  {
        if UIDevice.current.userInterfaceIdiom == .pad, let sourceView = sourceView {
            self.modalPresentationStyle = .popover
            self.preferredContentSize = self.datePicker?.frame.size ?? CGSize(width: 300, height: 200)
            let popoverPresentation = self.popoverPresentationController
            popoverPresentation?.sourceView = sourceView
            popoverPresentation?.sourceRect = sourceView.bounds
            conroller.present(self, animated: true, completion: nil)
        } else {
            let presentationDelegate = DatePickerPresentationDelegate()
            presentationDelegate.datePicker = self.datePicker
            self.transitioningDelegate = presentationDelegate
            self.modalPresentationStyle = .custom
            conroller.present(self, animated: true, completion: nil)
        }
    }
}
