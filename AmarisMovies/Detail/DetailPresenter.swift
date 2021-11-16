//
//  DetailPresenter.swift
//  AmarisMovies
//
//  Created by Andersson Urbina on 16/11/21.
//  
//

import Foundation

class DetailPresenter: DetailPresenterProtocol  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
 
    // TODO: implement presenter methods
    var dataURLPopularMoviesDetailReceived: String?
    
    func viewDidLoad() {
        print("HI, I am detail view and I have data: \(String(describing: dataURLPopularMoviesDetailReceived))")
        if let dataPopularMovieReceived = dataURLPopularMoviesDetailReceived {
            view?.showDatailPopularMovieData(dataPopularMovie: dataPopularMovieReceived)
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
