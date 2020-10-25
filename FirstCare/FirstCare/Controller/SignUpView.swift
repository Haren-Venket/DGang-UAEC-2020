//
//  SignUpView.swift
//  FirstCare
//
//  Created by alireza azimi on 2020-10-25.
//

import UIKit
import CoreData
import Firebase
import MessageUI

class SignUpView: UIViewController, UITextFieldDelegate, UITextViewDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var personalHealthField: UITextField!
    @IBOutlet weak var healthInsuranceField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var contactField: UITextField!
    @IBOutlet weak var previousMedField: UITextView!
    let db = Firestore.firestore()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

       //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
       //tap.cancelsTouchesInView = false

       view.addGestureRecognizer(tap)
        nameField.delegate = self
        personalHealthField.delegate = self
        healthInsuranceField.delegate = self
        addressField.delegate = self
        contactField.delegate = self
        previousMedField.delegate = self
    }
    
    /*
     Handles sign up form submission
     */
    @IBAction func submitPressed(_ sender: UIButton) -> Void {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
//        let newEntity = NSManagedObject(entity: entity!, insertInto:context)
//        newEntity.setValue(personalHealthField.text, forKey: "uid")
//        do{
//            try context.save()
//        } catch{
//            print("failed saving")
//        }
        
        db.collection("medinfo").document(personalHealthField.text!).setData(["name": nameField.text,
                        "healthInsurance": healthInsuranceField.text,
                        "address": addressField.text,
                        "contact": contactField.text,
                        "prevMed":previousMedField.text ]){ (error) in
                        if let e = error {
                            print("There was an issue saving data to firestore, \(e)")
                        } else {
                            
                            print("success")
            
                        }
            
                    }
        
        sendEmail()
        

        if let navController = self.navigationController{
            navController.popViewController(animated: true)
                
            
        }
        
        
    }
    

    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
        
            mail.setToRecipients(["lmy19981226@gmail.com"])
            
            mail.setMessageBody("healthID:" + personalHealthField.text! + "<br/>Name:" + nameField.text!, isHTML: true)

            present(mail, animated: true)
        } else {
            print("unale to male")
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)

        return true
    }
    
    /* Updated for Swift 4 */
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    


}

