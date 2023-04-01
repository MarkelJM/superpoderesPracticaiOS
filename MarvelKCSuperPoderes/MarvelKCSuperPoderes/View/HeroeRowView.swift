//
//  HeroeRowView.swift
//  MarvelKCSuperPoderes
//
//  Created by Markel Juaristi on 28/3/23.
//

import SwiftUI

struct HeroeRowView: View {
    var hero: Result
    
    var body: some View {
        VStack{
            //foto del heroe
            AsyncImage(url: URL(string: hero.thumbnail.path)) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .padding([.leading, .trailing], 20)
                    
            } placeholder: {
                Text("Cargando foto...")
            }
            
            // elnombre
            Text("\(hero.name)")
                .font(.title)
                .foregroundColor(.black)
                .bold()
            
            

        }
    }
}

struct HeroeRowView_Previews: PreviewProvider {
    static var previews: some View {
        HeroeRowView(hero: Result(id: "1", name : "Captain America", description : "", thumbnail: HeroeThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73/portrait_small", thumbnailExtension: "jpg")
))
    }
}
