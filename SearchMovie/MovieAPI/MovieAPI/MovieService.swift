//
//  MovieService.swift
//  MovieAPI
//
//  Created by ArdaSisli on 10.02.2022.
//

import Foundation
import Alamofire

public protocol ISearchMovieProtocol {
    func fetchAllData(path: String, success: @escaping ([Search]) -> Void, fail: @escaping (String) -> Void)
}

public class SearchMovieProtocol: ISearchMovieProtocol {
    public init() {}
    public func fetchAllData(path: String, success: @escaping ([Search]) -> Void, fail: @escaping (String) -> Void) {
        AF.request(path, method: .get).responseDecodable(of: Movie.self) { (model) in
            guard let data = model.value else {
                return fail("Search result failed")
            }
         let value = data.search
         success(value)
        }
    }
}
   
