//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Maria Mezhova on 23.06.2021.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    private let progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.backgroundColor = UIColor(named: "Purple Project Color")
 //       progressBar.observedProgress 
        
        return progressBar
        
    }()
    
}
