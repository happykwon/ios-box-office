//
//  OldAndNewStackView.swift
//  BoxOffice
//
//  Created by 권태호 on 05/03/2024.
//

import UIKit

class OldAndNewStackView: UIStackView {
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let newMovieLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        label.textColor = .red
        label.text = "신작"
        return label
    }()
    
    private let rankStackView  = RankStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension OldAndNewStackView {
    func setupStackView() {
        self.axis = .vertical
        self.spacing = 0
        self.distribution = .fill
        self.alignment = .center
    }
    
    func configureNewMovieLabel() {
        self.addArrangedSubview(rankLabel)
        self.addArrangedSubview(newMovieLabel)
    }
    func configureRankChangedMovieLabel(rank: String) {
        rankStackView.configurePresentRank(rankChange: rank)
        self.addArrangedSubview(rankLabel)
        self.addArrangedSubview(rankStackView)
    }
}

extension OldAndNewStackView {
    func configure(rank: String, rankOldAndNew: String, rankChanged: String) {
        rankLabel.text = rank
        arrangedSubviews.forEach { $0.removeFromSuperview() }
        addArrangedSubview(rankLabel)
        if rankOldAndNew == "NEW" {
            addArrangedSubview(newMovieLabel)
        } else {
            rankStackView.configurePresentRank(rankChange: rankChanged)
            addArrangedSubview(rankStackView)
        }
    }
}
