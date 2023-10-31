//
//  HomeViewController.swift
//  Hogwarts
//
//  Created by Ryan on 31/10/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var charactersCollectionView: UICollectionView!
    
    let viewModel : HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getCharacters()
    }
    
    func configView() {
        // Do any additional setup after loading the view.
        self.title = "Hogwarts"
        setupColllectionView()
    }


}
