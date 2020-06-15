//
//  FollowerListVC.swift
//  GitFollowers
//
//  Created by Adam Moskovich on 5/17/20.
//

import UIKit

class FollowerListVC: UIViewController {

    var userName: String!
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        getFollowers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }

    private func getFollowers() {
        NetworkManager.shared.getFollowers(for: userName, page: 1) { [weak self] result in

            switch result {
            case .success(let followers):
                print(followers)
            case .failure(let error):
                self?.presentGFAlertOnMainThread(title: "Bad Stuff Happened",
                                                 message: error.rawValue,
                                                 buttonTitle: "OK")
            }
        }
    }
}
