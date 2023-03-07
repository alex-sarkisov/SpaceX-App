//
//  ScreenFactory.swift
//  Example
//
//  Created by Alex Sarkisov on 06.03.23.
//

import SwiftUI
import SpaceXKit

struct ScreenFactory {
    
    private init() {}
    
    static func launchListScreen() -> some View {
        let viewModel = LaunchListViewModel()
        let view = LaunchListView(viewModel: viewModel)
        return view
    }
    
    static func launchDetailsScreen(launch: Launch) -> some View {
        let viewModel = LaunchDetailsViewModel(launch: launch)
        let view = LaunchDetailsView(viewModel: viewModel)
        return view
    }
}
