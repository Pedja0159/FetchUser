//
//  SendMailViewController.swift
//  FetchUser
//
//  Created by Predrag on 12/12/2020.
//  Copyright © 2020 pejo015. All rights reserved.
//

import UIKit
import MessageUI



class SendMailViewController: UIViewController, MFMailComposeViewControllerDelegate{
    
    var user: UserElement?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendEmail()
        showErrorMessage()
        
        
    }
    
    
    
    
    
    func showErrorMessage() {
        let alertMessage = UIAlertController(title: "could not sent email", message: "check if your device have email support!", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title:"Okay", style: UIAlertAction.Style.default, handler: nil)
        alertMessage.addAction(action)
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["email_address@example.com"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            print("This device is not configured to send email. Please set up an email account.")
            
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
        
        
        
    }
    
    
    
}
