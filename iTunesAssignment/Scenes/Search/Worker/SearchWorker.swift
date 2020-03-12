//
//  SearchWorker.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import Foundation
import Alamofire

enum ErrorHandler: Error {
    case noAvailableData
}

final class SearchWorker: SearchWorkerProtocol {
    
    func search(parameters: SearchModel.Request, completionHandler: @escaping (SearchResult) -> Void) {
        
        Alamofire.request(SearchNetworkRouter.search(parameters: parameters)).responseData { response in
            switch response.result {
            case .success: 
                do {
                    if let data = response.data {
                        let result = try JSONDecoder().decode(SearchModel.Response.self, from: data)
                        if result.errorMessage != nil {
                            completionHandler(.failure(ErrorHandler.noAvailableData))
                        } else {
                            completionHandler(.success(result))
                        }
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
