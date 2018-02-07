////
////  ViewController.swift
////  AutoLayout01
////
////  Created by Apple on 2/2/18.
////  Copyright © 2018 syntaxerror. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(topViewContainer)
//        view.addSubview(setNavigationStackViewLayoutConstraints())
//        setLayoutConstraints()
//    }
//
//    private let bearImageView : UIImageView = {
//        let imageView = UIImageView(image :#imageLiteral(resourceName: "bear"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    private let titleTextView : UITextView = {
//        let textView = UITextView()
//
//        let titleText = NSMutableAttributedString(string: "Bear Time !!", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20)])
//        let descriptionText = NSMutableAttributedString(string:"\n\nournvonvoneiov", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray])
//        let combinedAttributes = NSMutableAttributedString()
//        combinedAttributes.append(titleText)
//        combinedAttributes.append(descriptionText)
//        textView.attributedText = combinedAttributes
//
//        textView.textAlignment = .center
//        textView.isEditable = false
//        textView.isScrollEnabled = false
////        textView.backgroundColor = UIColor.lightGray
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        return textView
//    }()
//
//    private let topViewContainer : UIView = {
//        let topView = UIView()
////        topView.backgroundColor = UIColor.lightGray
//        topView.translatesAutoresizingMaskIntoConstraints = false
//        return topView
//    }()
//
//    private let nextButton : UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("NEXT", for: UIControlState.normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.setTitleColor(UIColor.cyan, for: .normal)
//        return button
//    }()
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
//       let pageControl = UIPageControl()
//        pageControl.currentPage = 0
//        pageControl.numberOfPages = 4
//        pageControl.currentPageIndicatorTintColor = UIColor.cyan
//        pageControl.pageIndicatorTintColor = UIColor.gray
//        return pageControl
//    }()
//
//    func setLayoutConstraints(){
//        setTopViewContainerViewConstraints()
//        setImageViewLayoutContraints()
//        settitleTextViewLayoutContraints()
//    }
//
//    private func setNavigationStackViewLayoutConstraints() -> UIStackView{
//        let navigationStackView = UIStackView(arrangedSubviews:  [previousButton, pageControl, nextButton])
//        navigationStackView.translatesAutoresizingMaskIntoConstraints = false
//        navigationStackView.axis = .horizontal
//        navigationStackView.distribution = .fillEqually
//        view.addSubview(navigationStackView)
//        NSLayoutConstraint.activate([
//            navigationStackView.heightAnchor.constraint(equalToConstant: 50),
//            navigationStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            navigationStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            navigationStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
//        ])
//        return navigationStackView
//    }
//
//    private func setTopViewContainerViewConstraints() {
//        NSLayoutConstraint.activate([
//            topViewContainer.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5),
//            topViewContainer.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
//            topViewContainer.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
//            topViewContainer.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
//            topViewContainer.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
//        ])
//        topViewContainer.addSubview(bearImageView)
//        topViewContainer.addSubview(titleTextView)
//    }
//
//    private func setImageViewLayoutContraints (){
//        bearImageView.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor).isActive = true
//        NSLayoutConstraint.activate([
//            bearImageView.centerYAnchor.constraint(equalTo: topViewContainer.centerYAnchor, constant : 20),
//            bearImageView.heightAnchor.constraint(equalTo: topViewContainer.heightAnchor, multiplier : 0.5),
//            bearImageView.widthAnchor.constraint(equalTo: topViewContainer.widthAnchor, multiplier : 0.5)
//        ])
//    }
//
//    private func settitleTextViewLayoutContraints(){
//        titleTextView.topAnchor.constraint(equalTo: topViewContainer.bottomAnchor).isActive = true
//            NSLayoutConstraint.activate([
//            titleTextView.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: -10),
//            titleTextView.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: 10)
//        ])
//    }
//
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
