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
    
    var searchSymbols: [String] = [":)", "new"]
    var putSymbols: [String] = ["!!", "old"]
    
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
        let entered = getInputText()
        printOutputText(input: entered)
    }
    
    func getInputText() -> String {
        let input = inputTextView.text
        return input!
    }
    
    func getTextOfUserInput() -> (searched: String, putted: String) {
        let searched = searchedString.text
        let putted = removingString.text
        
        searchSymbols.append(searched!)
        print("The array for seached symbols is: \(searchSymbols)")
        putSymbols.append(putted!)
        print("The array for putting symbols is: \(putSymbols)")
        
        return (searched!, putted!)
    }
    
    func printOutputText(input: String) {

        let userInput = getTextOfUserInput()
        _ = userInput.searched
        _ = userInput.putted

        outputTextView.text = inputTextWithChange(input: input, searching: searchSymbols, putting: putSymbols)
    }

    func inputTextWithChange(input: String, searching: [String], putting: [String]) -> String {
        var word: String = ""
        var final: String = ""
        
        let spaceValue = 32
        let u = UnicodeScalar(spaceValue)
        let charSpace = Character(u!)
        for index in (input.indices) {
            if (input[index] > charSpace) {
                word.append(input[index])
            } else {
                word = changeSymbol(newInput: word, searching: searchSymbols, putting: putSymbols)
                word.append(input[index])
                final.append(word)
                word = ""
            }
        }
        word = changeSymbol(newInput: word, searching: searchSymbols, putting: putSymbols)
        final.append(word)
        return final
    }
    
    func changeSymbol(newInput: String, searching: [String], putting: [String]) -> String {
        var changeInput = newInput
        
        for i in 0..<searchSymbols.count {
            if changeInput == searchSymbols[i] {
                changeInput = putSymbols[i]
            }
        }
        
        return changeInput
    }
    
}
