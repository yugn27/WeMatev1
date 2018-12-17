//
//  Appbudget.swift
//  WeMate
//
//  Created by Vishitosh Vijay Kapale on 14/12/18.
//  Copyright © 2018 Yash Nayak. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Appbudget: UIViewController {

    //outlets
    // Database  reference firebase
    var ref : DatabaseReference!
    var handle : DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        //FirebaseApp.configure()
        //ref =  Database.database().reference()
        
        // Do any additional setup after loading the view.
        
       /*
       // let ref = Database.database().reference(fromURL: "DATABASE_URl")
        let ref = Database.database().reference(withPath: "umang")
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() { return }
            
            //print(snapshot) // Its print all values including Snap (User)
            
            //print(snapshot.value!)
            
            let username = snapshot.childSnapshot(forPath: "E-mail").value
            print(username!)
            
            //if let email = snapshot.value!["email"] as? String {
            //    print(email)
            //}
            
            
        */
            
        // create record
        ref = Database.database().reference()
        
        
        
        //read data from firebase
        handle = ref.child("umang").ref.child("Registration").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            print(name)
        })
        
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
