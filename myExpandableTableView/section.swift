//
//  section.swift
//  myExpandableTableView
//
//  Created by ENYUHUANG on 2017/12/3.
//  Copyright © 2017年 ENYUHUANG. All rights reserved.
//

import Foundation

struct section {
    var sectionClass: String!
    var name: [String]!
    var expanded: Bool!
    
    init(sectionClass: String, name: [String], expanded: Bool) {
        self.sectionClass = sectionClass
        self.name = name
        self.expanded = expanded
    }
}
