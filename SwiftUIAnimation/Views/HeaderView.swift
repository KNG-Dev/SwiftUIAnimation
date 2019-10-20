//
//  HeaderView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/20/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import UIKit
//import SwiftUI

class HeaderView: UICollectionReusableView {
    lazy var image: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        backgroundColor = .white
        addSubview(image)
        image.fillSuperview()
        setGradientBackground()
        
        
        nameLabel.text = "MLS • 2 hours ago"
        nameLabel.textColor = .white
        
        
        descriptionLabel.text = "Wayne Rooney's MLS career ends after DC United's spectacular collapse in extra time"
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 3
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 26)
        let stackView = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 0, width: 0, height: frame.height / 2)
    }
    
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0, 1]
        layer.addSublayer(gradientLayer)
        gradientLayer.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
