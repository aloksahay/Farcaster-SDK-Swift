//
//  ChannelManager.swift
//  MintCondition
//
//  Created by Alok Sahay on 11.08.2024.
//

import Foundation

struct Channel {
    let name: String
    let url: String
}

class ChannelManager {
    
    static let sharedManager = ChannelManager()
    var casts: [Cast] = []
    var selectedChannel: Channel = Channel(name: "Base", url: "https://warpcast.com/~/channel/base")
    
    let channels: [Channel] = [
            Channel(name: "Memes", url: "memes"),
            Channel(name: "Base", url: "base"),
            Channel(name: "Founders", url: "founders"),
            // Add more channels as needed
        ]
    
    func loadCasts(channel: Channel) {
        casts = []
        print("Loading: ")
        print(channel)
        selectedChannel = channel
        CastManager.shared.fetchCasts(channel: channel.url) { result in
                    switch result {
                    case .success(let casts):
                        // Do something with the fetched posts
                        self.casts = casts
                    case .failure(let error):
                        // Handle error
                        print("Failed to fetch casts: \(error)")
                    }
                }
    }
    
    
    
}


