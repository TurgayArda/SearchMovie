//
//  MovieDetailViewModel.swift
//  SearchMovie
//
//  Created by ArdaSisli on 11.02.2022.
//

import Foundation

final class MovieDetailViewModel: MovieDetailProtocol {
    var view: MovieDetailViewControllerProtocol?
    var movie: MovieDetailPresentation?
    init(view: MovieDetailViewControllerProtocol, movie: MovieDetailPresentation) {
        self.movie = movie
        self.view = view
    }
    
    func load() {
        guard let movieDetail = movie else { return }
        view?.handleOutPut(.select(movieDetail))
        view?.handleOutPut(.title(movieDetail.title))
    }
}
