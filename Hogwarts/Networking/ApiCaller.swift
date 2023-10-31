//
//  ApiCaller.swift
//  Hogwarts
//
//  Created by Ryan on 31/10/2023.
//

import Foundation

enum NetworkError : Error {
    case UrlError
    case CanNotParseData
}

public class ApiCaller {
    
    private init() {}
    
    private static let CHARACTERS_END_POINT = "characters"
    
    static func getCharacters(
        completionHanlder : @escaping (_ result : Result<Characters, NetworkError>) -> Void
    ) {
       
        let urlString = NetworkConstants.BASE_URL + ApiCaller.CHARACTERS_END_POINT
        
        guard let url = URL(string: urlString) else {
            completionHanlder(.failure(.UrlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, URLResponse, error in
            if error == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(Characters.self, from: data) {
                completionHanlder(.success(resultData))
            } else {
                completionHanlder(.failure(.CanNotParseData))
            }
        }.resume()
    }
    
}
