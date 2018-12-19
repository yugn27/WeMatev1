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


class Appbudget: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //outlets
    //text fields
    @IBOutlet weak var BudgetNameOutlet: UITextField!
    @IBOutlet weak var PaidByOutlet: UITextField!
    @IBOutlet weak var DateOutlet: UITextField!
    @IBOutlet weak var AmountOutlet: UITextField!
    // tableview
    @IBOutlet weak var tableshowoutlet: UITableView!
    
    // Database  reference firebase
    var ref : DatabaseReference!
    var handle : DatabaseHandle!
    
    //let items = ["Umang Lotiya","Vishitosh Kapale","Vaibhav Jaiswal","Yash Nayak"]
    var items = ["No Items"]
    
    //func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //    return items.count
    //}
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    //    cell.textLabel?.text = items[indexPath.row]
     //   return(cell)
    //}
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PostCell {
            cell.configureCell(post: post)
            return cell
        } else {
            return PostCell()
        }
    }
    
    //post
    var posts = [Post]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableshowoutlet.tableFooterView = UIView()
        
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        // create record
        ref = Database.database().reference()
        
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
        
        
        /*
        //read data from firebase
        handle = ref.child("GROUP").child("Registration").observe(.childAdded, with: { (data) in
            let name : String = (data.value as? String)!
            print(name)
            self.items = [name]
        })
        */
        
        
        DatabaseManager.shared.REF_POSTS.observe(DataEventType.value, with: { (snapshot) in
            print(snapshot.value!)
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if let postDict = snap.value as? [String: AnyObject] {
                        let id = snap.key
                        let post = Post(postID: id, postData: postDict)
                        print(post)
                        self.posts.append(post)
                    }
                }
            }
            self.tableshowoutlet.reloadData()
        })
    }
    
    
    
    
    
   
    @IBAction func AddBtn(_ sender: Any) {
        //datebase storing
        self.ref.child(BudgetNameOutlet.text!).child("Budget").setValue(["Budget Name":BudgetNameOutlet.text,"Paid By":PaidByOutlet.text,"Date":DateOutlet.text,"Amount":AmountOutlet.text])
        myalert("Sucesss", "Budget Added Sucessfully")
        print("sucessffully")
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
