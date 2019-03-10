//
//  TaskViewController.swift
//  delegateTest
//
//  Created by Neil Shah on 2/2/19.
//  Copyright © 2019 Neil Shah. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var data = ["Apple", "Oranges", "Milk"]
    
    // Use User Defaults for persistent storage!
    // If using userDefaults 
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // If using userDefaults instead of delegate
        
//        if let newItem = defaults.string(forKey: "AddItem") {
//            if(!self.data.contains(newItem) && newItem != ""){
//                self.data.append(newItem)
//                self.tableView.reloadData()
//            }
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="addItem"){
            let vc = segue.destination as! AddViewController
            vc.delegate = self
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}

extension TaskViewController: AddViewControllerDelegate {
    func addToTaskList(controller: AddViewController, item: String) {
        self.data.append(item)
        self.tableView.reloadData()
    }
}


