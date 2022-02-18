//
//  MovieListTableCell.swift
//  SearchMovie
//
//  Created by ArdaSisli on 11.02.2022.
//

import UIKit
import SnapKit
import AlamofireImage

class MovieListTableCell: UITableViewCell {

    private let movieImage = UIImageView()
    private let movieTitle = UILabel()
    
    enum Identifier: String {
        case path = "Cell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        detail()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
       
    }
    
    private func configure() {
        addSubview(movieImage)
        addSubview(movieTitle)
        makeImage()
        makeTitle()
    }
    
    private func detail() {
       movieImage.layer.masksToBounds = true
       movieImage.layer.cornerRadius = 10.0
        movieTitle.font = .boldSystemFont(ofSize: 18)
       movieTitle.textColor = .purple
    }
    
    func saveModel(value: MovieListPresentations) {
        movieTitle.text = "Movie name: \(value.title)"
        movieImage.af.setImage(withURL: URL(string: value.image)!)
    }
}

extension MovieListTableCell {
    private func makeImage() {
        movieImage.snp.makeConstraints { make in
            make
                .top
                .equalTo(contentView)
                .offset(0)
            make
                .left
                .equalTo(contentView)
                .offset(10)
            make
                .width
                .equalTo(contentView.safeAreaLayoutGuide.snp.width)
                .multipliedBy(0.42)
                
            make
                .height
                .equalTo(contentView.safeAreaLayoutGuide.snp.width)
                .multipliedBy(0.39)
        }
    }
    
    private func makeTitle() {
        movieTitle.snp.makeConstraints { make in
            make
                .top
                .equalTo(movieImage.snp.bottom)
                .offset(10)
            make
                .centerX
                .equalTo(contentView.snp.centerX)
        }
    }
}
