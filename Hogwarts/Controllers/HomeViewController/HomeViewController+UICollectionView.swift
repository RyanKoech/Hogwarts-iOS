//
//  HomeViewController+UICollectionView.swift
//  Hogwarts
//
//  Created by Ryan on 31/10/2023.
//

import UIKit

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupColllectionView() {
        self.charactersCollectionView.dataSource = self
        self.charactersCollectionView.delegate = self
        self.charactersCollectionView.contentInset.top = 10
        self.charactersCollectionView.contentInset.left = 10
        self.charactersCollectionView.contentInset.right = 10
        self.charactersCollectionView.contentInset.bottom = 10
        self.registerCells()
    }
    
    func registerCells() {
        self.charactersCollectionView.register(CharacterCollectionViewCell.registerCell(), forCellWithReuseIdentifier: CharacterCollectionViewCell.indentifier)
    }
    
    func reloadCharactersCollectionView() {
        DispatchQueue.main.async {
            self.charactersCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.indentifier, for: indexPath) as? CharacterCollectionViewCell else {
            return UICollectionViewCell()
        }
        let character = viewModel.searchedCharacters[indexPath.row]
        cell.setUpCell(name: character.name, imageUrl: character.getURL())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout : UICollectionViewLayout, sizeForItemAt indexPath : IndexPath) -> CGSize {
        let size = (charactersCollectionView.frame.size.width - 30)/2
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigateToCharacterDetails(index: indexPath.row)
    }
}
