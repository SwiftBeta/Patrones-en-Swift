import Foundation

/*:
 # Patrón de diseño: Adapter
 https://www.swiftbase.com/patron-de-diseno-swift-adapter/
*/

/*:
 ## Suponemos que este código viene de un SDK de terceros. En este caso vendría del SDK de Twitter. No lo podemos modificar (o no deberíamos)
*/

struct TwitterUser {
    let name: String
    let email: String
    let token: String
}

class TwitterSDK {
    
    func authenticate(email: String,
                      password: String,
                      completion: (TwitterUser?, Error?) -> ()) {
        let twitterUser = TwitterUser(name: "Loop Infinito", email: "loop@email.com", token: "my-token")
        completion(twitterUser, nil)
    }
}

protocol AuthService {
    func authenticate(email: String,
                      password: String,
                      onSuccess: (User) -> (),
                      onFailure: (Error?) -> ())
}

struct User {
    let name: String
    let email: String
    let token: String
}

class TwitterSDKAdapter: AuthService {
    private let twitterSDK = TwitterSDK()
    
    func authenticate(email: String,
                      password: String,
                      onSuccess: (User) -> (),
                      onFailure: (Error?) -> ()) {
        twitterSDK.authenticate(email: email, password: password) { (twitterUser, error) in
            guard let twitterUser = twitterUser else {
                onFailure(error)
                return
            }
            
            onSuccess(.init(name: twitterUser.name,
                            email: twitterUser.email,
                            token: twitterUser.token)
            )
        }
    }
}
