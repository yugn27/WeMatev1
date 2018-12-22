//
//  Login.swift
//  WeMate
//
//  Created by Vishitosh Vijay Kapale on 13/12/18.
//  Copyright © 2018 Yash Nayak. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Login: UIViewController {

    @IBOutlet weak var emaitxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    @IBAction func loginbtn(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: emaitxt.text!, password: passwordtxt.text!) { user, error in
            if error == nil && user != nil {
                self.dismiss(animated: false, completion: nil)
                print("Successful")
   
               
                let regView = self.storyboard?.instantiateViewController(withIdentifier: "menu") as? menu
                self.navigationController?.pushViewController(regView!, animated: true)
                self.myalert("Success", "Login Successful")
              
                
                
            } else {
                print("Error logging in: \(error!.localizedDescription)")
                self.myalert("Failed", "Incorrect Email ID or Password")
            }
        }
        
       
         self.clear()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func clear()
    {
        emaitxt.text = ""
        passwordtxt.text = ""
    }
    
    func myalert(_ mytitle:String, _ mymessage:String)
    {
        let alert = UIAlertController(title: mytitle, message: mymessage, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert,animated: true,completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
