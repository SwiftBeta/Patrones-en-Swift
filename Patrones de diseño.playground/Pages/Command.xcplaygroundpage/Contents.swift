//: [Previous](@previous)
import Foundation

/*:
 # Patrón de diseño: Command
 https://www.swiftbase.com/patron-de-diseno-swift-command/
*/

protocol API {
    func send(message: String)
}

class APIClient: API {
    init() {}
    
    func send(message: String) {
        print("Send XMPP: \(message)")
    }
}

protocol Command {
    func execute()
}

class SendMessageCommand: Command {
    private let message: String
    private let apiClient: API
    
    init(message: String, apiClient: API = APIClient()) {
        self.apiClient = apiClient
        self.message = message
    }
    
    func execute() {
        apiClient.send(message: message)
    }
}

let sendMesageCommand = SendMessageCommand(message: "Hello! Loop Infinito")
sendMesageCommand.execute()

//: [Next](@next)
