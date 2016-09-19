//
//  ViewController.swift
//  playingWithDictionaries
//
//  Created by Johann Kerr on 9/16/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var offset: UITextField!
    
    @IBOutlet weak var offsetMessage: UILabel!
    
    var code: [String:String] = [:]
    var encode: [String:String] = [:]
    var newCode: [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.textField.text = ""
        self.textLabel.text = ""
        
        code = [
            "a" : "🐶",
            "b" : "🐱",
            "c" : "🐭",
            "d" : "🐹",
            "e" : "🐰",
            "f" : "🐻",
            "g" : "🐼",
            "h" : "🐨",
            "i" : "🐯",
            "j" : "🦁",
            "k" : "🦁",
            "l" : "🐮",
            "m" : "🐽",
            "n" : "🐙",
            "o" : "🐸",
            "p" : "🐵",
            "q" : "🙈",
            "r" : "🙉",
            "s" : "🙊",
            "t" : "🐒",
            "u" : "🐔",
            "v" : "🐧",
            "w" : "🐦",
            "x" : "🐤",
            "y" : "🐣",
            "z" : "🐺"
        ]
        
        
 
    }
    
   
    @IBAction func convertBtnPressed(_ sender: AnyObject) {
        
        var encodedMessage = ""
        // Checking the offset value to choose the right code dictionary
        if( offset.text == ""){
            newCode = code
        }else{
            newCode = createCodeDictionary(number: Int(offset.text!)!)
        }
       
        if let unwrappedSpyMessage = self.textField.text{
            var lowerCaseMessage = unwrappedSpyMessage.lowercased()
            for char in lowerCaseMessage.characters{
                let character = "\(char)"
                if let encodedChar = self.newCode[character]{
                    encodedMessage += encodedChar
                }else{
                    encodedMessage += character
                    // This should be a space
                }
            }
        }
        (self.textLabel.text) = encodedMessage
        self.textField.text = ""
      
        
    }
    
    @IBAction func encoderBtPressed(_ sender: AnyObject) {
        var decodedMessage = ""
        // Creating the decode dictionary
        for (key,value) in newCode {
            self.encode[value] = key
        }
        
            if let unwrappedSpyMessage = self.textField.text{
            var lowerCaseMessage = unwrappedSpyMessage.lowercased()
            for char in lowerCaseMessage.characters{
                let character = "\(char)"
                if let decodedChar = self.encode[character]{
                    decodedMessage += decodedChar
                }else{
                    decodedMessage += character
                    // This should be a space
                }
            }
        }
        (self.textLabel.text) = decodedMessage
        self.textField.text = ""
    }
    // Create a new dictionary based on the value of the offset
    func createCodeDictionary( number : Int) ->[String:String]{
        var newDictionary: [String:String] = [:]
        var values: [String] = []
        var keys: [String] = []
        var offset = 0
        // Store the keys and the values of the deictionary in two arrays after sorting the dictionary 
        for (key,value) in code.sorted(by: { $0.0 < $1.0 }){
        keys.append(key)
        values.append(value)
        }
        if number <= values.count - 1{
            offset = number
        }else{
            offset = number % values.count
        }
    // removing numbers of elements - equals to the offset number- from the begining of the array and append them at the end
        for i in 0...offset - 1 {
            let newNumber = values[0]
            values.remove(at: 0)
            values.append(newNumber)
        }
        
        for (index,key) in keys.enumerated(){
            newDictionary[key] = values[index]
        }
        return newDictionary
    }
    

}

