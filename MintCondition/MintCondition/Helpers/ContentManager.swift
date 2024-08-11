//
//  ContentManager.swift
//  MintCondition
//
//  Created by Alok Sahay on 08.08.2024.
//

import Foundation
import UIKit

class ContentManager {
    
    static let serverEndpoint = "http://localhost:3000/"
    static let sharedManager = ContentManager()
    
    private var userProfile: User = User(fid: 0, username: "", pfp: "")
    private var deepLinkUrl: String = ""

    func loadUser() {
        let user = UserManager.shared.getUserData() ?? User(fid: 0, username: "", pfp: "")
        userProfile = user
    }
    
    func poll(token: String) {
        UserManager.shared.pollForSuccess(token: token) { result in
            switch result {
            case .success(_):
                print("close the sheet")
                if let signer_private = KeyValueStore.shared.value(forKey: "signer_private") as? String {
                    print("Signer: \(signer_private)")
                } else {
                    print("signer_private not found")
                }
                self.loadUser()
//                self.toggleProfileView() show profile
                
            case .failure(let error):
                // Handle error
                print("Error in polling")
                print(error)
            }
        }
    }
    
    func signIn() {
        UserManager.shared.signIn { result in
            switch result {
            case .success(let signerPayload):
                // Use signerPayload
                print(signerPayload)
                self.poll(token: signerPayload.pollingToken)
                self.deepLinkUrl = signerPayload.deepLinkUrl
                self.openURL()
            case .failure(let error):
                // Handle error
                print(error)
            }
        }
    }
    
    func openURL() {
        if let url = URL(string: deepLinkUrl) {
            UIApplication.shared.open(url)
        }
    }
    
    func signOut() {
        KeyValueStore.shared.removeValue(forKey: "fid")
        KeyValueStore.shared.removeValue(forKey: "username")
        KeyValueStore.shared.removeValue(forKey: "pfp")
        KeyValueStore.shared.removeValue(forKey: "signer_approved")
        KeyValueStore.shared.removeValue(forKey: "signer_private")
        loadUser()
//        self.toggleProfileView() update profile
    }
    
    
    
}
