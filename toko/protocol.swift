//
//  protocol.swift
//  toko
//
//  Created by Pieter Yoshua Natanael on 12/03/25.
//

import SwiftUI
// Define a protocol
protocol Greetable {
    func greet() -> String
}

// Define a class that conforms to the protocol
class Person: Greetable {
    // Properties
    var name: String

    // Initializer
    init(name: String) {
        self.name = name
    }

    // Method to conform to the Greetable protocol
    func greet() -> String {
        return "Hello, my name is \(name)!"
    }
}

// Usage
let person = Person(name: "Alice")


#Preview {

}
