//
//  Unicorn.swift
//  unicornUploader
//
//  Created by Deyan Aleksandrov on 31.03.18.
//  Copyright © 2018 dido. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Unicorn {
//    let imagePath: String
    let addedBy: String
    let seenAt: String

    // Standard init
    init(addedBy: String, seenAt: String) {
        //self.imagePath = imagePath
        self.addedBy = addedBy
        self.seenAt = seenAt
    }

    // Init for reading from Database snapshot
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        //imagePath = snapshotValue["imagePath"] as! String
        addedBy = snapshotValue["Paid By"] as! String
        seenAt = snapshotValue["Amount"] as! String
    }

    // Func converting model for easier writing to database
    func toAnyObject() -> Any {
        return [
            
            "Paid By": addedBy,
            "Amount": seenAt
        ]
    }
}
