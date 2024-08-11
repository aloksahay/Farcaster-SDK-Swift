//
//  ViewController.swift
//  MintCondition
//
//  Created by Alok Sahay on 08.08.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        KeyValueStore.shared.clearAllKeys()
//        ContentManager.sharedManager.signIn()
    }
    @IBAction func mintTokenPressed(_ sender: Any) {
     
//        CastManager.shared.fetchCasts(channel: ChannelManager.sharedManager.selectedChannel.name) { result in
//                    switch result {
//                    case .success(let casts):
//                        // Do something with the fetched posts
//                        print("Casts fetched")
//                    case .failure(let error):
//                        // Handle error
//                        print("Failed to fetch casts: \(error)")
//                    }
//                }

        CastManager.shared.postCast(text: "Testing Wapcast API via MintMarket app", parentUrl: ChannelManager.sharedManager.selectedChannel.url)
        
        
    }
}
