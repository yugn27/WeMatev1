//
//  PostCell.swift
//  FirebaseTest
//
//  Created by Константин on 19.10.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var captionText: UITextView!
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(post: Post) {
        self.post = post
        
        self.captionText.text = post.caption
    }

}
