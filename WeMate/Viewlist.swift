//
//  Viewlist.swift
//  WeMate
//
//  Created by Vishitosh Vijay Kapale on 14/12/18.
//  Copyright © 2018 Yash Nayak. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class Viewlist: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableviewview: UITableView!
    // Database  reference firebase
    var ref : DatabaseReference!
    var handle : DatabaseHandle!
    
    
    var unicorns = [Unicorn]() {
        didSet {
            tableviewview.reloadData()
        }
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableviewview.tableFooterView = UIView()
        
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        // create record
        ref = Database.database().reference()
        
        tableviewview.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ref.child("unicorns").observe(.value) { snapshot in
            var unicorns = [Unicorn]()
            for unicornSnapshot in snapshot.children {
                let unicorn = Unicorn(snapshot: unicornSnapshot as! DataSnapshot)
                unicorns.append(unicorn)
            }
            self.unicorns = unicorns
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


extension Viewlist {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unicorns.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "unicornTableViewCell", for: indexPath) as! UnicornTableViewCell
        cell.unicorn = unicorns[indexPath.row]
        return cell
    }
}
