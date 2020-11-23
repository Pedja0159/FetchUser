//
//  DetailViewController.swift
//  FetchUser
//
//  Created by Predrag on 23/10/2020.
//  Copyright © 2020 pejo015. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var webLabel: UILabel!
    @IBOutlet var CompanyLabel: UILabel!
    
    var user:UserElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        
//        idLabel.text = "\(String(describing: user?.id))"
//        nameLabel.text = user?.name
//        userLabel.text = user?.username
//        emailLabel.text = user?.email
        
        
        
    }
    
    
    func didEditCar(user: UserElement) {
        nameLabel.text = user.name
        userLabel.text = user.username
        }
        
    }
    
    

