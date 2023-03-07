//
//  LaunchListView.swift
//  Example
//
//  Created by Alex Sarkisov on 06.03.23.
//

import SwiftUI

struct LaunchListView: View {
    
    @ObservedObject var viewModel: LaunchListViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(viewModel.launchRowModels) { rowModel in
                        NavigationLink {
                            ScreenFactory.launchDetailsScreen(launch: rowModel.launch)
                        } label: {
                            LaunchRow(rowModel: rowModel)
                        }
                    }
                    if viewModel.shouldShowActivityIndicator {
                        ProgressView()
                            .padding()
                            .onAppear(perform: viewModel.onAppearActivityIndicator)
                    }
                }
                .padding()
                .navigationTitle("SpaceX Launches")
            }
        }
        .searchable(text: $viewModel.searchText, prompt: "Search for a SpaceX launch")
        .accentColor(.black)
    }
}
