//
//  temp.swift
//  Modal Screen Tests
//
//  Created by Sergey Kulikov on 11/6/19.
//  Copyright © 2019 Sergey Kulikov. All rights reserved.
//

import Foundation
//class CustomModalPresenterController: UIViewController {
//    
//    var containerView: UIView
//    
//    @IBOutlet var datePicker: UIDatePicker?
//    
//    //MARK: - Initializations and deallocations
//    
//    init(containerView: UIView) {
//        self.containerView = containerView
//        
//        super.init(nibName: nil, bundle: nil)
//        
//        //TODO: Need to decompose
//        self.view.addSubview(self.containerView)
//        self.containerView.snp.makeConstraints { constaint in
//            constaint.bottom.equalTo(self.view.safeAreaLayoutGuide)
//            constaint.height.equalTo(self.containerView.frame.size.height)
//            constaint.leading.equalTo(self.view)
//            constaint.trailing.equalTo(self.view)
//        }
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func present(on conroller: UIViewController, with sourceView: UIView?)  {
//        if UIDevice.current.userInterfaceIdiom == .pad, let sourceView = sourceView {
//            self.modalPresentationStyle = .popover
//        //    self.preferredContentSize = self.datePicker?.frame.size ?? CGSize(width: 300, height: 200)
//            self.preferredContentSize = self.view.frame.size
//            let popoverPresentation = self.popoverPresentationController
//            popoverPresentation?.sourceView = sourceView
//            popoverPresentation?.sourceRect = sourceView.bounds
//            conroller.present(self, animated: true, completion: nil)
//        } else {
//            let presentationDelegate = DatePickerPresentetionDelegate()
//            presentationDelegate.datePicker = self.datePicker
//            self.transitioningDelegate = presentationDelegate
//            self.modalPresentationStyle = .custom
//            conroller.present(self, animated: true, completion: nil)
//        }
//    }
//}
