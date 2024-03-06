import UIKit

final class MovieListCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: MovieListCollectionViewCell.self)
    private let oldAndNewStackView = OldAndNewStackView()
    private let movieStackView = MovieStackView()
    private lazy var mainStackOfMovieListCollectionViewCell: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [oldAndNewStackView, movieStackView])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 2
        stack.alignment = .center
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        activateConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MovieListCollectionViewCell {
    func configureViews() {
        contentView.addSubview(mainStackOfMovieListCollectionViewCell)
    }
    
    func activateConstraints() {
        oldAndNewStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2).isActive = true
        mainStackOfMovieListCollectionViewCell.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackOfMovieListCollectionViewCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainStackOfMovieListCollectionViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainStackOfMovieListCollectionViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mainStackOfMovieListCollectionViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}

extension MovieListCollectionViewCell {
    func configure(with result: MyDailyBoxOfficeList) {
        oldAndNewStackView.configure(rank: result.rank,
                                     rankState: result.rankOldAndNew.rawValue,
                                     rankChanged: result.rankChange)
        
        movieStackView.configureMovieStackView(todayAdience: result.todayAudience,
                                               movieName: result.movieName,
                                               totalAdience: result.totalAudience)
    }
}

