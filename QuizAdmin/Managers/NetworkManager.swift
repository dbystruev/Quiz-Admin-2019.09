//
//  NetworkManager.swift
//  QuizAdmin
//
//  Created by Denis Bystruev on 17/09/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import Foundation

class NetworkManager<T: Codable> {
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
    
    func patch(_ id: Int?, with codable: T, completion: @escaping (T?, Error?) -> Void) {
        guard let id = id else {
            completion(nil, nil)
            return
        }
        
        let requestURL = url.appendingPathComponent("\(id)")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let jsonData = try? encoder.encode(codable)
        request.httpBody = jsonData
        
//        if let decoded = try? JSONDecoder().decode(T.self, from: jsonData!) {
//            print(#line, #function, decoded)
//        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            guard let codable = try? decoder.decode(T.self, from: data) else {
                completion(nil, Errors.cantDecodeData(data))
                return
            }
            
            completion(codable, nil)
        }
        
        task.resume()
    }
}
