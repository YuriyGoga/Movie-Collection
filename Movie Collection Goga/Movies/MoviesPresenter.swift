//
//  MoviesPresenter.swift
//  Movie Collection Goga
//
//  Created by FILIN INTEND on 03.07.2023.
//

import UIKit
import Foundation

//MARK: - Protocols
protocol MoviesViewInput: AnyObject {
    func presentMovies(movies: [Movie])
}

protocol MoviesViewOutput: AnyObject {

    func viewDidLoad()
}

final class MoviesPresenter: MoviesViewOutput {
    
//MARK: - Properties
    weak var view: MoviesViewInput?
    private lazy var networkService = NetworkService()
  
    
//MARK: - Private Methods
    func viewDidLoad() {
        networkService.loadMovies { [weak self] movies in
            self?.view?.presentMovies(movies: movies)
        }
    }
}
