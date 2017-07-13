//
//  Contact.swift
//  FirstApp
//
//  Created by Muhammed Thasneem on 12/07/17.
//  Copyright © 2017 Muhammed Thasneem. All rights reserved.
//

import UIKit

class Contact {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var number: String
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, number: String) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.number = number
        
    }

}
