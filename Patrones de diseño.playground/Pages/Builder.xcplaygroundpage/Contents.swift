//: [Previous](@previous)

import Foundation
import UIKit

/*:
 # Patrón de diseño: Builder
 https://www.swiftbase.com/patron-de-diseno-swift-builder/
*/

/*:
 ## Ejemplo al crear un objeto Car
*/

enum CarSize {
    case small
    case medium
    case big
}

class Car {
    let numberOfDoors: Int
    let color: UIColor
    let size: CarSize
    
    init(numberOfDoors: Int, color: UIColor, size: CarSize) {
        self.numberOfDoors = numberOfDoors
        self.color = color
        self.size = size
    }
}

/*:
 ## Ejemplo usando una clase base que heredaremos de ella para crear coches a nuestra medida. Es decir, con las propiedades que queramos dar a nuestros tipos de coche
*/

class BaseCar {
    let numberOfDoors: Int
    let color: UIColor
    let size: CarSize
    
    init(numberOfDoors: Int, color: UIColor, size: CarSize) {
        self.numberOfDoors = numberOfDoors
        self.color = color
        self.size = size
    }
}

enum EngineSize {
    case small
    case medium
    case big
}

enum GearsType {
    case manual
    case automatic
}

class SportCar: BaseCar {
    let motor: EngineSize
    let gears: GearsType
    
    init(numberOfDoors: Int, color: UIColor, size: CarSize, motor: EngineSize, gears: GearsType) {
        self.motor = motor
        self.gears = gears
        super.init(numberOfDoors: numberOfDoors, color: color, size: size)
    }
}

/*:
 ## Ejemplo usando un inicializador con muchos parámetros en lugar de hacer herencia
*/

class CustomCar {
    var numberOfDoors: Int?
    var color: UIColor?
    var size: CarSize?
    var motor: EngineSize?
    var gears: GearsType?
    
    init(numberOfDoors: Int?, color: UIColor?, size: CarSize?, motor: EngineSize?, gears: GearsType?) {
        self.numberOfDoors = numberOfDoors
        self.color = color
        self.size = size
        self.motor = motor
        self.gears = gears
    }
    
    convenience init() {
        self.init(numberOfDoors: nil, color: nil, size: nil, motor: nil, gears: nil)
    }
}

let myCar = Car(numberOfDoors: 4, color: .black, size: .medium)
let myCustomCar = CustomCar(numberOfDoors: 4, color: .black, size: .medium, motor: .big, gears: .automatic)


/*:
 ## Ejemplo usando el patrón Builder
*/

class CarBuilder {
    private var car: CustomCar
    
    init() {
        self.car = CustomCar()
    }
    
    func addDoors(numberOfDoors: Int) -> CarBuilder {
        self.car.numberOfDoors = numberOfDoors
        return self
    }
    
    func addColor(color: UIColor) -> CarBuilder {
        self.car.color = color
        return self
    }
    
    func addSize(size: CarSize) -> CarBuilder {
        self.car.size = size
        return self
    }
    
    func addMotor(size: EngineSize) -> CarBuilder {
        self.car.motor = size
        return self
    }
    
    func build() -> CustomCar {
        return self.car
    }
}

let carBuilder = CarBuilder()
let myNewCar = CarBuilder().addDoors(numberOfDoors: 2)
                           .addSize(size: .big)
                           .addMotor(size: .big)
                           .build()


//: [Next](@next)
