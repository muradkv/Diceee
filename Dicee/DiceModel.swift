//
//  DiceModel.swift
//  Dicee
//
//  Created by murad on 14.09.2024.
//

import UIKit

struct DiceModel {
    static private let listOfDice = [
        UIImage(named: "DiceOne"),
        UIImage(named: "DiceTwo"),
        UIImage(named: "DiceThree"),
        UIImage(named: "DiceFour"),
        UIImage(named: "DiceFive"),
        UIImage(named: "DiceSix"),
    ]
    
    static func randomDiceImage() -> UIImage? {
        if let image = listOfDice.randomElement() {
            return image
        } else {
            return nil
        }
    }
}
