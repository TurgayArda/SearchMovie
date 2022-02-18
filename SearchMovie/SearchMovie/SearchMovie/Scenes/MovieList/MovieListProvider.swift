//
//  MovieListProvider.swift
//  SearchMovie
//
//  Created by ArdaSisli on 11.02.2022.
//

import Foundation
import UIKit
import MovieAPI
import QuartzCore

class MovieListProvider: NSObject {
    
    var delegate: MovieListProviderDelegate?
    var movie: [MovieListPresentations] = []
    var select: [Search] = []
}

extension MovieListProvider: MovieListProviderProtocol {    
    func load(value: [Search]) {
        self.select = value
        let data = value.map(MovieListPresentations.init)
        self.movie = data
    }
}

extension MovieListProvider: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTableCell.Identifier.path.rawValue) as? MovieListTableCell else {
            return UITableViewCell()
        }
        cell.saveModel(value: movie[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let data = select[indexPath.row]
        let dataTwo = MovieDetailPresentation.init(movie: data)
        delegate?.selected(at: dataTwo)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
                UIView.animate(
                    withDuration: 0.5,
                    delay: 0.05 * Double(indexPath.row),
                    options: [.curveLinear],
                    animations: {
                        cell.transform = CGAffineTransform(translationX: 0, y: 0)
                })
    }
}
