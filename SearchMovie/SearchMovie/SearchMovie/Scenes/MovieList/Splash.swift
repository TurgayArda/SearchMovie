//
//  LoadingVC.swift
//  SearchMovie
//
//  Created by ArdaSisli on 14.02.2022.
//

import UIKit
import SnapKit
import Alamofire

class Connect {
    class func isConnected() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

class SplashVC: UIViewController {

    private var nameLabel = UILabel()
    private var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let name = "Turgay Arda Sisli"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        indicator.startAnimating()
        UIView.animate(withDuration: 3.0) {
            self.indicator.startAnimating()
        } completion: { _ in
            if Connect.isConnected() {
            let viewController = MovieListBuilder.make()
            self.show(viewController, sender: nil)
            }else{
                let errorAlert = UIAlertController(title: SplashErrorAlert.alertTitle, message: SplashErrorAlert.alertMessage, preferredStyle: .alert)
                let errorAction = UIAlertAction(title: SplashErrorAlert.actionTitle, style: .cancel)
                errorAlert.addAction(errorAction)
                self.present(errorAlert, animated: true)
            }
        }
    }
    
    func configure() {
        view.addSubview(indicator)
        view.addSubview(nameLabel)
        view.backgroundColor = .white
        makeLabel()
        makeIndicator()
        nameLabel.text = name
        nameLabel.font = .boldSystemFont(ofSize: 20)
        indicator.color = .red
    }
}

extension SplashVC {
    func makeIndicator() {
        indicator.snp.makeConstraints { make in
            make
                .centerX
                .equalTo(view.snp.centerX)
            make
                .centerY
                .equalTo(view.snp.centerY)
        }
    }
    
    func makeLabel() {
        nameLabel.snp.makeConstraints { make in
            make
                .centerX
                .equalTo(view.snp.centerX)
            make
                .top
                .equalTo(indicator.snp.bottom)
                .offset(20)
        }
    }
}
