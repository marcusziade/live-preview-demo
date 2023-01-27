import Foundation
import UIKit

final class Cell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(backgroundImageView)
        backgroundImageView.addSubview(dimmingView)

        let stackView = UIStackView(arrangedSubviews: [titleLabel, captionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.alignment = .leading
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            dimmingView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor),
            dimmingView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor),
            dimmingView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            dimmingView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor),

            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a CollectionView cell"
        label.numberOfLines = 0
        return label
    }()

    private let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()

    private let backgroundImageView: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "homepod.2.fill"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.tintColor = .red
        return view
    }()

    private let dimmingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.7)
        return view
    }()
}

#if DEBUG

import SwiftUI

struct Cell_Preview: PreviewProvider {
    static var previews: some View = Preview(for: Cell())
        .previewLayout(.fixed(width: 300, height: 200))
        .preferredColorScheme(.dark)
        .padding()
}

#endif


