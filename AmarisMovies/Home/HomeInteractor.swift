//
//  HomeInteractor.swift
//  AmarisMovies
//
//  Created by Andersson Urbina on 15/11/21.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    var arrayPopularMoviesURL = [String]()
    
    func interactorGetData() {
        // call to RemoteDataManager for get data
        remoteDatamanager?.externalGetData()
    }
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func remoteDataManagerCallBackData(with popularMovies: PopularMoviesURL) {
        // Interactor must be send data to Presenter
        print("getting this all data: \(popularMovies)")
        
        for dataPopularMovie in popularMovies.results! {
            let originalTitle = dataPopularMovie.originalTitle
            self.arrayPopularMoviesURL.append(originalTitle!)
        }
        
        print("Send data to presenter: \(self.arrayPopularMoviesURL)")
        
        // Send data to Presenter
        presenter?.interactorPushDataPopularPresenter(receivedDataPopularMovies: self.arrayPopularMoviesURL)
    }
}
