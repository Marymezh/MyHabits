//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Maria Mezhova on 17.06.2021.
//

import UIKit

class HabitsViewController: UIViewController {
   
    private let layout = UICollectionViewFlowLayout()
    private lazy var habitsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    let store = HabitsStore.shared

    let appearance = UINavigationBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
        setupCollectionView()
}
    func setupAppearance() {
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor.navBarTheme
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

    }
    
    func setupCollectionView() {
        view.addSubview(habitsCollectionView)
        habitsCollectionView.toAutoLayout()
        habitsCollectionView.backgroundColor = UIColor.habitsScreenTheme
        
        habitsCollectionView.dataSource = self
        habitsCollectionView.delegate = self
        habitsCollectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HabitCollectionViewCell.self))
        habitsCollectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ProgressCollectionViewCell.self))

        let constraints = [
            habitsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            habitsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            habitsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            habitsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.habitsCollectionView.delegate = self
        self.habitsCollectionView.dataSource = self
        
        habitsCollectionView.reloadData()
    }

}

extension HabitsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return store.habits.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let progressCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProgressCollectionViewCell.self), for: indexPath) as! ProgressCollectionViewCell
        
        
        let habitCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HabitCollectionViewCell.self), for: indexPath) as! HabitCollectionViewCell
        
        habitCell.habit = store.habits[indexPath.item]
//        habitCell.delegate = self
        
        switch indexPath.section{

        case 0:
            return progressCell
        default:
            return habitCell
        }
    }
}

extension HabitsViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch indexPath.section {
        case 0:
            return CGSize(width: (habitsCollectionView.frame.width - 33), height: 60)
        default:
            return  CGSize(width: (habitsCollectionView.frame.width - 33), height: 130)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 0:
            return UIEdgeInsets(top: 22, left: .zero, bottom: .zero, right:.zero)
        default:
            return UIEdgeInsets(top: 18, left: .zero, bottom: .zero, right: .zero)
        }
    }
}
