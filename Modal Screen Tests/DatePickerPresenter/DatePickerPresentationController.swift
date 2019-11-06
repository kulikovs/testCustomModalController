//
//  DatePickerPresentationController.swift
//  Modal Screen Tests
//
//  Created by Sergey Kulikov on 11/5/19.
//  Copyright © 2019 Sergey Kulikov. All rights reserved.
//

import UIKit
import SnapKit

class DatePickerPresentationController: UIPresentationController {
    private let datePicker: UIDatePicker
    private var dimmingView = UIView()
    
    //MARK: - Initialization and deallocations
    
    init(presentedViewController: UIViewController, presentingViewController: UIViewController?, datePicker: UIDatePicker) {
        self.datePicker = datePicker
        
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        self.setupDimmingView()
    }
    
    //MARK: - Overriden methods
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let container = self.containerView
        let parrentSize = container?.frame.size
        var rect: CGRect = .zero
        let deviceIdiom = UIDevice.current.userInterfaceIdiom
        if let parrentSize = parrentSize {
            switch deviceIdiom {
            case .phone:
                rect.size = CGSize(width: parrentSize.width, height: self.datePicker.frame.height)
                rect.origin.y = parrentSize.height - datePicker.frame.height
            default:
                rect.size = datePicker.frame.size
            }
        }
        
        return rect
    }
    
    override func presentationTransitionWillBegin() {
        self.containerView?.insertSubview(dimmingView, at: 0)
        self.dimmingView.snp.makeConstraints { constraint in
            constraint.edges.equalToSuperview()
        }
        
        let coordinator = self.presentedViewController.transitionCoordinator
        coordinator?.animate(alongsideTransition:{ _ in
            self.dimmingView.alpha = 1.0
        })
    }
    
    override func dismissalTransitionWillBegin() {
        let coordinator = self.presentedViewController.transitionCoordinator
        coordinator?.animate(alongsideTransition:{ _ in
            self.dimmingView.alpha = 0
        })
    }
    
    //MARK: - Private methods
    
    private func setupDimmingView() {
        let dimmingView = self.dimmingView
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        dimmingView.alpha = 0.0
        
        let recognizer = UITapGestureRecognizer(target: self,
                                                action: #selector(tapHide))
        dimmingView.addGestureRecognizer(recognizer)
    }
    
    @objc private func tapHide(recognizer: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true)
    }

}
