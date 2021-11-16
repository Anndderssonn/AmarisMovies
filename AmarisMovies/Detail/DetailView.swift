//
//  DetailView.swift
//  AmarisMovies
//
//  Created by Andersson Urbina on 16/11/21.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController {

    // MARK: Properties
    @IBOutlet weak var labelDetail: UILabel!
    var presenter: DetailPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension DetailView: DetailViewProtocol {
    // TODO: implement view output methods
    func showDatailPopularMovieData(dataPopularMovie: String) {
        labelDetail.text = dataPopularMovie
    }
}
