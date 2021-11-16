//
//  HomeView.swift
//  AmarisMovies
//
//  Created by Andersson Urbina on 15/11/21.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {

    // MARK: Properties
    @IBOutlet weak var tableViewHome: UITableView!
    @IBOutlet weak var activityHome: UIActivityIndicatorView!
    var presenter: HomePresenterProtocol?
    var arrayViewPopularMoviesURL = [String]()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Communicate in my sight with the presenter
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
    func presenterPushDataView(receivedPopularMovieData: [String]) {
        arrayViewPopularMoviesURL = receivedPopularMovieData
        DispatchQueue.main.async {
            self.tableViewHome.reloadData()
        }
    }
}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayViewPopularMoviesURL.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = arrayViewPopularMoviesURL[indexPath.row]
        return cell
    }
    
    
}

extension HomeView: UITableViewDelegate {
    
}
