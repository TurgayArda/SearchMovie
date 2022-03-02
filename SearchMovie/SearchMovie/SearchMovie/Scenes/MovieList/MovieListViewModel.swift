//
//  MovieListViewModel.swift
//  SearchMovie
//
//  Created by ArdaSisli on 11.02.2022.
//

import Foundation
import MovieAPI

final class MovieViewModel {
    var delegate: MovieListViewModelOutPut?
    var service: ISearchMovieProtocol?
    init(service: ISearchMovieProtocol) {
        self.service = service
    }
}

extension MovieViewModel: MovieViewModelProtocol {
    func load(path: String) {
        service?.fetchAllData(path: Pathurl.baseUrl.rawValue+path+Pathurl.networkUrl.rawValue,
                              success: { [delegate] data in
            delegate?.handleOutPut(.showMovieList(data))
        }, fail: { [delegate] error in
            delegate?.handleOutPut(.showError(error))
        })
    }
}
