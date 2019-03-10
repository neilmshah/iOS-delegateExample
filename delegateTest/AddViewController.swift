//
//  AddViewController.swift
//  delegateTest
//
//  Created by Neil Shah on 2/2/19.
//  Copyright © 2019 Neil Shah. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate: class {
    func addToTaskList(controller: AddViewController, item: String)
}

class AddViewController: UIViewController {

    @IBOutlet weak var textArea: UITextView!
    weak var delegate: AddViewControllerDelegate?
    
    // If using userDefaults instead of delegate
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textArea.becomeFirstResponder()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(AddViewController.didTapDone(_:)))
        
    }
    
    @objc func didTapDone(_ sender: UIBarButtonItem) {
        if let textData = textArea.text {
            delegate?.addToTaskList(controller: self, item: textData)
            self.navigationController?.popViewController(animated: true)
            
            // If using user Defaults instead of delegate
            //defaults.set(textData, forKey: "AddItem")
           
        }
    }
}
