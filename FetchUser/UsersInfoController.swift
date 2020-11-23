//
//  UsersInfoController.swift
//  FetchUser
//
//  Created by Predrag on 20/11/2020.
//  Copyright © 2020 pejo015. All rights reserved.
//

import UIKit

class UsersInfoController: UIViewController {

    
    
    var user: UserElement? {
        didSet {
            
            guard let ID = user?.id else { return }
            guard let username = user?.username else { return }
            guard let name = user?.name else { return }
            guard let email = user?.email else { return }
            guard let addresscity = user?.address?.street else { return }
            guard let addresssuite = user?.address?.suite else { return }
            guard let addressZip = user?.address?.zipcode else { return }
            guard let addressgeo = user?.address?.geo?.lat else { return }
            guard let addresslng = user?.address?.geo?.lng else { return }
            guard let phone = user?.phone else { return }
            guard let website = user?.website else { return }
            guard let company = user?.company?.name else { return }
            guard let companycatch = user?.company?.catchPhrase else { return }
            guard let companybsbs = user?.company?.bs else { return }
            
            configureLabel(label: NameLabel, title: "Name", details: name)
            configureLabel(label: idLabel, title: "ID", details: "\(ID)")
            configureLabel(label: usernameLabel, title: "Username", details: "\(username)")
            configureLabel(label: emailLabel, title: "Email", details: "\(email)")
            configureLabel(label: addressCity, title: "City", details: "\(addresscity)")
            configureLabel(label: addressSuite, title: "Suite", details: "\(addresssuite)")
            configureLabel(label: addressZipCode, title: "ZipCode", details: "\(addressZip)")
            configureLabel(label: addressGeo, title: "lat", details: "\(addressgeo)")
            configureLabel(label: addressGeolat, title: "lng", details: "\(addresslng)")
            configureLabel(label: phoneLabel, title: "Phone", details: "\(phone)")
            configureLabel(label: websiteLabel, title: "WebSite", details: "\(website)")
            configureLabel(label: companyLabel, title: "Company", details: "\(company)")
            configureLabel(label: companycatchPhrase, title: "CatchPhrase", details: "\(companycatch)")
            configureLabel(label: companybs, title: "bs", details: "\(companybsbs)")
            
            
            
          
        }
    }
    
    
    func configureLabel(label: UILabel, title: String, details: String) {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: "\(title):  ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        attributedText.append(NSAttributedString(string: "\(details)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        label.attributedText = attributedText
    }
    

    
    lazy var mainStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.center
        return stackView
        
    }()
    
    lazy var idLabel: UILabel = {
        
        let label = UILabel()
        return label
    }()
    
   
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        return label
        
    }()
        
        
    
    lazy var NameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    lazy var emailLabel: UILabel = {
        
        let label = UILabel()
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        
        let label = UILabel()
        return label
    }()
    
    
    lazy var addressCity: UILabel = {
        
        let label = UILabel()
        return label
    }()
    lazy var addressSuite: UILabel = {
        
        let label = UILabel()
        return label
    }()
    lazy var addressZipCode: UILabel = {
        
        let label = UILabel()
        return label
    }()
    lazy var addressGeo: UILabel = {
        
        let label = UILabel()
        return label
    }()
    
    lazy var addressGeolat: UILabel = {
        
        let label = UILabel()
        return label
    }()
    
    
    lazy var phoneLabel: UILabel = {
        
        let label = UILabel()
        return label
    }()
    
    lazy var websiteLabel: UILabel = {
        
        let label = UILabel()
        return label
    }()
    
    lazy var companyLabel: UILabel = {
        
        let label = UILabel()
        return label
    }()
    
    lazy var companycatchPhrase: UILabel = {
        
        let label = UILabel()
        return label
    }()
    
    lazy var companybs: UILabel = {
        
        let label = UILabel()
        return label
    }()
    

        
        
        // MARK: - Init
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = UIColor.black

            
            view.addSubview(mainStackView)
            view.addSubview(idLabel)
            view.addSubview(NameLabel)
            view.addSubview(emailLabel)
            view.addSubview(addressLabel)
            view.addSubview(addressCity)
            view.addSubview(addressSuite)
            view.addSubview(addressZipCode)
            view.addSubview(addressGeo)
            view.addSubview(addressGeolat)
            view.addSubview(phoneLabel)
            view.addSubview(websiteLabel)
            view.addSubview(companyLabel)
            view.addSubview(companycatchPhrase)
            view.addSubview(companybs)
           
    

            let topMainStacViewAnchor = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
            let leftMainStacViewAnchor = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
            let rightMainStacViewAnchor = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
            NSLayoutConstraint.activate([topMainStacViewAnchor,leftMainStacViewAnchor,rightMainStacViewAnchor])
            
            
            let NameLabelTop = NameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
            let NameLabelWidth = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 110)
            let NameLabelHeight = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 110)
