//
//  ViewController.swift
//  myExpandableTableView
//
//  Created by ENYUHUANG on 2017/12/3.
//  Copyright © 2017年 ENYUHUANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sections = [
        section(sectionClass: "Favorites",
                name: ["Bob", "Amy"],
                expanded: false),
        section(sectionClass: "Groups",
                name: ["group_1", "group_2", "group_3"],
                expanded: false),
        section(sectionClass: "Friends",
                name: ["Bob", "Amy", "Jeff", "Candy", "RuRu", "Brad"],
                expanded: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        // selecion 種類個數
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 某種類中 物件個數
        return sections[section].name.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        // Section的header的高度
        let height = self.view.frame.height / 10
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // Section中 row的高度
        // 若expanded為false，row高度為0
        let height = self.view.frame.height / 10
        if (sections[indexPath.section].expanded) {
            return height
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        // 最後一個row與下一個section的間距
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // 宣告每一個section header的view
        let header = expandableHeaderView()
        header.customInit(title: sections[section].sectionClass, section: section, delegate: self)
        return header
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 宣告每一個row
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = sections[indexPath.section].name[indexPath.row]
        return cell
    }
}

extension ViewController: expandableHeaderViewDelegate {
    
    func toggleSection(header: expandableHeaderView, section: Int) {
        
        // 點擊section header後會發生的事情
        sections[section].expanded = !(sections[section].expanded)
        
        tableView.beginUpdates()
        for i in 0 ..< sections[section].name.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
    
    
}
