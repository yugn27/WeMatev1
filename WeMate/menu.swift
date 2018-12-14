//
//  menu.swift
//  WeMate
//
//  Created by Vishitosh Vijay Kapale on 14/12/18.
//  Copyright © 2018 Yash Nayak. All rights reserved.
//

import UIKit

class menu: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var count : Int = 0
    let items = ["App Budget","Create list","View List","Add Reminder"]
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

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
