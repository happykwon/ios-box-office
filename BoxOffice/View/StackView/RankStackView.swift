
import UIKit

class RankStackView: UIStackView {
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        return label
    }()
    
    private let oldRankLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private let rankUpImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrowtriangle.up.fill")
        imageView.tintColor = .red
        return imageView
    }()
    
    private let rankDownImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrowtriangle.down.fill")
        imageView.tintColor = .blue
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupRankStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RankStackView {
    
    func setupRankStackView() {
        self.axis = .horizontal
        self.spacing = 0
        self.distribution = .fillEqually
        self.alignment = .center
    }
    
    func configureRankUpStackView(rank: String) {
        self.addArrangedSubview(rankUpImage)
        self.addArrangedSubview(rankLabel)
        self.rankLabel.text = rank
        rankUpImage.translatesAutoresizingMaskIntoConstraints = false
        rankUpImage.heightAnchor.constraint(equalTo: rankLabel.heightAnchor).isActive = true

    }
    
    func configureRankDownStackView(rank: String) {
        addArrangedSubview(rankDownImage)
        addArrangedSubview(rankLabel)
        self.rankLabel.text = rank
        rankDownImage.translatesAutoresizingMaskIntoConstraints = false
        rankDownImage.heightAnchor.constraint(equalTo: rankLabel.heightAnchor).isActive = true
    }
    
    func configureRankNotChangeStackView() {
        self.rankLabel.text = "-"
        self.addArrangedSubview(rankLabel)
    }
}

extension RankStackView {
    func configurePresentRank(rank: String) {
        guard let presentRank = Int(rank) else { return }
        if presentRank > 0 {
            configureRankUpStackView(rank: rank)
        } else if presentRank < 0 {
            configureRankDownStackView(rank: String(abs(presentRank)))
        } else {
            configureRankNotChangeStackView()
        }
    }
}


 

