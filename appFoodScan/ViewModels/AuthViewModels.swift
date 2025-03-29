//
//  AuthViewModels.swift
//  appFoodScan
//
//  Created by Carlos López on 28/03/25.
//

//import AWSMobileClient
/*import Combine

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var username: String = ""
    
    init() {
        AWSMobileClient.default().initialize { state, error in
            DispatchQueue.main.async {
                if let state = state, state == .signedIn {
                    self.isAuthenticated = true
                }
            }
        }
    }

    func signIn(username: String, password: String) {
        AWSMobileClient.default().signIn(username: username, password: password) { result, error in
            DispatchQueue.main.async {
                if let result = result, result.signInState == .signedIn {
                    self.isAuthenticated = true
                    self.username = username
                } else if let error = error {
                    print("Error al iniciar sesión: \(error.localizedDescription)")
                }
            }
        }
    }

    func signOut() {
        AWSMobileClient.default().signOut()
        DispatchQueue.main.async {
            self.isAuthenticated = false
            self.username = ""
        }
    }
}
*/

