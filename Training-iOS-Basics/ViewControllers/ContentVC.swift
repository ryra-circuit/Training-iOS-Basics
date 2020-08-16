//
//  ContentVC.swift
//  UIForm-iOS
//
//  Created by Dushan Saputhanthri on 7/6/20.
//  Copyright © 2020 RYRA Circuit. All rights reserved.
//

import UIKit

class ContentVC: UIViewController {

    @IBOutlet weak var tableView: UITableView! { didSet {
        tableView.dataSource = self
        tableView.delegate = self
    }}
    
    var contentList: [Content] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.manageDataList()
    }
    
    //MARK: Setup UI
    func setupUI() {
        tableView.tableFooterView = UIView()
    }
    
    //MARK: Manage data list
    func manageDataList() {
        addListData(completion: {
            self.tableView.reloadData()
        })
    }
    
    //MARK: Add list data
    func addListData(completion: () -> ()) {
        
        let content01 = Content(_id: 1, content: "UI Forms", summary: "Manage UI forms and interactions with form elements", target: "UIForm-iOS")
        
        let content02 = Content(_id: 2, content: "Navigations", summary: "Manage Forward & Backword navigations with/without data", target: "Navigations-iOS")
        
        self.contentList = [content01, content02]
        
        completion()
    }

}

extension ContentVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Course Content"
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 59
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell: ContentTVCell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as? ContentTVCell {
            
            let item = self.contentList[indexPath.row]
            cell.configureCell(with: item)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

