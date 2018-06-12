//
//  ProfileImageXib.swift
//  Geeni-iOS
//
//  Created by Sahil Dhawan on 02/10/17.
//  Copyright © 2017 wiwen. All rights reserved.
//

import UIKit

class ProfileImageXib: UIView {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel : UILabel!
    @IBOutlet weak var subjectNameLabel : UILabel!
    @IBOutlet weak var majorLabel : UILabel!
    
    override func awakeFromNib() {
        userImage.image = UIImage(named : "user_gray")
        userNameLabel.text = ""
        subjectNameLabel.text = ""
        majorLabel.text = ""
        userImage.makeRound()
        userImage.setBorder(color: colors.whiteColor.cgColor, width: 2)
        userImage.contentMode = .scaleToFill
        setupTableViewHeader()
    }
    
    func setupTableViewHeader(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [colors.blueColor.cgColor,colors.geeniBlueColor.cgColor,colors.geeniGreenColor.cgColor]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func hideMessageButton(_ bool : Bool){
        messageButton.isHidden = bool
        messageButton.isUserInteractionEnabled = !bool
    }
    
    func hideBackButton(_ bool : Bool){
        backButton.isHidden = bool
        backButton.isUserInteractionEnabled = !bool
    }
}
