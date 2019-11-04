//
//  FeedCell.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/20/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import UIKit
/*
Twitter Search Page's results for the tabs.
*/

class FeedCell: UICollectionViewCell {
    
    let topicLabel: UILabel = {
        let label = UILabel()
        label.text = "US News • 3 hours ago"
        return label
    }()
    
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Wayne Rooney's MLS career ends after DC United's spectacular collapse in extra time"
        label.numberOfLines = 3
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    let feedImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "seasonPic1"))
        imageView.layer.cornerRadius = 16
        imageView.backgroundColor = .gray
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupStackView()
    }
    
    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [topicLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fill
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.width / 1.35, height: frame.height)
        topicLabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: NSLayoutConstraint.Axis.vertical)
        topicLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)
        
        addSubview(feedImageView)
        feedImageView.anchor(top: nil, left: stackView.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 80, height: 80)
        feedImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
