//
//  MovieDetailBuilder.swift
//  SearchMovie
//
//  Created by ArdaSisli on 11.02.2022.
//

import Foundation

final class MovieDetailBuilder {
    static func make(movie: MovieDetailPresentation) -> MovieDetailVC {
        let view = MovieDetailVC()
        view.viewModel = MovieDetailViewModel(view: view, movie: movie)
        return view
    }
}
