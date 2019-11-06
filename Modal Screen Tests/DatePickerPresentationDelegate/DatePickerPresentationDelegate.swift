//
//  DatePickerPresentetionDelegate.swift
//  Modal Screen Tests
//
//  Created by Sergey Kulikov on 11/5/19.
//  Copyright © 2019 Sergey Kulikov. All rights reserved.
//

import UIKit

class DatePickerPresentationDelegate: NSObject, UIViewControllerTransitioningDelegate, UIAdaptivePresentationControllerDelegate {
    
    //Need to add init logical
    var datePicker: UIDatePicker? = nil
    
    //MARK: - UIViewControllerTransitioningDelegate
    
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController?
    {
        let controller = DatePickerPresentationController(presentedViewController: presented,
                                                          presentingViewController: presenting,
                                                          datePicker: datePicker ?? UIDatePicker()) //FIIIIIXXXXX)
        controller.delegate = self
        
        return controller
    }
    
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//
//    }
//    
//    MARK: - UIAdaptivePresentationControllerDelegate
//    

    
}
