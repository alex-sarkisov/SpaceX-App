//
//  LaunchRowModel.swift
//  Example
//
//  Created by Alex Sarkisov on 06.03.23.
//

import Foundation
import SpaceXKit

class LaunchRowModel: Identifiable {
    
    let launch: Launch
    let id: String
    let imageURL: URL?
    let title: String
    let subtitle: String
    
    init(launch: Launch) {
        self.launch = launch
        self.id = launch.id
        self.imageURL = URL(string: launch.links.patch.small)
        self.title = launch.name
        self.subtitle = "\(launch.flightNumber)"
    }
}
