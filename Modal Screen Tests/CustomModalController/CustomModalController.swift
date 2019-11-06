//
//  CustomModalController.swift
//  Modal Screen Tests
//
//  Created by Sergey Kulikov on 11/1/19.
//  Copyright © 2019 Sergey Kulikov. All rights reserved.
//

import UIKit

class CustomModalController: UIViewController {

    var containerView: UIView

    //MARK: - Initializations and deallocations

    init(containerView: UIView) {
        self.containerView = containerView
        
        super.init(nibName: nil, bundle: nil)
        
        //TODO: Need to decompose to rootView
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public methods
    
    func present(on conroller: UIViewController, with sourceView: UIView?)  {
        if UIDevice.current.userInterfaceIdiom == .pad, let sourceView = sourceView {
            self.modalPresentationStyle = .popover
            self.preferredContentSize = self.containerView.frame.size
            let popoverPresentation = self.popoverPresentationController
            popoverPresentation?.sourceView = sourceView
            popoverPresentation?.sourceRect = sourceView.bounds
            conroller.present(self, animated: true, completion: nil)
        } else {
            let presentationDelegate = CustomModalPresentationDelegate(presentationView: self.containerView)
            self.transitioningDelegate = presentationDelegate
            self.modalPresentationStyle = .custom
            conroller.present(self, animated: true, completion: nil)
        }
    }
    
    //MARK: - Public methods
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.containerView)
        self.containerView.snp.makeConstraints { constaint in
            constaint.bottom.equalTo(self.view.safeAreaLayoutGuide)
            constaint.height.equalTo(self.containerView.frame.size.height)
            constaint.leading.equalTo(self.view)
            constaint.trailing.equalTo(self.view)
        }
    }
    
}
