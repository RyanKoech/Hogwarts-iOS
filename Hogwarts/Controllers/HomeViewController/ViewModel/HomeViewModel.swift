//
//  HomeViewModel.swift
//  Hogwarts
//
//  Created by Ryan on 31/10/2023.
//

import Combine
import Foundation

class HomeViewModel : ObservableObject {
    
    @Published var searchedCharacters : Characters = Characters()
    var characters : Characters = Characters()
    @Published var isLoading : Bool = false
    private var searchString : String = "" {
        didSet {
            if (searchString.isEmpty) {
                searchedCharacters = characters
                return
            }
            searchedCharacters = characters.filter{ $0.name.localizedCaseInsensitiveContains(searchString)}
        }
    }
    
    func setSearchString(with text: String) {
        searchString = text
    }
    
    func numberOfRows() -> Int {
        return searchedCharacters.count
    }
    
    func getFilterdCharacters() {
        
    }
    
    func getCharacters() {
        self.isLoading = true
        ApiCaller.getCharacters { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let characters):
                print("Characters count: \(characters.count)")
                self?.characters = characters
                self?.searchedCharacters = characters
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
