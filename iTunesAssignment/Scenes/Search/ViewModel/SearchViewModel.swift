//
//  SearchViewModel.swift
//  iTunesAssignment
//
//  Created Mohamed anwar on 3/10/20.
//  Copyright © 2020 S4M. All rights reserved.
//
import Foundation

struct SearchModel {
    struct Request: Encodable {
        let entity: String
        let term: String
    }
    
    struct Response: Decodable {
        let resultCount: Double?
        let results: [Result]?
        let errorMessage: String?
        var entity: String?
        struct Result: Decodable {
            let artistName: String?
            let collectionName: String?
            let artworkUrl100: String?
            let copyright: String?
            let primaryGenreName: String?
            let trackName: String?
            let previewUrl: String?
            let shortDescription: String?
        }

    }
    
    struct ViewModel {
        
        let header: String
        let resulsts: [Result]

        struct Result {
            let artistName: String
            let collectionName: String?
            let artworkUrl100: String
            let copyright: String
            let primaryGenreName: String
            let trackName: String?
            let previewUrl: String?
            let shortDescription: String
            
            init(model: Response.Result) {
                artistName = model.artistName ?? ""
                collectionName = model.collectionName
                artworkUrl100 = model.artworkUrl100 ?? ""
                copyright = model.copyright ?? ""
                primaryGenreName = model.primaryGenreName ?? ""
                trackName = model.trackName
                previewUrl = model.previewUrl
                shortDescription = model.shortDescription ?? ""
            }
        }
    }
}
