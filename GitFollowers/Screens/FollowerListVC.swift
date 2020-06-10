//
//  FollowerListVC.swift
//  GitFollowers
//
//  Created by Adam Moskovich on 5/17/20.
//

import UIKit

class FollowerListVC: UIViewController {

    var userName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true

        NetworkManager.shared.getFollowers(for: userName, page: 1) { [weak self] (followers, errorMessage) in
            guard let followers = followers else {
                self?.presentGFAlertOnMainThread(title: "Bad Stuff Happened",
                                                 message: errorMessage?.rawValue ?? "",
                                                 buttonTitle: "OK")
                return
            }

            print("Followers.count = \(followers.count)")
            print(followers)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
