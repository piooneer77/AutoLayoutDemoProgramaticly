//
//  SwipeController.swift
//  AutoLayout01
//
//  Created by Apple on 2/3/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class SwipeController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let imageName = ["bear","heart_second", "leaf_third"]
    
    let pages = [
        Page(title: "Join use today in our fun and games!", text: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", image: "bear"),
        Page(title: "Subscribe and get coupons on our daily events", text: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have.", image: "heart_second"),
        Page(title: "VIP members special services", text: "Leaf Page Descreption", image: "leaf_third")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationStackViewLayoutConstraints()
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        cell.page = pages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }, completion: nil)
        
    }
    
    private let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.cyan, for: .normal)
        button.addTarget(self, action: #selector(goNextPage), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    @objc func goNextPage(){
//        print("Going Next")
        var nextPage = pageControl.currentPage + 1
        if nextPage > pages.count - 1{
            nextPage = 0
        }
        let index = IndexPath(item: nextPage, section: 0)
        pageControl.currentPage = nextPage
        collectionView?.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    
    private let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor.cyan, for: .normal)
        button.addTarget(self, action: #selector(goPreviousPage), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    @objc func goPreviousPage(){
//        print("Going PREV")
        var previousPage = pageControl.currentPage - 1
        if previousPage < 0 {
            previousPage = pages.count - 1
        }
        let index = IndexPath(item: previousPage, section: 0)
        pageControl.currentPage = previousPage
        collectionView?.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = self.pages.count
        pageControl.currentPageIndicatorTintColor = UIColor.cyan
        pageControl.pageIndicatorTintColor = UIColor.gray
        return pageControl
    }()
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
//        print(x, view.frame.width, x / view.frame.width)
    }
    
    private func setNavigationStackViewLayoutConstraints(){
        let navigationStackView = UIStackView(arrangedSubviews:  [previousButton, pageControl, nextButton])
        navigationStackView.translatesAutoresizingMaskIntoConstraints = false
        navigationStackView.axis = .horizontal
        navigationStackView.distribution = .fillEqually
        view.addSubview(navigationStackView)
        NSLayoutConstraint.activate([
            navigationStackView.heightAnchor.constraint(equalToConstant: 50),
            navigationStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            navigationStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navigationStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}










