//
//  SearchWorker.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import Foundation
import Alamofire

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
        Alamofire.request(SearchNetworkRouter.search(parameters: parameters)).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(SearchModel.Response.self, from: data)
                    if result.errorMessage != nil {
                        completionHandler(.failure(NetworkError.noDataAvailable))
                    } else {
                        completionHandler(.success(result))
                    }
                } catch {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
