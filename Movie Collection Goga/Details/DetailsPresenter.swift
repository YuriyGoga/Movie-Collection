//
//  DetailsPresenter.swift
//  Movie Collection Goga
//
//  Created by FILIN INTEND on 03.07.2023.
//

import Foundation

//MARK: - Protocols
protocol DetailsViewInput: AnyObject {

    func popToRoot()
}

protocol DetailsViewOutput: AnyObject {

    func onClickQuit()
}


class DetailsPresenter: DetailsViewOutput {

//MARK: - Properties
    weak var view: DetailsViewInput?

//MARK: - Methods
    func onClickQuit() {
        UserDefaults.standard.set(false, forKey: "ISUSERLOGGEDIN")
        view?.popToRoot()
    }
}
