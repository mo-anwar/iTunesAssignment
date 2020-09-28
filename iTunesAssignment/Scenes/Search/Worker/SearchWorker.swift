//
//  SearchWorker.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import Foundation
enum NetworkError: Error, LocalizedError {
    case noDataAvailable
    var errorDescription: String? {
        switch self {
        case .noDataAvailable:
            return "No Data Available"
        }
    }
}

final class SearchWorker: SearchWorkerProtocol {
    
    func search(parameters: SearchModel.Request, completionHandler: @escaping (SearchResult) -> Void) {
        NetworkLayer.request(SearchNetworkRouter.search(parameters: parameters), decodedTo: SearchModel.Response.self) { result in
            switch result {
            case .success(let model):
                if model.errorMessage != nil {
                    completionHandler(.failure(NetworkError.noDataAvailable))
                } else {
                    completionHandler(.success(model))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
