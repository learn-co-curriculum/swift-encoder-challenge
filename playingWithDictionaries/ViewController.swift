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
    
    @IBOutlet weak var offsetTextField: UITextField!

    var code: [String:String] = [:]
    var decodeDictionary = [String:String]()
    var offsetDictionary = [String:String]()
    var lettersArray = [String]()
    var offsetBtnPressed = "X"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
            "z" : "🐺"  ]
        
        //Create letters Array to store the alphabets A-Z to use.
        lettersArray = Array(code.keys).sorted(by: <)
        print(lettersArray)
        }

    @IBAction func convertBtnPressed(_ sender: AnyObject) {
        //get textfield value through self.textfield
        textLabel.text = self.textField.text
        offsetBtnPressed = ""
        encodeSpyMessage(dictionary: code)
//        print(self.textField.text)
    }
    
    @IBAction func decodeButton(_ sender: AnyObject) {
       if offsetBtnPressed == "X"{
        decodeSpyMessage(dictionary: offsetDictionary)
       }else{
        decodeSpyMessage(dictionary: code)
        }}
    

    @IBAction func OffsetPressedBtn(_ sender: AnyObject) {
        if (Int(offsetTextField.text!) != nil){
            let offset = Int(offsetTextField.text!)
            encodewithOffset(offset: offset!)
            encodeSpyMessage(dictionary: offsetDictionary)
        }}

//Encoding using offset index:
//   Create 2 Array slices. 1st Array slice to get the values that starts from index 0 to the offset  -1. Then create a 2nd array slice to get the values of index 5 to last index of the array. 
//    Example: (User input) offset = 5.
//    sliceArray1 = "a,b,c,d,e"
//    sliceArray2 = "f,g,h,i,j,k...z"
//    offsetArray = "f,g,h,i,j,k...z,a,b,c,d,e"
    
    //Create a dictionary by combining letters Array values and the offset Array.
    //Result: Offset Dictionary = ["a:f", "b:g", "c:h", "d:i", "e:j"...z:e"]. Use this to encrypt your message!
    
    func encodewithOffset(offset: Int){
        var offsetArray = [String]()
        let lettersArrayCtr = lettersArray.count - 1
        let offsetCtr = offset - 1

        //Create sliced arrays for offset and remaining letters from lettersArray
        //ArraySlice returns a struct data type so you need to cast it into an Array to store the values in a new array.
        //let sliceArray1: ArraySlice<String> = lettersArray[0...offsetCtr]
        //let sliceArray2: ArraySlice<String> = lettersArray[offset...lettersArrayCtr]
        //sprinkled with coding sugar from Johann.. (sprinkle, sprinkle...)
        let sliceArray1 = lettersArray[0...offsetCtr]
        let sliceArray2 = lettersArray[offset...lettersArrayCtr]
        
        offsetArray = Array(sliceArray2) + Array(sliceArray1)
        
        for (index, letter) in lettersArray.enumerated(){
            if index <= lettersArrayCtr{
               offsetDictionary.updateValue(offsetArray[index], forKey: letter)
            }}}

    func encodeSpyMessage(dictionary: [String:String]){
        var encodedMessage = String()
        if let unwrappedSpyMessage = self.textField.text{
            var lowerCaseMessage = unwrappedSpyMessage.lowercased()
            for char in lowerCaseMessage.characters{
                let character = "\(char)"
                if let encodedChar = dictionary[character]{
                    encodedMessage += encodedChar
                }else{
                    encodedMessage += character
                    // This should be a space
        }}}
        print(encodedMessage)
        textLabel.text = encodedMessage
    }

    func decodeSpyMessage(dictionary: [String:String]){
        var decodedMessage = String()
        //Create decode dictionary
        if let unwrappedSpyMessage = self.textField.text{
            var lowerCaseMessage = unwrappedSpyMessage.lowercased()
            for char in lowerCaseMessage.characters{
                let character = "\(char)"
                if let decodedChar = decodeDictionary[character]{
                    decodedMessage += decodedChar
                }else{
                    decodedMessage += character
                    // This should be a space
        }}}
        print(decodedMessage)
        textLabel.text = decodedMessage
    }}

