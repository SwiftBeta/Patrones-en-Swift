//: [Previous](@previous)

import Foundation

/*:
 # Patrón de diseño: Decorator
 https://www.swiftbase.com/patron-de-diseno-swift-singleton/
*/

/*:
 ## Vamos a crear un sistema de alertas para que notifique al backend de guardia en caso de un error
*/

protocol Alertable {
    var name: String { get }
    func sendMessage() -> String
}

class AlertBase: Alertable {
    var name: String {
        "Base_Decorator"
    }
        
    func sendMessage() -> String {
        print("Send Alert message \(self.name)")
        return "Default"
    }
}

protocol AlertableType: Alertable {
    var base: Alertable { get }
}

// Decorators

class SMSDecorator: AlertableType {
    var name: String {
        "SMS_Decorator"
    }
    
    let base: Alertable
    
    init(base: Alertable) {
        self.base = base
    }
    
    func sendMessage() -> String {
        print("Send Alert message \(self.name)")
        return self.base.sendMessage()
    }
}

class SlackDecorator: AlertableType {
    var name: String {
        "Slack_Decorator"
    }
    
    let base: Alertable
    
    init(base: Alertable) {
        self.base = base
    }
    
    func sendMessage() -> String {
        print("Send Alert message \(self.name)")
        return self.base.sendMessage()
    }
}

let base = AlertBase()
let smsAlert = SMSDecorator(base: base)
let slackAlert = SlackDecorator(base: smsAlert)
slackAlert.sendMessage()


//: [Next](@next)


