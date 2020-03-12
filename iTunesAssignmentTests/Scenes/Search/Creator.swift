//
//  Creator.swift
//  iTunesAssignmentTests
//
//  Created by Mohamed anwar on 3/12/20.
//  Copyright © 2020 S4M. All rights reserved.
//

import Foundation
@testable import iTunesAssignment

extension SearchModel {
    
    static func response(numberOfElements: Int = 2) -> SearchModel.Response {
        var results = [SearchModel.Response.Result]()
        for index in 0..<numberOfElements {
            let result = self.result(at: index)
            results.append(result)
        }
        return SearchModel.Response(resultCount: 50, results: results, errorMessage: nil)
    }
    
    static func result(at index: Int) -> SearchModel.Response.Result {
        return SearchModel.Response.Result(
            artistName: "artistName\(index)",
            collectionName: "collectionName\(index)",
            artworkUrl100: "artworkUrl100\(index)",
            copyright: "copyright\(index)",
            primaryGenreName: "primaryGenreName\(index)",
            trackName: "trackName\(index)",
            previewUrl: "previewUrl\(index)",
            shortDescription: "shortDescription\(index)"
        )
    }
}
