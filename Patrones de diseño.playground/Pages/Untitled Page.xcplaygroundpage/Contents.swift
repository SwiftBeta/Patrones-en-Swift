//: [Previous](@previous)
import Foundation

/*:
 # Patrón de diseño: Delegación
 https://www.swiftbase.com/patron-de-diseno-swift-delegacion/
*/

class ProfileView {
    var presenter: ProfilePresenter?
    
    func addNewUserName() {
        presenter?.saveUser(name: "SwiftBeta")
    }
}

extension ProfileView: ProfileUI {
    func didUpdateName() {
        print("Show banner")
    }
}

protocol ProfileUI: AnyObject {
    func didUpdateName()
}

class ProfilePresenter {
    weak var ui: ProfileUI?
    
    func saveUser(name: String) {
        print("New \(name) name saved...")
        ui?.didUpdateName()
    }
}

let presenter = ProfilePresenter()
let ui = ProfileView()
ui.presenter = presenter
presenter.ui = ui

ui.addNewUserName()

//: [Next](@next)
