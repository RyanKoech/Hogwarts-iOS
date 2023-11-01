//
//  HomeViewModel.swift
//  Hogwarts
//
//  Created by Ryan on 31/10/2023.
//

import Combine
import Foundation

class HomeViewModel : ObservableObject {
    
    @Published var characters : Characters = Characters()
    @Published var isLoading : Bool = false
    
    func numberOfRows() -> Int {
        return characters.count
    }
    
    func getCharacters() {
        self.isLoading = true
        ApiCaller.getCharacters { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let characters):
                print("Characters count: \(characters.count)")
                self?.characters = characters
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
