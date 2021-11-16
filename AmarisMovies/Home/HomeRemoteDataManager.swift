//
//  HomeRemoteDataManager.swift
//  AmarisMovies
//
//  Created by Andersson Urbina on 15/11/21.
//  
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    var getPopularMovies = PopularMoviesURL()
    
    func externalGetData() {
        // This function call to service and get data
        
        //Call to service and get movies
        let session = URLSession.shared
        
        //Create request URL
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key={key}&language=en-US&page=1")!)
        
        // Call Api REST
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-form-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        
        // Send Request
        session.dataTask(with: request) {(data, response, error) in
            // Manage receive data and convert to response in HTTPURLResponse object for manage server code response
            guard let data = data, error == nil, let responseApi = response as? HTTPURLResponse else {
                print("Error in connection: \(error!)")
                return
            }
            
            // Validate server code
            if responseApi.statusCode == 200 {
                print("Response server data: \(data)")
                
                do {
                    let decoder = JSONDecoder()
                    self.getPopularMovies = try decoder.decode(PopularMoviesURL.self, from: data)
                    
                    // Send data to Interactor
                    self.remoteRequestHandler?.remoteDataManagerCallBackData(with: self.getPopularMovies)
                } catch {
                    print("Not was possible parser to file, error: \(error.localizedDescription)")
                }
            } else {
                print("There has been an error: \(responseApi.statusCode)")
            }
        }.resume()
    }
    
}
