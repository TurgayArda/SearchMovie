//
//  MovieDetailVC.swift
//  SearchMovie
//
//  Created by ArdaSisli on 11.02.2022.
//

import UIKit
import SnapKit
import AlamofireImage

class MovieDetailVC: UIViewController {
    
    //MARK: - Property
    private var titleLabel = UILabel()
    private var movieImage = UIImageView()
    private var yearLabel = UILabel()
    
    var viewModel: MovieDetailViewModel?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.load()
        configure()
        edit()
    }
    
    private func configure() {
        view.addSubview(movieImage)
        view.addSubview(titleLabel)
        view.addSubview(yearLabel)
        makeImage()
        makeTitle()
        makeYear()
    }
    
    private func edit() {
        view.backgroundColor = .white
        //frame setting
        movieImage.layer.masksToBounds = true
        movieImage.layer.cornerRadius = 10.0
        //Font Setting
        titleLabel.font = .boldSystemFont(ofSize: 17)
        yearLabel.font = .boldSystemFont(ofSize: 16)
    }
}

extension MovieDetailVC: MovieDetailViewControllerProtocol {
    func handleOutPut(_ output: MovieListProviderOutPut) {
        switch output {
        case .select(let data):
            titleLabel.text = "Movie name: \(data.title)"
            yearLabel.text = "Vision date: \(data.year)"
            movieImage.af.setImage(withURL: URL(string: data.image)!)
        case .title(let title):
            self.title = title
        }
    }
}

//MARK: - Constraints
extension MovieDetailVC {
    func makeImage() {
        movieImage.snp.makeConstraints { make in
            make
                .top
                .equalTo(view.safeAreaLayoutGuide)
                .offset(40)
            make
                .centerX
                .equalTo(view.snp.centerX)
            make
                .width
                .equalTo(view.safeAreaLayoutGuide.snp.height)
                .multipliedBy(0.45)
                
            make
                .height
                .equalTo(view.safeAreaLayoutGuide.snp.height)
                .multipliedBy(0.54)
        }
    }
    
    func makeTitle() {
        titleLabel.snp.makeConstraints { make in
            make
                .top
                .equalTo(movieImage.snp.bottom)
                .offset(20)
            make
                .centerX
                .equalTo(view.snp.centerX)
        }
    }
    
    func makeYear() {
        yearLabel.snp.makeConstraints { make in
            make
                .top
                .equalTo(titleLabel.snp.bottom)
                .offset(20)
            make
                .centerX
                .equalTo(view.snp.centerX)
        }
    }
}
