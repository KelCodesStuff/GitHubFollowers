//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by Kelvin Reid on 2/21/20.
//  Copyright © 2020 Kelvin Reid. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    
    //is set when data is passed from search vc
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    

   

}
