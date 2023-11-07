//
//  HomeViewController+UISearchBar.swift
//  Hogwarts
//
//  Created by Ryan on 07/11/2023.
//

import UIKit

extension HomeViewController : UISearchBarDelegate {
    
    func bindSearchBar() {
        self.characterSearchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search text \(searchText)")
        viewModel.setSearchString(with: searchText)
    }
}
