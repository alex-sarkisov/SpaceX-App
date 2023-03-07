//
//  LaunchListViewModel.swift
//  Example
//
//  Created by Alex Sarkisov on 06.03.23.
//

import Foundation
import Combine
import SpaceXKit

class LaunchListViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var launchRowModels: [LaunchRowModel] = []
    @Published var shouldShowActivityIndicator: Bool = true
    
    private let spaceXKit: SpaceXKit
    
    private var page: Int = 0
    private var hasNextPage: Bool = false
    private var launches: [Launch] = []
    private var cancellable: AnyCancellable?
    
    init(spaceXKit: SpaceXKit = .shared) {
        self.spaceXKit = spaceXKit
        self.cancellable = $searchText
            .debounce(for: .milliseconds(250), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .dropFirst()
            .sink { [weak self] query in
                self?.resetState()
                self?.fetchLaunches()
            }
        fetchLaunches()
    }
    
    func onAppearActivityIndicator() {
        if hasNextPage {
            fetchLaunches()
        }
    }
    
    private func fetchLaunches() {
        Task {
            do {
                let nextPage = page + 1
                let paginatedLaunches = try await spaceXKit.paginatedLaunches(searchQuery: searchText,
                                                                              page: nextPage)
                page = nextPage
                await updateData(paginatedLaunches: paginatedLaunches)
            } catch {
                resetState()
            }
        }
    }
    
    @MainActor
    private func updateData(paginatedLaunches: PaginatedLaunches) {
        hasNextPage = paginatedLaunches.hasNextPage
        shouldShowActivityIndicator = hasNextPage
        launches += paginatedLaunches.launches
        launchRowModels = launches.map { .init(launch: $0) }
    }
    
    private func resetState() {
        page = 0
        hasNextPage = false
        launches = []
    }
}
