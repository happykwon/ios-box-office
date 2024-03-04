//
//  MovieCell.swift
//  BoxOffice
//
//  Created by yujaehong on 2/21/24.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    static let identifier = "MovieCellIdentifier"
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let rankChangeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let audiCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    // 왜 private lazy var?
    private lazy var rankStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var  movieInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private let accessoryButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        configureUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieCell {
    func setupUI() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.2
    }
    
    func configureUI() {
        contentView.addSubview(rankStackView)
        contentView.addSubview(movieInfoStackView)
        contentView.addSubview(accessoryButton)
    }
    
    func setupConstraint() {
        setupRankStackViewConstraint()
        setupMovieInfoStackViewConstraint()
        setupAccessoryButtonViewConstraint()
    }
    
    func setupRankStackViewConstraint() {
        NSLayoutConstraint.activate([
            rankStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            rankStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            rankStackView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupMovieInfoStackViewConstraint() {
        NSLayoutConstraint.activate([
            movieInfoStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            movieInfoStackView.trailingAnchor.constraint(equalTo: rankStackView.trailingAnchor, constant: 30),
            movieInfoStackView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupAccessoryButtonViewConstraint() {
        NSLayoutConstraint.activate([
            accessoryButton.widthAnchor.constraint(equalToConstant: 20),
            accessoryButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            accessoryButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(with movie: MovieEntity) {
        rankLabel.text = movie.rank
        movieNameLabel.text = movie.movieName
        audiCountLabel.text = "오늘: \(movie.salesAmount.formatNumberString()) 총: \(movie.audienceCount.formatNumberString())"
        
        if movie.isNewMovie {
            rankChangeLabel.text = "신작"
        }
        
        // ...
    }
    
}
