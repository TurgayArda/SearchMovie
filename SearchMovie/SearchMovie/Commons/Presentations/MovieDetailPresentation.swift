//
//  MovieDetailPresentation.swift
//  SearchMovie
//
//  Created by ArdaSisli on 12.02.2022.
//

import Foundation
import MovieAPI

extension MovieDetailPresentation {
    init(movie: Search) {
        self.init(title: movie.title,
                  image: movie.poster,
                  year: movie.year)
    }
}
