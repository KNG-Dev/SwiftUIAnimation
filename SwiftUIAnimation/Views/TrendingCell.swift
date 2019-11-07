//
//  TrendingCell.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/20/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import UIKit
/*
Twitter Search Page's 2nd tab
*/

class TrendingCell: UICollectionViewCell,UITableViewDataSource, UITableViewDelegate {
    
    let cellId = "cellId"
    
    lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        return tb
        
    }()
    
    var delegate: NavCollapseDelegate?
    
    let hashTagLabel: UILabel = {
        let label = UILabel()
        label.text = "#SundayMorning"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    
    let tweetLabel: UILabel = {
        let label = UILabel()
        label.text = "39.4K Tweets"
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 80, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellId)
        
        cell.textLabel?.text = "#Swift"
        cell.detailTextLabel?.text = "32,064 Retweets"
        cell.detailTextLabel?.textColor = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.didScroll(scrollView: scrollView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
