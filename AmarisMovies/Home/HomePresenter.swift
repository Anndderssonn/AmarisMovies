//
//  HomePresenter.swift
//  AmarisMovies
//
//  Created by Andersson Urbina on 15/11/21.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        // Call to Interactor for get data
        interactor?.interactorGetData()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func interactorPushDataPopularPresenter(receivedDataPopularMovies: [String]) {
        view?.presenterPushDataView(receivedPopularMovieData: receivedDataPopularMovies)
    }
}
