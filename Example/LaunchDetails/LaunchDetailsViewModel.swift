//
//  LaunchDetailsViewModel.swift
//  Example
//
//  Created by Alex Sarkisov on 06.03.23.
//

import Foundation
import SpaceXKit

struct LaunchDetailsViewModel {
    
    let launch: Launch
    let logo: URL?
    let flightNumber: String
    let title: String
    let details: String?
    let article: URL?
    
    init(launch: Launch) {
        self.launch = launch
        self.logo = URL(string: launch.links.patch.large)
        self.flightNumber = "\(launch.flightNumber)"
        self.title = launch.name
        self.details = launch.details
        
        if let link = launch.links.reddit.launch {
            self.article = URL(string: link)
        } else {
            self.article = nil
        }
    }
}
