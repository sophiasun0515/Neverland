//
//  Characterlist.swift
//  Neverland
//
//  Created by Apple on 1/27/18.
//  Copyright © 2018 League of Sophistication. All rights reserved.
//

import Foundation

final class Singleton {
    
    private init() { }
    
    static let shared = Singleton()
    
    static func resetBubbles() {
        Singleton.shared.bubbles = [["Iron Man", "Ivanka Trump", "Donald Trump", "Thomas Barrow", "Mark Zuckerberg", "Phantom", "Loki", "Elon Musk"], ["Iron Man", "Hulk", "Captain America", "Black Widow", "Thor", "Loki", "Pepper", "Jarvis"], ["Donald Trump", "Rex Tillerson", "Deniel Coats", "James Mattis", "Ivanka Trump", "Steven Mnuchin", "Michael Pence", "John Kelly"], ["Lady Mary", "Grandmama Violet", "Lady Sybil", "Thomas Barrow", "Robert Crawley", "Lady Edith", "Mr. Carson", "John Bates"], ["Mark Zuckerberg", "Bill Gates", "Steve Jobs", "Jeff Bezos", "Brian Chesky", "Larry Page", "Jimmy Wales", "Elon Musk"], ["Phantom", "Chrinstine", "Raoul", "Madame Giry", "Meg Giry", "M. Moncharmin", "Phantom", "Phantom"]]
    }

    
    var bubbles = [["Iron Man", "Ivanka Trump", "Donald Trump", "Thomas Barrow", "Mark Zuckerberg", "Phantom", "Loki", "Elon Musk"], ["Iron Man", "Hulk", "Captain America", "Black Widow", "Thor", "Loki", "Pepper", "Jarvis"], ["Donald Trump", "Rex Tillerson", "Deniel Coats", "James Mattis", "Ivanka Trump", "Steven Mnuchin", "Michael Pence", "John Kelly"], ["Lady Mary", "Grandmama Violet", "Lady Sybil", "Thomas Barrow", "Robert Crawley", "Lady Edith", "Mr. Carson", "John Bates"], ["Mark Zuckerberg", "Bill Gates", "Steve Jobs", "Jeff Bezos", "Brian Chesky", "Larry Page", "Jimmy Wales", "Elon Musk"], ["Phantom", "Chrinstine", "Raoul", "Madame Giry", "Meg Giry", "M. Moncharmin", "Phantom", "Phantom"]]
    
    var popularBubbles = ["Iron Man", "Ivanka Trump", "Donald Trump", "Thomas Barrow", "Mark Zuckerberg", "Phantom", "Loki", "Elon Musk"]
    var avengerBubbles = ["Iron Man", "Hulk", "Captain America", "Black Widow", "Thor", "Loki", "Pepper", "Jarvis"]
    var whBubbles = ["Donald Trump", "Rex Tillerson", "Deniel Coats", "James Mattis", "Ivanka Trump", "Steven Mnuchin", "Michael Pence", "John Kelly"]
    var downtonBubbles = ["Lady Mary", "Grandmama Violet", "Lady Sybil", "Thomas Barrow", "Robert Crawley", "Lady Edith", "Mr. Carson", "John Bates"]
    var TechLeadBubbles = ["Mark Zuckerberg", "Bill Gates", "Steve Jobs", "Jeff Bezos", "Brian Chesky", "Larry Page", "Jimmy Wales", "Elon Musk"]
    var POTOBubbles = ["Phantom", "Chrinstine", "Raoul", "Madame Giry", "Meg Giry", "M. Moncharmin", "Phantom", "Phantom"]
    
}
