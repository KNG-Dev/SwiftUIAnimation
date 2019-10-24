//
//  NewsCell.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/20/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import UIKit

class NewsCell: ForYouCell {
    let newsCellId = "newsCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.backgroundColor = UIColor(named: "Color5")
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: newsCellId)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! HeaderView
        
        let images = ["seasonPic2"]
        header.image.image = UIImage(named: images[indexPath.item])
        header.descriptionLabel.text = "Howdy Partner"
        
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newsCellId, for: indexPath)
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrolling")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
