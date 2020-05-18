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
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
