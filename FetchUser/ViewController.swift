//
//  ViewController.swift
//  FetchUser
//
//  Created by Predrag on 15/10/2020.
//  Copyright © 2020 pejo015. All rights reserved.
//

import UIKit
import CollectionKit


class ViewController: UICollectionViewController {
    
    private let reuseIdentifire = "CollectionViewCell"
    var users = [UserElement]()
    
  


    var activityIndicator: UIActivityIndicatorView = {
        let iv = UIActivityIndicatorView()
        iv.style = .large
        iv.alpha = 0.5
        return iv
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
        configureViewComponents()
        

        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 30)/2, height: self.collectionView.frame.size.height/4)
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
    
     override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    
    override  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifire, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .red
        cell.user = users[indexPath.item]
      
       
        
        
        return cell
    }
    
   override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
         
        let controller = UsersInfoController()
        controller.user = users[indexPath.row]
               self.navigationController?.pushViewController(controller, animated: true)
    }
   
          
    
    func configureViewComponents() {
        
        navigationItem.title = "Users"
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifire)
        
        
        
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        
    }
    
    
    

    func fetchUser () {
        
        activityIndicator.startAnimating()
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {

                 let decoder = JSONDecoder()

                self.users = try decoder.decode([UserElement].self, from: data)

               

                let stringOne = String(decoding: data, as: UTF8.self)
                print(stringOne)




            } catch {
                print(error)



            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }

            


        })
        task.resume()

    }
    
    

    
}








