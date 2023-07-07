//
//  MoviesModule.swift
//  Movie Collection Goga
//
//  Created by FILIN INTEND on 03.07.2023.
//

import UIKit

final class MoviesModule {

    static func make() -> MoviesViewController {
        let presenter = MoviesPresenter()
        let vc = MoviesViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
