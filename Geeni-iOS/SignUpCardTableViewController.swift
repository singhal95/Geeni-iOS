//
//  SignUpCardTableViewController.swift
//  Geeni-iOS
//
//  Created by Sahil Dhawan on 22/05/18.
//  Copyright © 2018 wiwen. All rights reserved.
//

import Foundation
import UIKit
import SWRevealViewController

class SignUpCardTableViewController : UITableViewController {
    
    var selectedCard : Card? = nil
    
    @IBOutlet weak var cardLabel : UILabel!
    @IBOutlet weak var cardImageView : UIImageView!
    @IBOutlet weak var saveDetailsButton : UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDetails.selectedCard != nil {
            self.selectedCard = UserDetails.selectedCard!
            self.cardLabel.text = "*" + (selectedCard?.last_four!)!
            if selectedCard?.provider == "Visa" || selectedCard?.provider == "MasterCard" ||  selectedCard?.provider == "Discover" || selectedCard?.provider == "American Express"{
                self.cardImageView.image = UIImage(named : (selectedCard?.provider!)!)
            } else {
                self.cardImageView.image = UIImage(named : "credit")
            }
            UserDetails.selectedCard = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSaveButton()
        self.navigationItem.title = "Enter Card Details"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item == 0 || indexPath.item == 1 {
            let cardListViewController = UIStoryboard(name: "ListCard", bundle: nil).instantiateViewController(withIdentifier: "CardListTableViewController") as! CardListTableViewController
            cardListViewController.newPostBool = true
            self.navigationController?.pushViewController(cardListViewController, animated: true)
        }
    }
    
    func presentMainView() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let storyboard: UIStoryboard = UIStoryboard(name: "SideMenu", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "MainPage") as! SWRevealViewController
        delegate.window?.rootViewController = initialViewController
        delegate.window?.makeKeyAndVisible()
    }
    
    func setupSaveButton(){
        saveDetailsButton.createSubmitButton()
        saveDetailsButton.setTitle("LETS START", for: .normal)
        saveDetailsButton.center.x = self.view.center.x
    }
    
    @IBAction func saveButtonPressed(){
        if cardLabel.text == "" {
            self.showAlert("Please add your Card Details to start using Geeni")
        } else {
            presentMainView()
        }
    }
}
