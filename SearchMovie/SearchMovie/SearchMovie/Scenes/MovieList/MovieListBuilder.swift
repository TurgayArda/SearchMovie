//
//  MovieListBuilder.swift
//  SearchMovie
//
//  Created by ArdaSisli on 11.02.2022.
//

import Foundation
import MovieAPI

class MovieListBuilder {
   static func make() -> MovieListVC {
        let view = MovieListVC()
       view.viewModel = MovieViewModel(service: SearchMovieProtocol())
       return view
    }
}
