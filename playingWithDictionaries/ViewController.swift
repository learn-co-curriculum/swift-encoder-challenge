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
    
    var emojiCode: [String:String] = [:]
    var letterCode: [String:String] = [:]
    
    var letterDecodeCode: [String:String] = [:]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        populateKey()
        
        //extra credit
       self.letterDecodeCode = generateNewKey(offset: 1)

    }
    
    func populateKey(){
        emojiCode = [
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
        
        letterCode = [
            "a" : "b",
            "b" : "c",
            "c" : "d",
            "d" : "e",
            "e" : "f",
            "f" : "g",
            "g" : "h",
            "h" : "i",
            "i" : "j",
            "j" : "k",
            "k" : "l",
            "l" : "m",
            "m" : "n",
            "n" : "o",
            "o" : "p",
            "p" : "q",
            "q" : "r",
            "r" : "s",
            "s" : "t",
            "t" : "u",
            "u" : "v",
            "v" : "w",
            "w" : "x",
            "x" : "y",
            "y" : "z",
            "z" : "a"
        ]
        
    }

    @IBAction func convertBtnPressed(_ sender: AnyObject) {
        
        //get textfield value through self.textfield
        textLabel.text = self.textField.text
        
        var encodedMessage = ""
        
        var spyMessage = self.textField.text
        if let unwrappedSpyMessage = self.textField.text{
            var lowerCaseMessage = unwrappedSpyMessage.lowercased()
            for char in lowerCaseMessage.characters{
                var character = "\(char)"
                if let encodedChar = self.letterCode[character]{
                    encodedMessage += encodedChar
                }else{
                    encodedMessage += " \(character) "
                    
                }
            }
        }
        self.textLabel.text = encodedMessage
        
    }
    @IBAction func decodeBtnPressed(_ sender: AnyObject) {
        var decodeCode:[String:String] = [:]
        for (key,value) in letterCode{
            
            decodeCode["\(value)"] = "\(key)"
            
        }
        
        var decodedMessage = ""
        var spyMessage = self.textField.text
        if let unwrappedSpyMessage = self.textField.text{
            var lowerCaseMessage = unwrappedSpyMessage.lowercased()
            for char in lowerCaseMessage.characters{
                var character = "\(char)"
                if let encodedChar = decodeCode[character]{
                    decodedMessage += encodedChar
                }else{
                    decodedMessage += " \(character) "
                    
                }
            }
        }
        self.textLabel.text = decodedMessage
        
        
        
    }
    
    // Extra credit
    
    
    func generateNewKey(offset:Int) -> [String:String]{
        var dictionary:[String:String] = [:]
        var alphabet = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z".components(separatedBy: ",")
        for i in 0...alphabet.count-1{
            if i + offset > alphabet.count-1{
                dictionary[alphabet[i]] = alphabet[i-alphabet.count+offset]
            }else{
                dictionary["\(alphabet[i])"] = "\(alphabet[i+offset])"
            }
        }
        print(dictionary)
        return dictionary
    }
}

