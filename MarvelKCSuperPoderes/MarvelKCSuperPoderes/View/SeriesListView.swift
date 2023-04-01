//
//  SeriesListView.swift
//  MarvelKCSuperPoderes
//
//  Created by Markel Juaristi on 1/4/23.
//


/*NOTA: HEROES Y SERIES HAGO DISTINTO FORMA PARA SABER CUÁL ES MÁS CORRECTA, EN CLASE GICIMOS CON ROW, PERO EN SERIES TAMBIÉN LO HARIAS??
 */
import SwiftUI
/*
struct SeriesListView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SeriesListView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesListView()
    }
}
*/
/*
import SwiftUI

struct SeriesListView: View {
    @StateObject private var viewModel = SeriesViewModel()
    let hero: Result

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(viewModel.series) { serie in
                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string: "\(serie.thumbnail.path ?? "").\(serie.thumbnail.thumbnailExtension ?? "")"),
                                           placeholder: { ProgressView() },
                                           image: { Image(uiImage: $0).resizable() })
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 150)
                                    .cornerRadius(10)
                                Text(serie.title)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .lineLimit(1)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .onAppear {
            viewModel.fetchSeries(for: hero)
        }
        .onDisappear {
            viewModel.cancel()
        }
    }
}
*/



struct SeriesListView: View {
    
    @StateObject private var viewModel = SeriesViewModel()
    
    let hero: Result
    
    var body: some View {
        ScrollView(.horizontal){
            VStack{
                HStack(spacing: 20){
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .onAppear{
                                print("\(viewModel.errorMessage)")
                            }
                    } else {
                        
                        HStack(spacing: 20) {
                            ForEach(viewModel.series) { serie in
                                VStack(alignment: .leading) {
                                    if let imagePath = serie.thumbnail.path,
                                       let imageExtension = serie.thumbnail.thumbnailExtension,
                                       let imageUrl = URL(string: "\(imagePath).\(imageExtension)") {
                                        AsyncImage(url: imageUrl, content: { image in
                                            image.resizable()
                                        }, placeholder: {
                                            ProgressView()
                                        })
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 150)
                                        .cornerRadius(10)
                                    }
                                    Text(serie.title)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .lineLimit(1)
                                    Text(serie.description)
                                        .font(.caption2)
                                        .fontWeight(.regular)
                                        
                                    
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchSeries(for: hero)
        }
        .onDisappear {
            viewModel.cancel()
        }
    }
}




struct SeriesListView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleHero = Result(id: "12345", name: "Iron Man", description: "Iron Man description", thumbnail: HeroeThumbnail(path: "https://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73", thumbnailExtension: "jpg"))
        SeriesListView(hero: exampleHero)
    }
}


