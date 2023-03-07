//
//  LaunchRow.swift
//  Example
//
//  Created by Alex Sarkisov on 06.03.23.
//

import SwiftUI

import SwiftUI

struct LaunchRow: View {
    
    let rowModel: LaunchRowModel
    
    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: rowModel.imageURL) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            
            VStack {
                Text(rowModel.title)
                    .lineLimit(1)
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(rowModel.subtitle)
                    .lineLimit(1)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Image(systemName: "chevron.right")
                .foregroundColor(.black)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, minHeight: 70)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(color: Color.black.opacity(0.15), radius: 30, y: 10)
        )
    }
}
