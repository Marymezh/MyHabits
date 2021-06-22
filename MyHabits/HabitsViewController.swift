//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Maria Mezhova on 17.06.2021.
//

import UIKit

class HabitsViewController: UIViewController {

    
    let appearance = UINavigationBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor(named: "Navigation Bar Color")
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        navigationController?.navigationBar.backgroundColor = UIColor(named: "Navigation Bar Color")

        view.backgroundColor = UIColor(named: "Habits background")
}

}
