//
//  CreateGroup2ViewController.swift
//  WeMate
//
//  Created by Yash Nayak on 03/01/19.
//  Copyright © 2019 Yash Nayak. All rights reserved.
//

import UIKit
import Firebase

class CreateGroup2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //defining firebase reference var
    var refArtists: DatabaseReference!
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    
    @IBOutlet weak var tableViewArtists: UITableView!
    
    //list to store all the artist
    var artistList = [ArtistModel]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return artistList.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //creating a cell using the custom class
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        //the artist object
        let artist: ArtistModel
        
        //getting the artist of selected position
        artist = artistList[indexPath.row]
        
        //adding values to labels
        cell.labelName.text = artist.name
        //cell.labelGenre.text = artist.genre
        
        //returning cell
        return cell
    }
    
    @IBAction func buttonAddArtist(_ sender: UIButton) {
        addArtist()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        
        //FirebaseApp.configure()
        
        refArtists = Database.database().reference().child("artists");
        
        //observing the data changes
        refArtists.observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.artistList.removeAll()
                
                //iterating through all the values
                for artists in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let artistObject = artists.value as? [String: AnyObject]
                    let artistName  = artistObject?["UName"]
                    let artistId  = artistObject?["id"]
                
                    
                    //creating artist object with model and fetched values
                    let artist = ArtistModel(id: artistId as! String?, name: artistName as! String?)
                    
                    //appending it to list
                    self.artistList.append(artist)
                }
                
                //reloading the tableview
                self.tableViewArtists.reloadData()
            }
        })
        
    }
    
    //this function will be called when a row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //getting the selected artist
        let artist  = artistList[indexPath.row]
        
        //building an alert
        let alertController = UIAlertController(title: artist.name, message: "Give new values to update ", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            //getting artist id
            let id = artist.id
            
            //getting new values
            let name = alertController.textFields?[0].text
            //let genre = alertController.textFields?[1].text
            
            //calling the update method to update artist
            self.updateArtist(id: id!, name: name!)
        }
        
        //the cancel action deleting the artist
        let cancelAction = UIAlertAction(title: "Delete", style: .cancel) { (_) in
            //deleting artist
            self.deleteArtist(id: artist.id!)
        }
        
        //adding two textfields to alert
        alertController.addTextField { (textField) in
            textField.text = artist.name
        }
       
        
        //adding action
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //presenting dialog
        present(alertController, animated: true, completion: nil)
    }
    
    
    func deleteArtist(id:String){
        refArtists.child(id).setValue(nil)
        
        //displaying message
        labelMessage.text = "User Deleted"
    }
    
    func updateArtist(id:String, name:String){
        //creating artist with the new given values
        let artist = ["id":id,
                      "UName": name]
        
        //updating the artist using the key of the artist
        refArtists.child(id).setValue(artist)
        
        //displaying message
        labelMessage.text = "User Updated"
    }
    
    func addArtist(){
        //generating a new key inside artists node
        //and also getting the generated key
        let key = refArtists.childByAutoId().key
        
        //creating artist with the given values
        let artist = ["id":key,
                      "UName": textFieldName.text! as String]
        
        //adding the artist inside the generated unique key
        refArtists.child(key!).setValue(artist)
        
        //displaying message
        labelMessage.text = "User Added"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

