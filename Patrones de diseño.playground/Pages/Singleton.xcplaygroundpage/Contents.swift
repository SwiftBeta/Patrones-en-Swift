//: [Previous](@previous)

import Foundation

/*:
 # Patrón de diseño: Singleton
 https://www.swiftbase.com/patron-de-diseno-swift-singleton/
*/

let userDefaults = UserDefaults.standard
let userDefaultsTwo = UserDefaults.standard

/*:
 ## Database
*/

class Database {
    static let shared = Database()
    init() { }
    
    func save(message: String) {
        print("Message saved: \(message)")
        // Some logic
    }
    
    func fetch(message: String) -> String {
        print("Fetch message: \(message)")
        // Some logic
        return ""
    }
}

Database.shared.save(message: "Loop Infinito - Singleton")

//: [Next](@next)
