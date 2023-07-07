//
//  DetailsModule.swift
//  Movie Collection Goga
//
//  Created by FILIN INTEND on 03.07.2023.
//

import UIKit

final class DetailsModule {

    static func make() -> DetailsFilmViewController {
        let presenter = DetailsPresenter()
        let vc = DetailsFilmViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
