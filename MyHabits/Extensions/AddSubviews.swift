//
//  AddSubviews.swift
//  MyHabits
//
//  Created by Maria Mezhova on 25.06.2021.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
