//
//  HomeViewModel.swift
//  Hogwarts
//
//  Created by Ryan on 31/10/2023.
//

import Foundation

class HomeViewModel {
    
    func numberOfRows() -> Int {
        return 10
    }
    
    func getCharacters() {
        ApiCaller.getCharacters { result in
            switch result {
            case .success(let characters):
                print("Characters count: \(characters.count)")
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
