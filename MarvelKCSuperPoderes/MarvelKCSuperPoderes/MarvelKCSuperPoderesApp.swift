//
//  MarvelKCSuperPoderesApp.swift
//  MarvelKCSuperPoderes
//
//  Created by Markel Juaristi on 25/3/23.
//

import SwiftUI

@main
struct MarvelKCSuperPoderesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //ContentView()
            let viewModel = viewModelHeros()
            HeroesListView(viewModel: viewModelHeros(), heroes: [])
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
