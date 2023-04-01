//
//  MarvelKCSuperPoderesApp.swift
//  MarvelKCSuperPoderes
//
//  Created by Markel Juaristi on 25/3/23.
//
import SwiftUI

@main
struct MarvelKCSuperPoderesApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = viewModelHeros()
            HeroesListView(viewModel: viewModel, heroes: [])
        }
    }
}
