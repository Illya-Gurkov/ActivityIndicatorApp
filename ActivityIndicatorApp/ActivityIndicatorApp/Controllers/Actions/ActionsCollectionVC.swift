//
//  ActionsCollectionVC.swift
//  ActivityIndicatorApp
//
//  Created by Illya Gurkov on 30.08.22.
//

import UIKit

enum Actons: String, CaseIterable /* позволяет из перечисления сделать массив */ {
    case downloadImage = "Download Image"
    case users = "Users"
}

class ActionsCollectionVC: UICollectionViewController {
    private let reuseIdentifier = "ActionCollectionViewCell"
    /// массив наших Actions
    private let actions = Actons.allCases

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let usersTVC = segue.destination as? UsersTVC else { return }
        usersTVC.fetchUsers()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        actions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ActionCollectionViewCell
        cell.labelAction.text = actions[indexPath.row].rawValue
        // Configure the cell

        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = actions[indexPath.row]
        switch action {
            case .downloadImage: performSegue(withIdentifier: "showImageSegue",
                                              sender: nil)
            case .users: performSegue(withIdentifier: "showUsersSegue",
                                      sender: nil)
        }
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension ActionsCollectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 20
        return CGSize(width: width, height: width / 2)
    }
}
