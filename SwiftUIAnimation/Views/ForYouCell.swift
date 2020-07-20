//
//  FeedCell.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/20/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import UIKit

/*
Twitter Search Page's 1st tab
*/

protocol NavCollapseDelegate {
    func didScroll(scrollView: UIScrollView)
}

class ForYouCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    let cellId = "cellId"
    let headerId = "headerId"
    
    lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        return tb
    }()
    
    var delegate: NavCollapseDelegate?
    let images = ["seasonPic1", "seasonPic2", "seasonPic3", "seasonPic4", "seasonPic1", "seasonPic2", "seasonPic3", "seasonPic1"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 80, paddingLeft: 0, paddingBottom: 30, paddingRight: 0, width: 0, height: 0)
        tableView.register(FeedCell.self, forCellReuseIdentifier: cellId)
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor(named: "Color5")
//        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
//        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "footer")

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView()
        headerView.image.image = UIImage(named: "seasonPic1")
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FeedCell
        cell.feedImageView.image = UIImage(named: images[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.didScroll(scrollView: scrollView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
