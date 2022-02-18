//
//  MovieListContracts.swift
//  SearchMovie
//
//  Created by ArdaSisli on 11.02.2022.
//

import Foundation
import MovieAPI
import Alamofire

//MARK: - ViewModel
protocol MovieViewModelProtocol {
    var delegate: MovieListViewModelOutPut? { get set }
    func load(path: String)
}

enum MovieViewModelOutPut {
    case showMovieList([Search])
    case showError(String)
}

protocol MovieListViewModelOutPut {
    func handleOutPut(_ output: MovieViewModelOutPut)
}

//MARK: - Provider
protocol MovieListProviderProtocol {
    var delegate: MovieListProviderDelegate? { get set }
    func load(value: [Search])
}

enum MovieListProviderOutPut {
    case select(MovieDetailPresentation)
    case title(String)
}

protocol MovieListProviderDelegate {
    func selected(at select: MovieDetailPresentation)
}





