//
//  DetailsFilmViewController.swift
//  Movie Collection Goga
//
//  Created by FILIN INTEND on 03.07.2023.
//

import UIKit

final class DetailsFilmViewController: UIViewController, DetailsViewInput {

//MARK: - Properties
    let presenter: DetailsViewOutput
    static var model: Movie?
    static var urlImage: URL?

    init(presenter: DetailsViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выход", style: .plain, target: self, action: #selector(onClickQuit))
        view.backgroundColor = ColorsSet.viewBackground
        setupConstraints()
        ImageService.shared.downLoadImage(url: DetailsFilmViewController.urlImage!) { [weak self] image in
            self?.imageLabel.image = image
        }
    }
//MARK: - Create UI
    let imageLabel: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
        
    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.text = model?.Plot
        return label
    }()
    
//MARK: - Setup Layout
    private func setupConstraints() {
        view.addSubview(imageLabel)
        view.addSubview(detailsLabel)
        imageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(200)
        }
        detailsLabel.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
            make.top.equalTo(imageLabel.snp.bottom).offset(5)
        }
    }
    
//MARK: - Objc methods
    @objc func onClickQuit() {
        presenter.onClickQuit()
    }

//MARK: - Methods
    func popToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
