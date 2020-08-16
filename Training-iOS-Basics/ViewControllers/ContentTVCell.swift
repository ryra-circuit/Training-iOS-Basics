//
//  ContentTVCell.swift
//  Training-iOS
//
//  Created by Dushan Saputhanthri on 7/6/20.
//  Copyright © 2020 RYRA Circuit. All rights reserved.
//

import UIKit

class ContentTVCell: UITableViewCell {

    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblSummary: UILabel!
    @IBOutlet weak var lblTarget: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: Configure cell with model
    func configureCell(with model: Content) {
        
        lblNumber.text = "\(model._id ?? 0)"
        lblContent.text = model.content ?? ""
        lblSummary.text = model.summary ?? ""
        lblTarget.text = model.target ?? ""
    }

}
