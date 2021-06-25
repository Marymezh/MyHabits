//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Maria Mezhova on 23.06.2021.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    let store = HabitsStore.shared
    
    private lazy var progress = Progress(totalUnitCount: Int64(store.habits.count))
    
    private let progressLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.text = "Всё получится!"
        label.textColor = .systemGray
        label.toAutoLayout()
        return label
    }()
    
    private let progressPercentLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.text = "50%"
        label.textColor = .systemGray
        label.textAlignment = .right
        label.toAutoLayout()
        return label
    }()
    
    private let progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressViewStyle = .bar
        progressBar.trackTintColor = .systemGray2
        progressBar.progressTintColor = UIColor.purpleTheme
        progressBar.setProgress(0.0, animated: false)
        
        progressBar.toAutoLayout()
        return progressBar
    }()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubviews(progressLabel, progressPercentLabel, progressBar)
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .white
        
        let constraints = [
            
            progressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            progressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            progressPercentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            progressPercentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            progressBar.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 10),
            progressBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progressBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}