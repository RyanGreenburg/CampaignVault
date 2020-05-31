//
//  NetworkRequestService.swift
//  campaignVault
//
//  Created by RYAN GREENBURG on 5/27/20.
//  Copyright © 2020 RYAN GREENBURG. All rights reserved.
//

import Foundation


enum NetworkError: Error {
    case badURL
    case unexpectedError(Error)
    case couldNotUnwrapData
}

protocol NetworkServicing {
    func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void)
}

extension NetworkServicing {
    func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void)  {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error in \(#function) -\n\(#file):\(#line) -\n\(error.localizedDescription) \n---\n \(error)")
                completion(.failure(.unexpectedError(error)))
            }
            
            guard let data = data else {
                    completion(.failure(.couldNotUnwrapData))
                    return
            }
            completion(.success(data))
        }.resume()
    }
}
