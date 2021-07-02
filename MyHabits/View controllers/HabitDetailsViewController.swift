//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Maria Mezhova on 29.06.2021.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    var habit: Habit?
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    let cellID = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setupViews()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        NotificationCenter.default.addObserver(self, selector: #selector(goToHabitsVC), name: NSNotification.Name(rawValue: "goToHabitsVC"), object: nil)
    }
    
    @objc func goToHabitsVC() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        navigationItem.title = habit?.name
        NotificationCenter.default.addObserver(self, selector: #selector(changeTitle), name: NSNotification.Name(rawValue: "changeTitle"), object: nil)
    }
    
    @objc func changeTitle() {
        navigationItem.title = habit?.name
    }
    
    func setupNavigation() {
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.tintColor = UIColor.purpleTheme
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action:  #selector(tapEditButton))
    }
    
    func setupViews() {
        
        view.addSubview(tableView)
        tableView.toAutoLayout()
        
        let constraints = [
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func tapEditButton() {
        let habitVC = HabitViewController()
        habitVC.habit = habit
        let navController = UINavigationController(rootViewController: habitVC)
        self.present(navController, animated: true, completion: nil)
    }
}

extension HabitDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
       
        let datesTracked = HabitsStore.shared.dates.count - indexPath.item - 1
        cell.textLabel?.text = "\(HabitsStore.shared.trackDateString(forIndex: datesTracked) ?? "") "
        cell.tintColor = UIColor.purpleTheme

        let selectedHabit = self.habit
            let date = HabitsStore.shared.dates[datesTracked]
        if HabitsStore.shared.habit(selectedHabit!, isTrackedIn: date) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Активность"
    }
}

extension HabitDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        return tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
