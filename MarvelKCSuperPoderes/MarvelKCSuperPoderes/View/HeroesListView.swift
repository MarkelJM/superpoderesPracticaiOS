//
//  HeroesListView.swift
//  MarvelKCSuperPoderes
//
//  Created by Markel Juaristi on 29/3/23.
//

import SwiftUI
/*
struct HeroesListView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HeroesListView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesListView()
    }
}
*/

/*mejor usar un navigation que un boton, porque queremos movernos entre vistas y no realizar una accion*/
struct HeroesListView: View {
    @ObservedObject var viewModel: viewModelHeros
    var heroes: [Result]
    
    var body: some View {
        /*el identificador y con prefix muestra 6 heroes*/
        List(heroes.prefix(6), id: \.id) { hero in
                    NavigationLink(destination: SeriesListView(hero: hero)) {
                        HeroeRowView(hero: hero)
                    }
                }
        .accessibilityIdentifier("HeroesListView")
        /*
        List(heroes) { hero in
            HeroeRowView(hero: hero)
        }
         */
    }
}

struct HeroeListView_Previews: PreviewProvider {
    static var previews: some View {
        let heroes = [
            Result(id: "1", name: "Spider-Man", description: "", thumbnail: HeroeThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/526548a343e4b.jpg", thumbnailExtension: "jpg")),
            Result(id: "2", name: "Captain America", description: "", thumbnail: HeroeThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087.jpg", thumbnailExtension: "jpg")),
            Result(id: "3", name: "Captain America", description: "", thumbnail: HeroeThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087.jpg", thumbnailExtension: "jpg")),
            Result(id: "4", name: "Captain America", description: "", thumbnail: HeroeThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087.jpg", thumbnailExtension: "jpg")),
            Result(id: "5", name: "Captain America", description: "", thumbnail: HeroeThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087.jpg", thumbnailExtension: "jpg")),
            Result(id: "6", name: "Captain America", description: "", thumbnail: HeroeThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/537ba56d31087.jpg", thumbnailExtension: "jpg"))
        ]
        
        let viewModel = viewModelHeros()
        HeroesListView(viewModel: viewModel, heroes: heroes.prefix(6).map { $0 })
        
    }
}