//            let NameLabelWidth = NameLabel.widthAnchor.constraint(equalToConstant: 200)
//            let NameLabelHeight = NameLabel.heightAnchor.constraint(equalToConstant: 200)
            NSLayoutConstraint.activate([NameLabelWidth,NameLabelHeight,NameLabelTop])
            mainStackView.addArrangedSubview(NameLabel)
            
            
            let idLabelTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
            let idLabelLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
            let idLabelright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
            NSLayoutConstraint.activate([idLabelTop,idLabelLeft,idLabelright])
            mainStackView.addArrangedSubview(idLabel)
            
            
            let phoneLabelTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            let phoneLabelLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
            let phoneLabelright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
            NSLayoutConstraint.activate([phoneLabelTop,phoneLabelLeft,phoneLabelright])
            mainStackView.addArrangedSubview(phoneLabel)
            
            let usernameLabelTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            let usernameLabelLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
            let usernameLabelright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
            NSLayoutConstraint.activate([usernameLabelTop,usernameLabelLeft,usernameLabelright])
            mainStackView.addArrangedSubview(usernameLabel)
            
            
            
            let emailLabelTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            let emailLabelLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
            let emailLabelright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
            NSLayoutConstraint.activate([emailLabelTop,emailLabelLeft,emailLabelright])
            mainStackView.addArrangedSubview(emailLabel)
            
            let addressLabelTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            let addressLabelLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
            let addressLabelright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
            NSLayoutConstraint.activate([addressLabelTop,addressLabelLeft,addressLabelright])
            mainStackView.addArrangedSubview(addressLabel)
            
            
            let addressCityTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            let addressCityLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
            let addressCityright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
            NSLayoutConstraint.activate([addressCityTop,addressCityLeft,addressCityright])
            mainStackView.addArrangedSubview(addressCity)
            
            let addressZipCodeTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            let addressZipCodeLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
            let addressZipCoderight = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
            NSLayoutConstraint.activate([addressZipCodeTop,addressZipCodeLeft,addressZipCoderight])
            mainStackView.addArrangedSubview(addressZipCode)
            
            let addressSuiteTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            let addressSuiteLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
            let addressSuiteright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
            NSLayoutConstraint.activate([addressSuiteTop,addressSuiteLeft,addressSuiteright])
            mainStackView.addArrangedSubview(addressSuite)
            
            let addressGeoTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            let addressGeoLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
            let addressGeoright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
            NSLayoutConstraint.activate([addressGeoTop,addressGeoLeft,addressGeoright])
            mainStackView.addArrangedSubview(addressGeo)
            
            
            let addressGeolatTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            let addressGeolatLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
            let addressGeolatright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
            NSLayoutConstraint.activate([addressGeolatTop,addressGeolatLeft,addressGeolatright])
            mainStackView.addArrangedSubview(addressGeolat)
            
            let companyLabelTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            let companyLabelLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
            let companyLabelright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
            NSLayoutConstraint.activate([companyLabelTop,companyLabelLeft,companyLabelright])
            mainStackView.addArrangedSubview(companyLabel)
            
            let companycatchPhraseTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            let companycatchPhraseLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
            let companycatchPhraseright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
            NSLayoutConstraint.activate([companycatchPhraseTop,companycatchPhraseLeft,companycatchPhraseright])
            mainStackView.addArrangedSubview(companycatchPhrase)
            
            
            let companybsTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            let companybsLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
            let companybsright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
            NSLayoutConstraint.activate([companybsTop,companybsLeft,companybsright])
            mainStackView.addArrangedSubview(companybs)
            
            
            
            let websiteLabelTop = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
            let websiteLabelLeft = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
            let websiteLabelright = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50)
            NSLayoutConstraint.activate([websiteLabelTop,websiteLabelLeft,websiteLabelright])
            mainStackView.addArrangedSubview(websiteLabel)
            
            


            
        }
        
        
    }


