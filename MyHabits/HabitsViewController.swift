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
    private let collectionCellID = "collectionCellID"
    let store = HabitsStore.shared
    
    let appearance = UINavigationBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupNavigationBar()
        setupCollectionView()
  
}
    func setupNavigationBar() {
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor(named: "Navigation Bar Color")
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        view.backgroundColor = UIColor(named: "Habits background")
    }
    
    func setupCollectionView() {
        habitsCollectionView.backgroundColor = .white
        view.addSubview(habitsCollectionView)
        habitsCollectionView.toAutoLayout()
        habitsCollectionView.dataSource = self
        habitsCollectionView.delegate = self
//        habitsCollectionView.register(HabitsCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCellID")
        
        let constraints = [
            habitsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            habitsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            habitsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            habitsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}
// считаем кол-во картинок - берем его из Habits.store
extension HabitsViewController: UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.habits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}


// пишем, какую именно ячейку мы будем вставлять в нашу коллекцию, а также пишем, что эта ячейка будет переиспользована
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell: HabitsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellID", for: indexPath) as! PhotosCollectionViewCell
//
//        cell.photo = arrayOfPhotos[indexPath.item]
//        return
//    }
//}
// выставляем кол-во картинок в ряду и отступы
//
extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    
}
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (photoCollectionView.frame.width - baseInset * 4) / 3, height: (photoCollectionView.frame.width - baseInset * 4) / 3)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return baseInset
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return .zero
//    }
//    // отступы для секции (сверху, снизу и по бокам)
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: baseInset, left: baseInset, bottom: .zero, right: baseInset)
//    }
//
//    private var baseInset: CGFloat { return 8 }
//}
