//
//  SearchView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/18/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI
import UIKit

class TwitterSearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, FeedCellDelegate {
 
    func didScroll(scrollView: UIScrollView) {
        var lastY: CGFloat = 0
        let isScrollingUp = scrollView.contentOffset.y - lastY > 0
        lastY = scrollView.contentOffset.y
    
        UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
             self.navigationController?.setNavigationBarHidden(isScrollingUp, animated: true)
        }, completion: nil)
    }
    
    private let cellId = "cellId"
    private let trendingCellId = "trendingCellId"
    let menuBar = MenuBar()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupMenuBar()
        setupCollectionView()
    }
    
    //MARK: - Private Functions
    private func setupNavBar() {
         let appearance = UINavigationBarAppearance()
         let navBar = navigationController?.navigationBar
         appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
         appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
         appearance.backgroundColor = .white
         appearance.shadowColor = .white
        
         navBar?.isTranslucent = false
         navBar?.standardAppearance = appearance
         navigationController?.hidesBarsOnSwipe = true
        
        let frame = CGRect(x: 0, y: 0, width: view.frame.width - 140, height: 44)
        let titleView = UIView(frame: frame)
        
        let searchBar = UISearchBar()
        searchBar.frame = frame
        searchBar.placeholder = "Search Twitter"
        searchBar.layer.cornerRadius = 20
        searchBar.clipsToBounds = true
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor(named: "Color5")
        }
        
        titleView.addSubview(searchBar)
        self.navigationItem.titleView = titleView
     }
     
     private func setupMenuBar() {
        
        menuBar.searchController = self
    
//         let whiteView = UIView()
//         whiteView.backgroundColor = .white
         
//         view.addSubview(whiteView)
         view.addSubview(menuBar)
         menuBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil
             , right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
         
     }
    
     private func setupCollectionView() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
         collectionView.backgroundColor = .white
         collectionView.delegate = self
         collectionView.dataSource = self
         
         collectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellId)
        
         collectionView.showsVerticalScrollIndicator = false
         collectionView.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
        collectionView.isPagingEnabled = true
         
     }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 5
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexPath = IndexPath(item: index, section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    //MARK: - CollectionView Delegates
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 1 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: trendingCellId, for: indexPath)
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
        cell.backgroundColor = .white
        cell.delegate = self
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

struct SearchView: View {
    var body: some View {
        HStack {
            
            SearchMenuTab(text: "For You")
            SearchMenuTab(text: "Trending")
            SearchMenuTab(text: "News")
            SearchMenuTab(text: "Sport")
            SearchMenuTab(text: "Fun")
        }
        
        .frame(height: 60)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchMenuTab: View {
    var text: String
    
    var body: some View {
        VStack {
            Button(action: {
                print("1")
            }, label: {
                Text(text)
                    .tag(1)
            })
            
            Rectangle()
                .frame(height: 2)
                .foregroundColor(Color.blue)
        }
    }
}

enum Section {
    case forYou
    case trending
    case news
    case sports
    case fun
}
