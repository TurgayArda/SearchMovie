//
//  Error.swift
//  SearchMovie
//
//  Created by ArdaSisli on 15.02.2022.
//

import Foundation

enum MovieList: String {
    case alertTitle = "Error"
    case actionTitle = "OK"
    case placeHolder = "Search movie name"
}

enum Pathurl: String{
    case baseUrl = "http://www.omdbapi.com/?apikey=f0ac39d3&s="
    case networkUrl = "&type=movie"
}
