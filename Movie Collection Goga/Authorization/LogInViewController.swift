//
//  ViewController.swift
//  Movie Collection Goga
//
//  Created by FILIN INTEND on 03.07.2023.
//

import SnapKit
import UIKit

final class LogInViewController: UIViewController, LogInViewInput {
  
//MARK: - Properties & Init
    let presenter: LogInViewOutput
    private let admin = UserGoga(userName: "admin", password: "1234")
    
    init(presenter: LogInViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - TextFields:
    private let userNameTextField = RegisterTextField(placeholder: "Введите Ваш логин")
    private let userPasswordTextField = RegisterTextField(placeholder: "Ведите Ваш пароль")

//MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAllViews()
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == true {
            self.navigationController?.pushViewController(MoviesModule.make(), animated: false)
        }
    }

//MARK: - Create UI
    private lazy var userLogInButton: UIButton = {
       let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.isHighlighted = true
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()
    
//MARK: - Objc method
    @objc func onClickButton() {
        if userNameTextField.text != admin.userName  {
            falseUserNameAllert()}
        else if userPasswordTextField.text != admin.password {
            falsePasswordAllert()}
        else if userNameTextField.text == admin.userName && userPasswordTextField.text == admin.password {
            UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
            self.navigationController?.pushViewController(MoviesModule.make(), animated: true)
        }
    }
//MARK: - Methods
    func popToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: - Setting Views
private extension LogInViewController {
    func setupAllViews(){
        view.backgroundColor = ColorsSet.viewBackground
        addSubViews()
        setupLayout()
    }
}

//MARK: - Settings
private extension LogInViewController {
    func addSubViews() {
        view.addSubview(userNameTextField)
        view.addSubview(userPasswordTextField)
        userPasswordTextField.isSecureTextEntry = true
        view.addSubview(userLogInButton)
    }
}

//MARK: - Layout
private extension LogInViewController {
    func setupLayout() {
        userNameTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.left.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(200)
        }
        userPasswordTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(userNameTextField.snp.bottom).offset(16)
            make.left.right.equalTo(userNameTextField)
        }
        userLogInButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(userPasswordTextField.snp.bottom).offset(30)
            make.left.right.equalTo(userPasswordTextField).inset(70)
        }
    }
}

//MARK: - Allerts
private extension LogInViewController{
    func falseUserNameAllert(){
        let alert = UIAlertController(title: "Внимание!", message: "Неверное имя пользователя", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    func falsePasswordAllert() {
        let alert = UIAlertController(title: "Внимание!", message: "Неверный пароль", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}

extension LogInViewController: UITextFieldDelegate {
    
}
