//
//  UsersInfoController.swift
//  FetchUser
//
//  Created by Predrag on 20/11/2020.
//  Copyright © 2020 pejo015. All rights reserved.
//

import UIKit
import SafariServices




class UsersInfoController: UIViewController {
    
    
    
    
    var user: UserElement? {
        didSet {
            
            guard let ID = user?.id else { return }
            guard let username = user?.username else { return }
            guard let name = user?.name else { return }
            guard let email = user?.email else { return }
            guard let addressStreet = user?.address?.street else { return }
            guard let addresscity = user?.address?.city else  { return }
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
            configureLabel(label: address, title: "Street", details: "\(addressStreet)")
            configureLabel(label: addressSuite, title: "Suite", details: "\(addresssuite)")
            configureLabel(label: addressCity, title: "City", details: "\(addresscity)")
            
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
    
    
    func configureLabel(label: UILabel,title: String, details: String) {
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
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.frame = view.bounds
        return view
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EmailTapButton(tapGestureRecognizer:)))
        label.addGestureRecognizer(tapGesture)
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    lazy var addressCity: UILabel = {
        
        let label = UILabel()
        
        return label
    }()
    
    
    lazy var address: UILabel = {
        
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TapAddressGeoButton(tapGestureRecognizer:)))
        label.addGestureRecognizer(tapGesture)
        label.isUserInteractionEnabled = true
        
        
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(WebTapButton(tapGestureRecognizer:)))
        label.addGestureRecognizer(tapGesture)
        label.isUserInteractionEnabled = true
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
    
    
    
    
    
    
    
    
    
    @objc private func EmailTapButton(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let sendMailViewController = SendMailViewController()
        self.present(sendMailViewController, animated: true, completion: nil)
        
    }
    
    @objc private func WebTapButton(tapGestureRecognizer: UITapGestureRecognizer) {
        
        
        
        guard let url = URL(string: "https://" + (user?.website)!) else {
            return
        }
        
        let safatiVC = SFSafariViewController(url: url)
        present(safatiVC, animated: true)
        
        
        
        
    }
    
    
    @objc private func TapAddressGeoButton(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let mapViewController = MapViewController()
        navigationController?.pushViewController(mapViewController, animated: true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.black
        
        
        setupScrollView()
        setupViews()
        
        
        
        
        
        
        
        
    }
    
    
    func setupScrollView(){
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor,constant: 20).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor,constant: 30).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        
        
        mainStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor,constant: 120).isActive = true
        mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        
    }
    
    
    func setupViews(){
        
        
        
        let topMainStacViewAnchor = mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110)
        let leftMainStacViewAnchor = mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        let rightMainStacViewAnchor = mainStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        NSLayoutConstraint.activate([topMainStacViewAnchor,leftMainStacViewAnchor,rightMainStacViewAnchor])
        
        
        mainStackView.addArrangedSubview(idLabel)
        idLabel.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        idLabel.topAnchor.constraint(equalTo: mainStackView.topAnchor).isActive = true
        idLabel.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        mainStackView.addArrangedSubview(NameLabel)
        NameLabel.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        NameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 10).isActive = true
        NameLabel.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        mainStackView.addArrangedSubview(phoneLabel)
        phoneLabel.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        phoneLabel.topAnchor.constraint(equalTo: NameLabel.bottomAnchor, constant: 10).isActive = true
        phoneLabel.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        
        mainStackView.addArrangedSubview(usernameLabel)
        usernameLabel.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10).isActive = true
        usernameLabel.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        mainStackView.addArrangedSubview(emailLabel)
        emailLabel.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        
        mainStackView.addArrangedSubview(address)
        address.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        address.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10).isActive = true
        address.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        mainStackView.addArrangedSubview(addressSuite)
        addressSuite.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        addressSuite.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 10).isActive = true
        addressSuite.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        mainStackView.addArrangedSubview(addressCity)
        addressCity.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        addressCity.topAnchor.constraint(equalTo: addressSuite.bottomAnchor, constant: 10).isActive = true
        addressCity.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        
        
        mainStackView.addArrangedSubview(addressZipCode)
        addressZipCode.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        addressZipCode.topAnchor.constraint(equalTo: addressCity.bottomAnchor, constant: 10).isActive = true
        addressZipCode.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        mainStackView.addArrangedSubview(addressGeo)
        addressGeo.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        addressGeo.topAnchor.constraint(equalTo: addressZipCode.bottomAnchor, constant: 5).isActive = true
        addressGeo.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        
        mainStackView.addArrangedSubview(addressGeolat)
        addressGeolat.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        addressGeolat.topAnchor.constraint(equalTo: addressGeo.bottomAnchor, constant: 0).isActive = true
        addressGeolat.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        mainStackView.addArrangedSubview(companyLabel)
        companyLabel.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        companyLabel.topAnchor.constraint(equalTo: addressGeolat.bottomAnchor, constant: 10).isActive = true
        companyLabel.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        mainStackView.addArrangedSubview(companycatchPhrase)
        companycatchPhrase.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        companycatchPhrase.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 10).isActive = true
        companycatchPhrase.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        mainStackView.addArrangedSubview(companybs)
        companybs.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        companybs.topAnchor.constraint(equalTo: companycatchPhrase.bottomAnchor, constant: 10).isActive = true
        companybs.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        mainStackView.addArrangedSubview(websiteLabel)
        websiteLabel.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor).isActive = true
        websiteLabel.topAnchor.constraint(equalTo: companybs.bottomAnchor, constant: 10).isActive = true
        websiteLabel.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 3/4).isActive = true
        
        
        
        
    }
    
    
}






