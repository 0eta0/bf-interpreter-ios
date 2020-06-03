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
        var result = "----------\n"
        result += try! b.run()
        result += "\n----------\n"
        result += "SUMMARY: program stopped after \(b.stepCounter) step(s) with output:\n"
        let s = b.output.map { String(format: "%02X", $0) }.joined(separator: " ")
        result += "    HEX: \(s)\n"
        result += "    STR: \(b.outputString())\n"
        resultText.text = result
    }
    
    @IBAction func help(_ sender: Any) {
        
        sourceText.text = "++++++++++[>+>+++>+++++++>++++++++++<<<<-]>>>>+.+++++++++++++++++.-----------------.+++++++++++++.+++++++."
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        sourceText.resignFirstResponder()
        return true
    }
}

