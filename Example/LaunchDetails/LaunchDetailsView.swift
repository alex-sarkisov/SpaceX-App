//
//  LaunchDetailsView.swift
//  Example
//
//  Created by Alex Sarkisov on 06.03.23.
//

import SwiftUI

struct LaunchDetailsView: View {
    
    @Environment(\.openURL) var openURL
    
    let viewModel: LaunchDetailsViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            Text(viewModel.title)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let details = viewModel.details {
                Text(details)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            AsyncImage(url: viewModel.logo) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 200, maxHeight: 200)
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle(viewModel.flightNumber)
        .toolbar {
            if let article = viewModel.article {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        openURL(article)
                    } label: {
                        Image(systemName: "safari")
                    }
                }
            }
        }
    }
}
