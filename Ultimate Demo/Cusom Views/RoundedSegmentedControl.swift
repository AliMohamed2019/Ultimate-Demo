//
//  RoundedSegmentedControl.swift
//  Ultimate Demo
//
//  Created by Ali Mohamed on 07/08/2023.
//

import UIKit

class RoundedSegmentedControl: UISegmentedControl {
    
    private lazy var radius: CGFloat = bounds.height/2
    
    // Configure selected segment inset, can't be zero or size will error when click segment
    private var segmentInset: CGFloat = 0.1 {
        didSet {
            if segmentInset == 0 {
                segmentInset = 0.1
            }
        }
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        selectedSegmentIndex = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        // Configure Backgorund Color
        self.backgroundColor = .white
        
        // Configure Background Radius
        self.layer.cornerRadius = self.radius
        self.layer.masksToBounds = true
        
        // Configure Text Attributes
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.customDarkBlue], for: .normal)
        
        // Find selectedImageView
        let selectedImageViewIndex = numberOfSegments
        if let selectedImageView = subviews[selectedImageViewIndex] as? UIImageView {
            // Configure selectedImageView Color
            selectedImageView.backgroundColor = .customDarkBlue
            selectedImageView.image = nil
            
            // Configure selectedImageView Inset with SegmentControl
            selectedImageView.bounds = selectedImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
            
            // Configure selectedImageView cornerRadius
            selectedImageView.layer.masksToBounds = true
            selectedImageView.layer.cornerRadius = selectedImageView.frame.size.height/2
            
            selectedImageView.layer.removeAnimation(forKey: "SelectionBounds")
            
        }
        
    }
    
}
