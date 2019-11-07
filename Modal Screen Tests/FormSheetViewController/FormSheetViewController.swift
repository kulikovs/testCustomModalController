//
//  FormSheetViewController.swift
//  Modal Screen Tests
//
//  Created by Sergey Kulikov on 11/1/19.
//  Copyright © 2019 Sergey Kulikov. All rights reserved.
//

import UIKit

class FormSheetViewController<View: UIView>: UIViewController {
    
    private var containerView: View
    
    //MARK: - Initializations and deallocations
    
    init(containerView: View ) {
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
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.modalPresentationStyle = .popover
            self.preferredContentSize = self.containerView.frame.size
            let popoverPresentation = self.popoverPresentationController
            popoverPresentation?.sourceView = sourceView
            popoverPresentation?.sourceRect = sourceView?.bounds ?? .zero
            conroller.present(self, animated: true, completion: nil)
        } else {
            let presentationDelegate = FormSheetPresentationDelegate(presentationView: self.containerView)
            self.transitioningDelegate = presentationDelegate
            self.modalPresentationStyle = .custom
            conroller.present(self, animated: true, completion: nil)
        }
    }
    
    //MARK: - Public methods
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(self.containerView)
        self.containerView.snp.makeConstraints { constaint in
            constaint.bottom.equalTo(self.view.safeAreaLayoutGuide)
            constaint.height.equalTo(self.containerView.frame.size.height)
            constaint.leading.equalTo(self.view)
            constaint.trailing.equalTo(self.view)
        }
    }
    
}
