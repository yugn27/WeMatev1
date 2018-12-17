//
//  CreateGroup.swift
//  WeMate
//
//  Created by Yash Nayak on 17/12/18.
//  Copyright © 2018 Yash Nayak. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class CreateGroup: UIViewController {

    @IBOutlet weak var nameofmemberoutlet: UITextField!
    @IBOutlet weak var numberofmembersoutlet: UITextField!
   
    var nomembers: Int = 0
    var counter: Int = 0
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        //FirebaseApp.configure()
        ref =  Database.database().reference()
        

        
    }
    
    @IBAction func addmember(_ sender: UIButton) {
        nomembers = Int(numberofmembersoutlet.text!) ?? 0
        if(counter < nomembers)
        {
            self.ref.child("Your Group1").child("\(counter)").setValue(["Member\(counter)" : nameofmemberoutlet.text!])
            //self.ref.child("users").child(Personnr.text!).setValue(data)
            counter = counter+1
            clear()
            if(counter == nomembers)
            {
                myalert("Sucess", "All Members are added")
            }
            myalert("Member Added Sucessfully", "Add another member")
        }
        if(counter >= nomembers)
        {
             myalert("Limit Exceeded", "All members are added")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func creategroup(_ sender: UIButton) {
        if(counter<nomembers)
        {
            myalert("Error", "All Members are not added in group")
            
        }
        else
        {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "menu") as?
            menu
            self.navigationController?.pushViewController(VC!, animated: true)
            myalert("Sucess", "Group Created Sucessfully")
            clear()
            
        }
        
        
    }
    
    func myalert(_ mytitle:String, _ mymessage:String)
    {
        let alert = UIAlertController(title: mytitle, message: mymessage, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert,animated: true,completion: nil)
    }
    func clear()
    {
        nameofmemberoutlet.text = ""
       
        
        
    }

}
