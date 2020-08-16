//
//  WelcomeVC.swift
//  UIForm-iOS
//
//  Created by Dushan Saputhanthri on 28/5/20.
//  Copyright © 2020 RYRA Circuit. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    var _title: String?
    
    @IBOutlet weak var lblTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
    }
    
    func setData() {
        lblTitle.text = _title ?? "Unknown title"
    }

}
