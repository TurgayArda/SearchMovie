//
//  MovieDetailContracts.swift
//  SearchMovie
//
//  Created by ArdaSisli on 11.02.2022.
//

import Foundation

//MARK: - ViewModel
protocol MovieDetailProtocol {
    var view: MovieDetailViewControllerProtocol? { get set }
    func load()
}

//MARK: ViewController
protocol MovieDetailViewControllerProtocol {
    func handleOutPut(_ output: MovieListProviderOutPut)
}
