//
//  SignUpVC+Services.swift
//  Training-iOS
//
//  Created by Dushan Saputhanthri on 1/6/20.
//  Copyright © 2020 RYRA Circuit. All rights reserved.
//

import UIKit

extension SignUpVC {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfEmail {
            tfLocation.becomeFirstResponder()
        }
            
        else if textField == tfLocation {
            tfLocation.resignFirstResponder()
        }
        
        return true
    }
}
