//
//  MovieListPresentation+API.swift
//  SearchMovie
//
//  Created by ArdaSisli on 11.02.2022.
//

import Foundation
import MovieAPI

extension MovieListPresentations {
    init(movie: Search) {
        self.init(title: movie.title,
                  image:  movie.poster)
    }
}
