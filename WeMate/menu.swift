//
//  menu.swift
//  WeMate
//
//  Created by Vishitosh Vijay Kapale on 14/12/18.
//  Copyright © 2018 Yash Nayak. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class menu: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var count : Int = 0
    var ref: Int = 0
    let items = ["Add Budget","Create list","View List","Add Reminder","AboutApp","Log Out"]
    @IBOutlet weak var tbview: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = items[indexPath.row]
        return(cell)
        
    }
    

    @IBOutlet weak var menuview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

      menuview.isHidden = true
    }
  
    @IBAction func menubtn(_ sender: UIButton) {
        count = count+1
        if (count % 2 == 0)
        {
            menuview.isHidden = true
        }
        else
        {
            menuview.isHidden = false
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ref = indexPath.row
        
        if(ref == 0)
        {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "Appbudget") as? Appbudget
            self.navigationController?.pushViewController(VC!, animated: true)
            
        }
        if(ref == 1)
        {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "Createlist") as?
            Createlist
            self.navigationController?.pushViewController(VC!, animated: true)
            
        }
        if(ref == 2)
        {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "Viewlist") as?
            Viewlist
            self.navigationController?.pushViewController(VC!, animated: true)
            
        }
        if(ref == 3)
        {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "Addreminder") as?
            Addreminder
            self.navigationController?.pushViewController(VC!, animated: true)
            
        }
        if(ref == 4)
        {
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "AboutApp") as?
            Addreminder
            self.navigationController?.pushViewController(VC!, animated: true)
            
        }
        if(ref == 5)
        {
            try! Auth.auth().signOut()
            if self.storyboard != nil {
               //
                let VC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as?
                ViewController
                self.navigationController?.pushViewController(VC!, animated: true)
                
            }
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

}
