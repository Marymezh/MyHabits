//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Maria Mezhova on 23.06.2021.
//

import UIKit

protocol HabitCollectionViewCellDelegate: class {
    func markHabit(_habit: Habit)
}

class HabitCollectionViewCell: UICollectionViewCell {

    weak var delegate: HabitCollectionViewCellDelegate?
    
    var habit: Habit? {
        didSet {
            habitNameLabel.text = habit?.name
            habitNameLabel.textColor = habit?.color
            habitTimeLabel.text = habit?.dateString
            habitButton.layer.borderColor = habit?.color.cgColor
        }
    }
    
    private let habitNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 2
        label.toAutoLayout()
        return label
    }()
    
    private let habitTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemGray2
        label.toAutoLayout()
        return label
    }()
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray2
        label.text = "Счётчик: "
        label.toAutoLayout()
        return label
    }()
    
    private let counterValueLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .systemGray2
        label.text = "0"
        label.toAutoLayout()
        return label
    }()
    
    private lazy var habitButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 19
        button.layer.borderWidth = 1
//        button.alpha = 0.1
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(tapHabitButton), for: UIControl.Event.touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    @objc func tapHabitButton() {
        guard let habit = habit else { return }
        delegate?.markHabit(_habit: habit)
        
        let imageSize = UIFont.systemFont(ofSize: 20, weight: .semibold)
        let configuration = UIImage.SymbolConfiguration(font: imageSize)
        let image = UIImage(systemName: "checkmark", withConfiguration: configuration)
    
//        habitButton.alpha = 1
        habitButton.setImage(image, for: UIControl.State.normal)
        habitButton.tintColor = .white
        counterValueLabel.text = "1"
        
        habitButton.backgroundColor = self.habit?.color
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .white
        
        contentView.addSubviews(habitNameLabel, habitTimeLabel, counterLabel, counterValueLabel, habitButton)
        
        let constraints = [
        
            habitNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            habitNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -trailingInset),
            
            habitTimeLabel.topAnchor.constraint(equalTo: habitNameLabel.bottomAnchor, constant: 4),
            habitTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -trailingInset),
            
            counterLabel.topAnchor.constraint(equalTo: habitTimeLabel.bottomAnchor, constant: 30),
            counterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            counterLabel.trailingAnchor.constraint(equalTo: counterValueLabel.leadingAnchor, constant: -1),
            counterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            counterValueLabel.topAnchor.constraint(equalTo: habitTimeLabel.bottomAnchor, constant: 30),
            
            habitButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 46),
            habitButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            habitButton.widthAnchor.constraint(equalToConstant: 38),
            habitButton.heightAnchor.constraint(equalTo: habitButton.widthAnchor)
        
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private var trailingInset: CGFloat { return 16 }
}
