//
//  ViewController.swift
//  MultipleTextWithSmiles
//
//  Created by Kalin Karev on 7/12/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    // MARK: Properties
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var searchedString: UITextField!
    @IBOutlet weak var removingString: UITextField!
    
    var searchSymbols: [String] = ["1", "2"]
    var putSymbols: [String] = ["X"]
    
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
        guard let entered = inputTextView.text else {
            fatalError("You have inputted something wrong")
        }
        
        printOutputText(input: entered)
    }
    
    func printOutputText(input: String) {
        
        guard let searched = searchedString.text else {
            fatalError("Error with inputting a string for change")
        }
        
        guard let putted = removingString.text else {
            fatalError("Error with inputting a string for putting")
        }
        
        searchSymbols.append(searched)
        putSymbols.append(putted)
        
//        outputTextView.text = input.inputTextWithChange(searching: searchSymbols, putting: putSymbols)
        outputTextView.text = input.changeInput(searching: searchSymbols, putting: putSymbols)
    }
}

extension String {
    func changeInput(searching: [String], putting: [String]) -> String {
        var word: String = ""
        var final: String = ""
        
        let spaceValue = 32
        guard let u = UnicodeScalar(spaceValue) else {
            fatalError("Error with the space character")
        }
        let charSpace = Character(u)
        
        for index in (self.indices) {
            if (self[index] > charSpace) {
                word.append(self[index])
            } else {
                word = changeSymbol(newInput: word, searching: searching, putting: putting)
                word.append(self[index])
                final.append(word)
                word = ""
            }
        }
        word = changeSymbol(newInput: word, searching: searching, putting: putting)
        final.append(word)
        return final
    }
    
    func changeSymbol( newInput: String, searching: [String], putting: [String]) -> String {
        var changeInput = newInput

        for i in 0..<searching.count {
            if changeInput == searching[i] {
                changeInput = putting[i]
            }
        }
        
        return changeInput
    }
}
