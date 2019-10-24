//
//  SearchView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/18/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI
import UIKit

class TwitterSearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, NavCollapseDelegate {
 
    func didScroll(scrollView: UIScrollView) {
        var lastY: CGFloat = 0
        let isScrollingUp = scrollView.contentOffset.y - lastY > 0
        lastY = scrollView.contentOffset.y
//        navigationController?.hidesBarsOnSwipe = true
    self.navigationController?.setNavigationBarHidden(isScrollingUp, animated: true)
    }
    
    private let cellId = "cellId"
    private let trendingCellId = "trendingCellId"
    private let newsCellId = "newsCellId"
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
//
//         navBar?.isTranslucent = false
         navBar?.standardAppearance = appearance
         navigationController?.hidesBarsOnSwipe = true
        
        let frame = CGRect(x: 0, y: 0, width: view.frame.width - 140, height: 44)
        let titleView = UIView(frame: frame)
        
        let whiteView = UIView()
         whiteView.backgroundColor = .white
         view.addSubview(whiteView)
//        whiteView.frame.size = CGSize(width: view.frame.width, height: 90)
        
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
    
         view.addSubview(menuBar)
         menuBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
         
     }
    
     private func setupCollectionView() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
         collectionView.backgroundColor = .white
         collectionView.delegate = self
         collectionView.dataSource = self
         
         collectionView.register(ForYouCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellId)
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: newsCellId)
        
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendingCellId, for: indexPath) as! TrendingCell
            cell.delegate = self
            return cell
        } else if indexPath.item == 2 {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newsCellId, for: indexPath) as! NewsCell
//            cell.delegate = self
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ForYouCell
        cell.backgroundColor = .white
        cell.delegate = self
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

struct TwitterSearchView: View {
    var body: some View {
         TwitterSearchIntegratedController().edgesIgnoringSafeArea(.all)
    }
}

struct TwitterSearchIntegratedController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<TwitterSearchIntegratedController>) -> UINavigationController {
        let layout = UICollectionViewFlowLayout()
        let twitterSearchViewController = TwitterSearchViewController(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: twitterSearchViewController)
        return navController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: UIViewControllerRepresentableContext<TwitterSearchIntegratedController>) {
    }
}

struct TwitterSearchView_Preview: PreviewProvider {
    static var previews: some View {
        TwitterSearchView()
    }
}

