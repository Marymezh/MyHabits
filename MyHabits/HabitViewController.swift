//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Maria Mezhova on 20.06.2021.
//

import UIKit

class HabitViewController: UIViewController {

    @IBAction func cancelModal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private let scrollView = UIScrollView()
    
    private let habitView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.toAutoLayout()
        return view
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "НАЗВАНИЕ"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.toAutoLayout()
        return label
    }()
    
    private let habitTextfield: UITextField = {
       let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textField.layer.borderColor = UIColor.white.cgColor
        textField.textColor = .systemGray2
        textField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        textField.toAutoLayout()
        return textField
    }()
    
    private let colorLabel: UILabel = {
       let label = UILabel()
        label.text = "ЦВЕТ"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.toAutoLayout()
        return label
    }()
    
    private let colorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = .orange
        button.toAutoLayout()
        return button
    }()
    
    private let timeLabel: UILabel = {
       let label = UILabel()
        label.text = "ВРЕМЯ"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.toAutoLayout()
        return label
    }()
    
    private let timePickerLabel: UILabel = {
    let label = UILabel()
     label.text = "Каждый день в "
     label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
     label.toAutoLayout()
     return label
    }()
    
    private let timeSelectedLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.textColor = UIColor(named: "Purple Project Color")
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.toAutoLayout()
        return label
    }()
    
    private let timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .time
        picker.addTarget(self, action: #selector (chooseTime), for: .valueChanged)
        picker.toAutoLayout()
        return picker
    }()
    
    @objc func chooseTime(paramdatePicker: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        
        timeSelectedLabel.text = formatter.string(from: timePicker.date)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Создать"
        view.backgroundColor = .white
        
        setupViews()
    }
    
    func setupViews() {
        
        scrollView.toAutoLayout()
        
        view.addSubview(scrollView)
        scrollView.addSubview(habitView)
        habitView.addSubviews(nameLabel, habitTextfield, colorLabel, colorButton, timeLabel, timePickerLabel, timeSelectedLabel, timePicker)
        
        let constraints = [
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            habitView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            habitView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            habitView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            habitView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            habitView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        
            nameLabel.topAnchor.constraint(equalTo: habitView.topAnchor, constant: 21),
            nameLabel.leadingAnchor.constraint(equalTo: habitView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: habitView.trailingAnchor, constant: -285),
            
            habitTextfield.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
            habitTextfield.leadingAnchor.constraint(equalTo: habitView.leadingAnchor, constant: 15),
            habitTextfield.trailingAnchor.constraint(equalTo: habitView.trailingAnchor, constant: -65),

            colorLabel.topAnchor.constraint(equalTo: habitTextfield.bottomAnchor, constant: 15),
            colorLabel.leadingAnchor.constraint(equalTo: habitView.leadingAnchor, constant: 16),
            colorLabel.trailingAnchor.constraint(equalTo: habitView.trailingAnchor, constant: -323),

            colorButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 7),
            colorButton.leadingAnchor.constraint(equalTo: habitView.leadingAnchor, constant: 16),
            colorButton.widthAnchor.constraint(equalToConstant: 30),
            colorButton.heightAnchor.constraint(equalTo: colorButton.widthAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: habitView.leadingAnchor, constant: 16),
            timeLabel.trailingAnchor.constraint(equalTo: habitView.trailingAnchor, constant: -312),
            
            timePickerLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            timePickerLabel.leadingAnchor.constraint(equalTo: habitView.leadingAnchor, constant: 16),
            timePickerLabel.trailingAnchor.constraint(equalTo: timeSelectedLabel.leadingAnchor, constant: -1),
            
            timeSelectedLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            timeSelectedLabel.trailingAnchor.constraint(equalTo: habitView.trailingAnchor, constant: -150),
            
            timePicker.topAnchor.constraint(equalTo: timeSelectedLabel.bottomAnchor, constant: 15),
            timePicker.leadingAnchor.constraint(equalTo: habitView.leadingAnchor),
            timePicker.trailingAnchor.constraint(equalTo: habitView.trailingAnchor),
            timePicker.bottomAnchor.constraint(equalTo: habitView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

//extension HabitViewController: datepi {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 3
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 10
//    }
//}
//
//extension HabitViewController: UIPickerViewDelegate {
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let result = "row = \(row)"
//        return result
//    }
//
//}

