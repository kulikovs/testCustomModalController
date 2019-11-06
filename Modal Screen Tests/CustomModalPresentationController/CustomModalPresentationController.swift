//
//  CustomModalPresentationController.swift
//  Modal Screen Tests
//
//  Created by Sergey Kulikov on 11/5/19.
//  Copyright © 2019 Sergey Kulikov. All rights reserved.
//

import UIKit
import SnapKit

class CustomModalPresentationController: UIPresentationController {
    private let presentationView: UIView
    private var dimmingView = UIView()
    
    //MARK: - Initialization and deallocations
    
    init(presentedViewController: UIViewController, presentingViewController: UIViewController?, presentationView: UIView) {
        self.presentationView = presentationView
        
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        self.setupDimmingView()
    }
    
    //MARK: - Overriden methods
    
    override var frameOfPresentedViewInContainerView: CGRect {
        var rect: CGRect = .zero
        self.containerView.map {
            let parrentSize = $0.frame.size
            let deviceIdiom = UIDevice.current.userInterfaceIdiom
            
            switch deviceIdiom {
            case .phone:
                rect.size = CGSize(width: parrentSize.width, height: self.presentationView.frame.height)
                rect.origin.y = parrentSize.height - presentationView.frame.height
            default:
                rect.size = presentationView.frame.size
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
