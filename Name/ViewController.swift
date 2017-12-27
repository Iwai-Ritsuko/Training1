//
//  ViewController.swift
//  Name
//
//  Created by Ritsuko Iwai on 2017/12/25.
//  Copyright © 2017年 Ritsuko Iwai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareContents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func prepareContents() {
        guard let name = UserDefaults.standard.string(forKey: "Name") else {
            return
        }
        nameField.text = name
    }

    @IBAction func saveButtonDidTapped(_ sender: UIButton) {
        guard let name = nameField.text else {
            return
        }
        UserDefaults.standard.set(name, forKey: "Name")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if nameField.isFirstResponder {
            nameField.resignFirstResponder()
        }
    }

}
