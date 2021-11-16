//
//  HomeWireFrame.swift
//  AmarisMovies
//
//  Created by Andersson Urbina on 15/11/21.
//  
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    class func createHomeModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navigation")
        if let view = navController.children.first as? HomeView {
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
            let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
            let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
            let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeView", bundle: Bundle.main)
    }
    
    func presentNewViewDetailPopularMovies(from view: HomeViewProtocol, withDataPopularMovie: String) {
        // Create new module and instance
        let newDetailView = DetailWireFrame.createDetailModule(with: withDataPopularMovie)
        if let newViewPopularMovieDetail = view as? UIViewController {
            newViewPopularMovieDetail.navigationController?.pushViewController(newDetailView, animated: true)
        }
    }
}
