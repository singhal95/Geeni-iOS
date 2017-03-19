//
//  PostViewController.swift
//  Geeni-iOS
//
//  Created by Winnie Wen on 3/16/17.
//  Copyright © 2017 wiwen. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UIScrollViewDelegate {

    var scrollView: UIScrollView!
    var containerView = UIView()
    
    var courseLabel: UILabel!
    var courseTextField: UITextField!
    var locationLabel: UILabel!
    var locationTextField: UITextField!
    var dateLabel: UILabel!
    var dateTextField: UITextField!
    var descriptionLabel: UILabel!
    var descriptionTextView: UITextView!
    var cameraButton: UIButton!
    var cameraImage: UIImageView!
    var submitButton: UIButton!
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Add scroll view
        scrollView.frame = view.bounds
        containerView.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
    }
    
    func setup() {
        self.view.backgroundColor = UIColor.white
        
        // Setup scrollview delegate
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
        
        // Container view on top of scroll view
        containerView = UIView()
        scrollView.addSubview(containerView)
        view.addSubview(scrollView)
        
        // Set navigation bar title and color
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.20, green:0.60, blue:1.00, alpha:1.0)
        self.navigationController?.navigationBar.topItem?.title = "New Post"

        self.navigationController?.navigationBar.tintColor = UIColor.white

        
        var yPosition: CGFloat = 10
        // course label
        courseLabel = UILabel(frame: CGRect(x: 20, y: yPosition, width: self.view.frame.width/2, height: 50))
        courseLabel.text = "COURSE NAME"
        courseLabel.textColor = UIColor.darkGray
        containerView.addSubview(courseLabel)
        
        yPosition += courseLabel.frame.height
        // course textfield
        courseTextField = UITextField(frame: CGRect(x: 20, y: yPosition, width: self.view.frame.width - 40, height: 40))
        //courseTextField.borderStyle = UITextBorderStyle.roundedRect
        containerView.addSubview(courseTextField)
        
        yPosition += courseTextField.frame.height + 2
        // location label
        locationLabel = UILabel(frame: CGRect(x: 20, y: yPosition, width: self.view.frame.width/2, height: 50))
        locationLabel.text = "LOCATION"
        locationLabel.textColor = UIColor.darkGray
        containerView.addSubview(locationLabel)
        
        var lineView = UIView(frame: CGRect(x: 0, y: courseTextField.frame.height, width: self.view.frame.width - 40, height: 1))
        lineView.backgroundColor = UIColor.lightGray
        courseTextField.addSubview(lineView)
        
        yPosition += locationLabel.frame.height + 2
        // location textfield
        locationTextField = UITextField(frame: CGRect(x: 20, y: yPosition, width: self.view.frame.width - 40, height: 40))
        containerView.addSubview(locationTextField)
        
        yPosition += locationTextField.frame.height + 2
        // date label
        dateLabel = UILabel(frame: CGRect(x: 20, y: yPosition, width: self.view.frame.width/2, height: 50))
        dateLabel.text = "DATE AND TIME"
        dateLabel.textColor = UIColor.darkGray
        containerView.addSubview(dateLabel)
        
        lineView = UIView(frame: CGRect(x: 0, y: locationTextField.frame.height, width: self.view.frame.width - 40, height: 1))
        lineView.backgroundColor = UIColor.lightGray
        locationTextField.addSubview(lineView)
        
        yPosition += dateLabel.frame.height + 2
        // date textfield
        dateTextField = UITextField(frame: CGRect(x: 20, y: yPosition, width: self.view.frame.width - 40, height: 40))
        containerView.addSubview(dateTextField)
        
        lineView = UIView(frame: CGRect(x: 0, y: locationTextField.frame.height, width: self.view.frame.width - 100, height: 1))
        lineView.backgroundColor = UIColor.lightGray
        dateTextField.addSubview(lineView)
        
        yPosition += dateTextField.frame.height + 2
        // Description Label
        descriptionLabel = UILabel(frame: CGRect(x: 20, y: yPosition, width: self.view.frame.width/2, height: 50))
        descriptionLabel.text = "DESCRIPTION"
        descriptionLabel.textColor = UIColor.darkGray
        containerView.addSubview(descriptionLabel)
        
        yPosition += descriptionLabel.frame.height + 2
        // Description textfield 
        descriptionTextView = UITextView(frame: CGRect(x: 20, y: yPosition, width: self.view.frame.width - 40, height: 100))

        containerView.addSubview(descriptionTextView)
        
        yPosition += descriptionTextView.frame.height
        
        lineView = UIView(frame: CGRect(x: 20, y: yPosition, width: self.view.frame.width - 40, height: 1))
        lineView.backgroundColor = UIColor.lightGray
        containerView.addSubview(lineView)
        
        yPosition += 5
        // Camera button
        cameraButton = UIButton(frame: CGRect(x: self.view.frame.width - 70, y: yPosition, width: 50, height: 50))
        
        cameraImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        cameraImage.image = UIImage(named: "add-photo")
        
        cameraButton.setImage(UIImage(named: "add-photo"), for: .normal)
        cameraButton.isUserInteractionEnabled = true
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: cameraButton.frame.width + 20, height: cameraButton.frame.height)
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: CGRect(x: 20, y: yPosition, width: lineView.frame.width - cameraButton.frame.width - 10, height: cameraButton.frame.height), collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        containerView.addSubview(collectionView)


        
        containerView.addSubview(cameraButton)
        
        // Submit button
        yPosition += cameraButton.frame.height + 20
        submitButton = UIButton(frame: CGRect(x: self.view.frame.width/2 - 100, y: yPosition, width: 200, height: 50))
        submitButton.setTitle("SUBMIT POST", for: .normal)
        submitButton.backgroundColor = UIColor(red:0.20, green:0.60, blue:1.00, alpha:1.0)
        
        submitButton.layer.cornerRadius = 25.0
        submitButton.isUserInteractionEnabled = true
        
        containerView.addSubview(submitButton)
        
        //yPosition += submitButton.frame.height + 20
        
        //self.scrollView.contentSize.height = yPosition + 10
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension PostViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = UIColor.blue
        return cell
    }
}


