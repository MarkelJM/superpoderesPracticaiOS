//
//  HeroesModelo.swift
//  MarvelKCSuperPoderes
//
//  Created by Markel Juaristi on 25/3/23.
//




// MARK: - Resul

/*
struct Heroe: Codable {
    let id, name, description, modified: String
    let resourceURI: String
    let urls: String
    let thumbnail: String
    let comics: String
    let stories: String
    let events, series: String
}
*/

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)




import Foundation

// MARK: - Welcome
struct HeroeWelcome: Codable {
    let code, status, copyright, attributionText: String
    let attributionHTML: String
    let data: HeroeDataClass
    let etag: String
}

// MARK: - DataClass
struct HeroeDataClass: Codable {
    let offset, limit, total, count: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable , Identifiable{
    //let id, name, description, modified: String
    let id, name, description: String

    //let resourceURI: String
    //let urls: [HeroeURLElement]
    let thumbnail: HeroeThumbnail
    //let comics: HeroeComics
    //let stories: HeroeStories
    //let events, series: HeroeComics
}

// MARK: - Comics
struct HeroeComics: Codable {
    let available, returned, collectionURI: String
    let items: [HeroeComicsItem]
}

// MARK: - ComicsItem
struct HeroeComicsItem: Codable {
    let resourceURI, name: String
}

// MARK: - Stories
struct HeroeStories: Codable {
    let available, returned, collectionURI: String
    let items: [HeroeStoriesItem]
}

// MARK: - StoriesItem
struct HeroeStoriesItem: Codable {
    let resourceURI, name, type: String
}

// MARK: - Thumbnail
struct HeroeThumbnail: Codable {
    let path: String
    let thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}


// MARK: - URLElement
struct HeroeURLElement: Codable {
    let type, url: String
}


