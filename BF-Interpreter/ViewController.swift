//
//  ViewController.swift
//  BF-Interpreter
//
//  Created by Eita Yamaguchi on 2020/06/02.
//  Copyright © 2020 Eita Yamaguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var sourceText: UITextView!
    @IBOutlet weak var resultText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sourceText.delegate = self
    }

    @IBAction func run(_ sender: Any) {
        
        sourceText.endEditing(true)
        let b = try! Brainfuck(sourceText.text)
        let result = try! b.run()
        resultText.text = result
    }
    
    @IBAction func help(_ sender: Any) {
        
        sourceText.text = "++++++++++[>+>+++>+++++++>++++++++++<<<<-]>>>-.>++++++++++++++++++.-----------------.+++++++++++++.+++++++."
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        sourceText.resignFirstResponder()
        return true
    }
}

