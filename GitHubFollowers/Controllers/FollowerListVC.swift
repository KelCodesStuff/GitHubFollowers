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
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupViewController()
        getFollowers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimiumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimiumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
            case .success(let followers):
                print(followers)
                       
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
}
