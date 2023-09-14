//
//  TableViewController.swift
//  CS7323_SinkOrSwim
//
//  Created by Hans Soland on 9/11/23.
//

import UIKit

class TableViewController: UITableViewController, PopUpModalDelegate {
    
    func dismissModal() {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PopUpModalViewController.present(
            initialView: self,
            delegate: self)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 3;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "CollectionViewRow", for: indexPath)
        case 1:
            return tableView.dequeueReusableCell(withIdentifier: "ImageViewDemoRow", for: indexPath)
        default:
            return tableView.dequeueReusableCell(withIdentifier: "RandomSwitchesRow", for: indexPath)
        }
    }
    
}
