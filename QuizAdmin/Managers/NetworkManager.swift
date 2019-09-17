//
//  NetworkManager.swift
//  QuizAdmin
//
//  Created by Denis Bystruev on 17/09/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import Foundation

class NetworkManager<T: Codable> {
    enum Errors: Swift.Error {
        case cantDecodeData(Data)
        
        var description: String {
            switch self {
            case .cantDecodeData(let data):
                return "Can't decode data \(data)"
            }
        }
    }
    
    private let url: URL
    
    init?(_ path: String) {
        guard let url = URL(string: path) else { return nil }
        self.url = url
    }
    
    func getAll(completion: @escaping (Codable?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            guard let codable = try? decoder.decode([T].self, from: data) else {
                completion(nil, Errors.cantDecodeData(data))
                return
            }
            
            completion(codable, nil)
        }
        
        task.resume()
    }
}
