//
//  ViewController.swift
//  MultipleTextWithSmiles
//
//  Created by Kalin Karev on 7/12/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var outputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func btnChanged(_ sender: UIButton) {
        print("The change button was pressed")
        
        changedInputText()
    }
    
    func changedInputText() {
        var inputString = inputTextView.text
        
//        var inputString = """
//        He is :)
//        :) she
//        """
        
        inputString?.append(" ")
//        print("The user has inputted: \(String(describing: inputString))")
        
        var word: String = ""
//        print("The String named word is: \(word)")
        var final: String = ""
//        print("The String named final is: \(final)")
        
        let spaceValue = 32
        let u = UnicodeScalar(spaceValue)
        let charSpace = Character(u!)
//        print("The character is: \(charSpace)")
        
        let changeSymbol = ":)"
        
        for index in (inputString?.indices)! {
//            print("The characters in the input string is: \(inputString![index])")
            if (inputString![index] > charSpace) {
//                print("Have found a split character")
                word.append(inputString![index])
            } else {
//                print("The word is: \(word)")
                if (word == changeSymbol) {
                    word = "!!"
                }
                word.append(inputString![index])
                final.append(word)
                word = ""
            }
        }
        print("The final is: \(final)")
    }
}
