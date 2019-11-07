//
//  FormSheetPresentationDelegate.swift
//  Modal Screen Tests
//
//  Created by Sergey Kulikov on 11/5/19.
//  Copyright © 2019 Sergey Kulikov. All rights reserved.
//

import UIKit

class FormSheetPresentationDelegate: NSObject, UIViewControllerTransitioningDelegate, UIAdaptivePresentationControllerDelegate {
    
    let presentationView: UIView
    
    //MARK: - Initializations and deallocations
    
    init(presentationView: UIView) {
        self.presentationView = presentationView
        
        super.init()
    }
    
    //MARK: - UIViewControllerTransitioningDelegate
    
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController?
    {
        let controller = FormSheetPresentationController(presentedViewController: presented,
                                                           presentingViewController: presenting,
                                                           presentationView: presentationView)
        controller.delegate = self
        
        return controller
    }
    
}
