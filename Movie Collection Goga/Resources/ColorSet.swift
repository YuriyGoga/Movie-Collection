//
//  ColorSet.swift
//  Movie Collection Goga
//
//  Created by FILIN INTEND on 03.07.2023.
//

import UIKit

enum ColorsSet {
    static var viewBackground: UIColor {
        UIColor(named: "viewBackground") ?? .blue
    }
    static var textFieldBackground: UIColor {
        UIColor(named: "textFieldBackground") ?? .gray
    }
    static var textFieldtext: UIColor {
        UIColor(named: "textFieldtext") ?? .white
    }
    static var layerShadow: UIColor {
        UIColor(named: "layerShadow") ?? .blue
    }
}
