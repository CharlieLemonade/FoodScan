//
//  ContentViewModel.swift
//  appFoodScan
//
//  Created by Carlos López on 06/04/25.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth


class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        setUpSuscribers()
    }
    
    private func setUpSuscribers() {
        AuthService.shared.$userSession.sink{
            [weak self] userSession in self?.userSession = userSession
        }
    }
}
