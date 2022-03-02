//
//  MovieListVC.swift
//  SearchMovie
//
//  Created by ArdaSisli on 11.02.2022.
//

import UIKit
import SnapKit


class MovieListVC: UIViewController {
   
    //MARK: - Property
    private var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private var searchBar = UISearchController()
    private var  tableView = UITableView()
    private var isSearch = false
    private var errorMessage:String!
    
    var provider = MovieListProvider()
    var viewModel: MovieViewModelProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.startAnimating()
        configure()
        initDelegate()
    }
    
    private func initDelegate() {
        tableView.register(MovieListTableCell.self, forCellReuseIdentifier: MovieListTableCell.Identifier.path.rawValue)
        tableView.delegate = provider
        tableView.dataSource = provider
        provider.delegate = self
        viewModel?.delegate = self
        searchBar.searchBar.delegate = self
    }
    
    private func configure() {
        navigationItem.searchController = searchBar
        view.addSubview(indicator)
        view.addSubview(tableView)
        navigationItem.hidesBackButton = true
        makeIndicator()
        edit()
      
    }
    
    private func edit() {
        view.backgroundColor = .white
        indicator.color = .red
        tableView.rowHeight = 200
        searchBar.searchBar.showsCancelButton = true
        searchBar.searchBar.placeholder = MovieList.placeHolder.rawValue
    }
}

//MARK: FetchData
extension MovieListVC: MovieListViewModelOutPut {
    func handleOutPut(_ output: MovieViewModelOutPut) {
        switch output {
        case .showMovieList(let array):
            provider.movie.removeAll()
                provider.load(value: array)
           
        case .showError(let error):
            provider.load(value: [])
                print(error)
                errorMessage = error
            if isSearch {
                let errorAlert = UIAlertController(title: MovieList.alertTitle.rawValue, message: self.errorMessage, preferredStyle: .alert)
                let errorAction = UIAlertAction(title: MovieList.actionTitle.rawValue, style: .cancel)
                errorAlert.addAction(errorAction)
                self.present(errorAlert, animated: true)
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.makeTable()
        }
    }
}

extension MovieListVC: MovieListProviderDelegate {
    func selected(at select: MovieDetailPresentation) {
        let viewController = MovieDetailBuilder.make(movie: select)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MovieListVC: UISearchBarDelegate {
     func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
            viewModel?.load(path: text)
            isSearch = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        provider.movie.removeAll()
        searchBar.text?.removeAll()
        viewModel?.load(path: searchBar.text ?? "")
        isSearch = false
        print(isSearch)
    
    DispatchQueue.main.async {
        self.tableView.reloadData()
        }
    }
}

//MARK: - Constraints
extension MovieListVC {
    private func makeIndicator() {
            indicator.snp.makeConstraints { make in
            make
                .centerX
                .equalTo(view.snp.centerX)
            make
                .centerY
                .equalTo(view.snp.centerY)
            }
    }
    private func makeTable() {
        tableView.snp.makeConstraints { make in
            make
                .top
                .equalTo(view.safeAreaLayoutGuide)
                .offset(5)
            make
                .left
                .right
                .equalTo(view)
                .offset(0)
            make
                .bottom
                .equalTo(view.safeAreaLayoutGuide)
                .offset(0)
        }
    }
}
