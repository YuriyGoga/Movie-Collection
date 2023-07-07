//
//  LogInPresenter.swift
//  Movie Collection Goga
//
//  Created by FILIN INTEND on 03.07.2023.
//

import Foundation

//MARK: - Protocols
protocol LogInViewInput: AnyObject {

    func popToRoot()
}

protocol LogInViewOutput: AnyObject {

    func onClickQuit()
}

class LogInPresenter: LogInViewOutput {

//MARK: - Properties
    weak var view: LogInViewInput?

//MARK: - Private Method
    func onClickQuit() {
        UserDefaults.standard.set(false, forKey: "ISUSERLOGGEDIN")
        view?.popToRoot()
    }
}
