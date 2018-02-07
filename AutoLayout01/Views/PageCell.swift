//
//  PageCell.swift
//  AutoLayout01
//
//  Created by Apple on 2/3/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            
            bearImageView.image = UIImage(named: unwrappedPage.image)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.title, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.text)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            titleTextView.attributedText = attributedText
            titleTextView.textAlignment = .center
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .purple
        addSubview(topViewContainer)
//        addSubview(setNavigationStackViewLayoutConstraints())
        setLayoutConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let bearImageView : UIImageView = {
        let imageView = UIImageView(image :#imageLiteral(resourceName: "bear"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleTextView : UITextView = {
        let textView = UITextView()
        
        let titleText = NSMutableAttributedString(string: "Bear Time !!", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20)])
        let descriptionText = NSMutableAttributedString(string:"\nDemo descreption text", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray])
        let combinedAttributes = NSMutableAttributedString()
        
        combinedAttributes.append(titleText)
        combinedAttributes.append(descriptionText)
        textView.attributedText = combinedAttributes
        
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        //        textView.backgroundColor = UIColor.lightGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let topViewContainer : UIView = {
        let topView = UIView()
        //        topView.backgroundColor = UIColor.lightGray
        topView.translatesAutoresizingMaskIntoConstraints = false
        return topView
    }()
    
//    private let nextButton : UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("NEXT", for: UIControlState.normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.setTitleColor(UIColor.cyan, for: .normal)
////        button.addTarget(self, action: #selector(goNextPage), for: .allTouchEvents)
////        button.addTarget(self , action: #selector(goNextPage(sender:)), for: UIControlEvents.allTouchEvents)
//        button.addTarget(self, action: #selector(goNextPage), for: UIControlEvents.allTouchEvents)
////        button.addTarget(self, action: #selector(pressButton(self)), for: .touchUpInside)
//        return button
//    }()
//    
//    @objc func goNextPage(){
////        print("Going Next")
//        titleTextView.text = "Hi"
//    }
//    
//    @objc func pressButton(sender: UIButton){ //<- needs `@objc`
//        print("Pressed")
//    }
//    
//    private let previousButton : UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("PREV", for: UIControlState.normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.setTitleColor(UIColor.cyan, for: .normal)
//        return button
//    }()
//    
//    private let pageControl : UIPageControl = {
//        let pageControl = UIPageControl()
//        pageControl.currentPage = 0
//        pageControl.numberOfPages = 4
//        pageControl.currentPageIndicatorTintColor = UIColor.cyan
//        pageControl.pageIndicatorTintColor = UIColor.gray
//        return pageControl
//    }()
//    
    private func setLayoutConstraints(){
        setTopViewContainerViewConstraints()
        setImageViewLayoutContraints()
        settitleTextViewLayoutContraints()
    }

//    private func setNavigationStackViewLayoutConstraints() -> UIStackView{
//        let navigationStackView = UIStackView(arrangedSubviews:  [previousButton, pageControl, nextButton])
//        navigationStackView.translatesAutoresizingMaskIntoConstraints = false
//        navigationStackView.axis = .horizontal
//        navigationStackView.distribution = .fillEqually
//        addSubview(navigationStackView)
//        NSLayoutConstraint.activate([
//            navigationStackView.heightAnchor.constraint(equalToConstant: 50),
//            navigationStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
//            navigationStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
//            navigationStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
//            ])
//        return navigationStackView
//    }
    
    private func setTopViewContainerViewConstraints() {
        NSLayoutConstraint.activate([
            topViewContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            topViewContainer.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            topViewContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            topViewContainer.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            topViewContainer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
            ])
        topViewContainer.addSubview(bearImageView)
        topViewContainer.addSubview(titleTextView)
    }
    
    private func setImageViewLayoutContraints (){
        bearImageView.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor).isActive = true
        NSLayoutConstraint.activate([
            bearImageView.centerYAnchor.constraint(equalTo: topViewContainer.centerYAnchor, constant : 20),
            bearImageView.heightAnchor.constraint(equalTo: topViewContainer.heightAnchor, multiplier : 0.5),
            bearImageView.widthAnchor.constraint(equalTo: topViewContainer.widthAnchor, multiplier : 0.5)
            ])
    }
    
    private func settitleTextViewLayoutContraints(){
        titleTextView.topAnchor.constraint(equalTo: topViewContainer.bottomAnchor).isActive = true
        NSLayoutConstraint.activate([
            titleTextView.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: -10),
            titleTextView.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: 10)
            ])
    }
    
}
