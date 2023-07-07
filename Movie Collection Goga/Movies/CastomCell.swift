//
//  CastomCell.swift
//  Movie Collection Goga
//
//  Created by FILIN INTEND on 03.07.2023.
//

import SnapKit
import UIKit

class CastomCell: UITableViewCell {
   
//MARK: - Properties
    static let identifier = "CastomCell"

    
//MARK: - Create UI
    let imageLabel: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let runTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
//MARK: - Override
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstarintsCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        imageLabel.image = nil
    }
//MARK: - Method
    func configurate(model: Movie) {
        nameLabel.text = "Название: \(model.Title)"
        yearLabel.text = "Год: \(model.Year)"
        runTimeLabel.text = "Время: \(model.Runtime)"
    }

//MARK: - Setup Constraints Cell
    func setupConstarintsCell() {
        contentView.addSubview(imageLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(runTimeLabel)

        imageLabel.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(5)
            make.right.equalToSuperview().inset(280)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.equalTo(imageLabel.snp.right).offset(5)
            make.right.equalToSuperview().inset(5)
        }
        yearLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(nameLabel.snp.left)
        }
        runTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(yearLabel.snp.bottom).offset(5)
            make.left.equalTo(nameLabel.snp.left)
        }
    }
}
