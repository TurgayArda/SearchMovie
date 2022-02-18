//
//  SearchMovieModel.swift
//  MovieAPI
//
//  Created by ArdaSisli on 10.02.2022.
//

import Foundation

// MARK: - Movie
public struct Movie: Codable {
    public let search: [Search]
    public let totalResults: String

    public enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
    }
}

// MARK: - Search
public struct Search: Codable {
    public let title: String
    public let year: String
    public let imdbID: String
    public let poster: String

    public enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case poster = "Poster"
    }
}
