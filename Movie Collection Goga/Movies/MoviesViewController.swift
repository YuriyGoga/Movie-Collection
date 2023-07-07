//
//  MoviesViewController.swift
//  Movie Collection Goga
//
//  Created by FILIN INTEND on 03.07.2023.
//

import SnapKit
import UIKit

final class MoviesViewController: UIViewController, MoviesViewInput {
    
   
//MARK: - Properties
    private var moviesBase = [Movie]()
    private var sortedMovies = [Movie]()
    private let presenter: MoviesViewOutput
    public var activitiIndicator = UIActivityIndicatorView()

//MARK: - Override
    init(presenter: MoviesViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выход", style: .plain, target: self, action: #selector(onClickQuit))
        navigationItem.title = "Коллекция"
        navigationController?.navigationBar.tintColor = .black
        tableViewMovies.delegate = self
        tableViewMovies.dataSource = self
        setupLayout()
        presenter.viewDidLoad()
    }
    
//MARK: - Create TableView
    private var tableViewMovies: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = ColorsSet.viewBackground
        tableView.separatorColor = .black
        tableView.register(CastomCell.self, forCellReuseIdentifier: CastomCell.identifier)
        return tableView
    }()
    
//MARK: - Methods
    func presentMovies(movies: [Movie]) {
        self.moviesBase = movies
        sortedMovies = moviesBase.sorted(by: {$0.Year < $1.Year})
        self.activitiIndicator.stopAnimating()
        self.tableViewMovies.reloadData()
    }
    
//MARK: - Setup Layout
    private func setupLayout() {
        view.addSubview(tableViewMovies)
        tableViewMovies.addSubview(activitiIndicator)
        tableViewMovies.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        activitiIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(tableViewMovies.snp.centerX)
            make.centerY.equalTo(tableViewMovies.snp.centerY)
            activitiIndicator.startAnimating()
        }
    }
 //MARK: - Objc methods
    @objc func onClickQuit() {
        UserDefaults.standard.set(false, forKey: "ISUSERLOGGEDIN")
        navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: - Some protocols
extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DetailsFilmViewController.model = sortedMovies[indexPath.row]
        DetailsFilmViewController.urlImage = URL(string: sortedMovies[indexPath.row].Poster)
        self.navigationController?.pushViewController(DetailsModule.make(), animated: true)
        
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return sortedMovies.count
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CastomCell.identifier, for: indexPath) as? CastomCell else {
                fatalError("ERROR")
            }
            cell.backgroundColor = ColorsSet.viewBackground
            cell.configurate(model: sortedMovies[indexPath.row])
            let urlImage = URL(string: sortedMovies[indexPath.row].Poster)!
            ImageService.shared.downLoadImage(url: urlImage) { image in
                cell.imageLabel.image = image
            }
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            150
        }
    }
