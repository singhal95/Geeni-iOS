//
//  InitialViewController.swift
//  Geeni-iOS
//
//  Created by Sahil Dhawan on 20/05/18.
//  Copyright © 2018 wiwen. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    var imageArray : [String] = ["geeni 1", "geeni 2", "geeni 3", "geeni 4"]
    
    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var pageControl : UIPageControl!
    @IBOutlet weak var getStartedButton : UIButton!
    @IBOutlet weak var collectionViewFlowLayout : UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let spacing : CGFloat = 0.0
        
        getStartedButton.isHidden = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionViewFlowLayout.itemSize = itemSize
        collectionViewFlowLayout.minimumLineSpacing = spacing
        collectionViewFlowLayout.minimumInteritemSpacing = spacing
    }
    
    @IBAction func getStartedButtonPressed(){
        let loginViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "Login") as! LoginViewController
        self.present(loginViewController, animated: true, completion: nil)
        UserDefaults.standard.set(1, forKey: "initial")
    }
}

extension InitialViewController : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index : Int = Int(scrollView.contentOffset.x/collectionView.frame.width)
        if index == 3 {
            getStartedButton.isHidden = false
        } else {
            getStartedButton.isHidden = true
        }
        pageControl.currentPage = index
    }
}

extension InitialViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "initialCell", for: indexPath) as! InitialCollectionViewCell
        cell.initialImageView.image = UIImage(named : imageArray[indexPath.item])
        return cell
    }
}
