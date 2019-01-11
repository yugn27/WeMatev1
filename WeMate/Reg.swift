//
//  registration.swift
//  WeMate
//
//  Created by Vishitosh Vijay Kapale on 13/12/18.
//  Copyright © 2018 Yash Nayak. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class Reg: UIViewController {

    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var usernametxt: UITextField!
    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    
      var ref: DatabaseReference!
    @IBAction func reg(_ sender: UIButton) {
        
        if  ((nametxt.text?.isEmpty)!||(usernametxt.text?.isEmpty)!||(emailtxt.text?.isEmpty)!||(passwordtxt.text?.isEmpty)!)
        {
            
            print("Registration Failed")
            self.myalert("Failed", "Please enter all the field")
            
            
            
        }else{
            
            self.ref.child(nametxt.text!).child("Registration").setValue(["First Name" : nametxt.text,"Last Name" : usernametxt.text,"E-mail" : emailtxt.text,"Password" : passwordtxt.text] )
            
            Auth.auth().createUser(withEmail: emailtxt.text!, password: passwordtxt.text!, completion:{
                (user,error) in
                
                if error  != nil  {
                    print(error!)
                    
                    
                    
                }else {
                    
                    print("Registration Successful")
                    
                    
                    self.myalert("Success", "Registration Successful")
                    
                    
                    //    self.myalert("Success", "Register Successful")
                    // let regs2 = self.storyboard?.instantiateViewController(withIdentifier : "reg") as?reg
                    //self.navigationController?.pushViewController(regs2!, animated: true)
                }
                
                
            })
            
    }
        clear()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        //        let regView = self.storyboard?.instantiateViewController(withIdentifier: "Training") as? Training
        //      self.navigationController?.pushViewController(regView!, animated: true)
        // Do any additional setup after loading the view.
    }
    
    
    func clear()
        {
            nametxt.text=""
            usernametxt.text=""
            emailtxt.text=""
            passwordtxt.text=""
            
            
            
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        
        func myalert(_ mytitle:String, _ mymessage:String)
        {
            let alert = UIAlertController(title: mytitle, message: mymessage, preferredStyle: .actionSheet)
            let ok = UIAlertAction(title: "Done", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert,animated: true,completion: nil)
        }

}

