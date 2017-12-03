//
//  expandableHeaderView.swift
//  myExpandableTableView
//
//  Created by ENYUHUANG on 2017/12/3.
//  Copyright © 2017年 ENYUHUANG. All rights reserved.
//

import UIKit

protocol expandableHeaderViewDelegate {
    func toggleSection(header: expandableHeaderView, section: Int)
}

class expandableHeaderView: UITableViewHeaderFooterView {

    var delegate: expandableHeaderViewDelegate?
    var section: Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickSecionHeader)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    @objc func clickSecionHeader(gesture: UITapGestureRecognizer){
        let cell = gesture.view as! expandableHeaderView
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func customInit(title: String, section: Int, delegate: expandableHeaderViewDelegate){
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.textColor = UIColor.black
        self.contentView.backgroundColor = UIColor.lightGray
    }
}
