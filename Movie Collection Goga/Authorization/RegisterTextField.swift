//
//  RegisterTextField.swift
//  Movie Collection Goga
//
//  Created by FILIN INTEND on 03.07.2023.
//

import UIKit

final class RegisterTextField: UITextField {
    
    
//  MARK: - Initializers
    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placehoder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - Private Methods
    private func setupTextField(placehoder: String) {
        textColor = ColorsSet.textFieldtext
        backgroundColor = ColorsSet.textFieldBackground
        clearButtonMode = .whileEditing
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        leftViewMode = .always
        layer.cornerRadius = 10
        layer.backgroundColor = ColorsSet.textFieldBackground.cgColor
        layer.shadowColor = ColorsSet.layerShadow.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 10, height: 10)
        attributedPlaceholder = NSAttributedString(string: placehoder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray])
        font = .boldSystemFont(ofSize: 17)
    }
}
