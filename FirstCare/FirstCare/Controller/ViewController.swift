//
//  ViewController.swift
//  FirstCare
//
//  Created by alireza azimi on 2020-10-25.
//

import UIKit
//import CoreData
import LocalAuthentication


class ViewController: UIViewController {
    var uid = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
//    func getData() -> String {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//
//        do{
//            let result = try context.fetch(request)
//            for data in result as! [NSManagedObject]{
//                uid = data.value(forKey: "uid") as! String
//            }
//        } catch{
//            print("something went wrong when fetching data")
//            return ""
//        }
//        return uid
//    }
    
    @IBAction func authenticateTapped(_ sender: Any) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        self!.performSegue(withIdentifier: "contactEmergency", sender: self)
                        guard let number = URL(string: "tel://" + "7806048907") else { return }
                        UIApplication.shared.open(number)

                    } else {
                        // error

                }
                }

            }
        } else {
            print("issue with auth")

        }
        

        
    }


}


