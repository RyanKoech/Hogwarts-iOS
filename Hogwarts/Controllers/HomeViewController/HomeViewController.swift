//
//  HomeViewController.swift
//  Hogwarts
//
//  Created by Ryan on 31/10/2023.
//
import Combine
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var characterSearchBar: UISearchBar!
    @IBOutlet weak var charactersCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    private var subscriptions : Set<AnyCancellable> = []
    
    let viewModel : HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
        viewModel.getCharacters()
    }
    
    func configView() {
        // Do any additional setup after loading the view.
        self.title = "Hogwarts"
        setupColllectionView()
        bindSearchBar()
    }
    
    func bindViewModel() {
        viewModel.$isLoading.sink { [weak self] isLoading in
            guard let self  = self else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicatorView.startAnimating()
                } else {
                    self.activityIndicatorView.stopAnimating()
                }
            }
        }.store(in: &subscriptions)
        
        viewModel.$searchedCharacters.sink { [weak self] characters in
            guard let self  = self else {
                return
            }
            self.reloadCharactersCollectionView()
        }.store(in: &subscriptions)
    }

    func navigateToCharacterDetails(index : Int) {
        self.navigationController?.pushViewController(
            CharacterDetailsViewController(
                character : self.viewModel.searchedCharacters[index]
            ),
            animated: true
        )
    }

}
