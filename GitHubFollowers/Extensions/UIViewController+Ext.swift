//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Kelvin Reid on 2/28/20.
//  Copyright © 2020 Kelvin Reid. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttontitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .flipHorizontal
            self.present(alertVC, animated: true)
        }
    }
 }
