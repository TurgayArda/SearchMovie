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
    
    enum Network: String{
        case url = "http://www.omdbapi.com/?apikey=f0ac39d3&s="
        case network = "&type=movie"
    }
}

extension MovieViewModel: MovieViewModelProtocol {
    func load(path: String) {
        service?.fetchAllData(path: Network.url.rawValue+path+Network.network.rawValue,
                              success: { [delegate] data in
            delegate?.handleOutPut(.showMovieList(data))
        }, fail: { [delegate] error in
            delegate?.handleOutPut(.showError(error))
        })
    }
}
