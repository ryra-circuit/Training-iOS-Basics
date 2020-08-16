//
//  Content.swift
//  Training-iOS
//
//  Created by Dushan Saputhanthri on 7/6/20.
//  Copyright © 2020 RYRA Circuit. All rights reserved.
//

import Foundation


struct Content {
    
    var _id: Int?
    var content: String?
    var summary: String?
    var target: String?
    
    init(_id: Int, content: String?, summary: String?, target: String?) {
        self._id = _id
        self.content = content
        self.summary = summary
        self.target = target
    }
    
}
