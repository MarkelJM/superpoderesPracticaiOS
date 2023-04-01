//
//  SeriesModelo.swift
//  MarvelKCSuperPoderes
//
//  Created by Markel Juaristi on 25/3/23.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)


import Foundation

// MARK: - Welcome
struct SerieWelcome: Codable {
    let code, status, copyright, attributionText: String
    let attributionHTML: String
    let data: SerieDataClass
    let etag: String
}

// MARK: - DataClass
struct SerieDataClass: Codable {
    let offset, limit, total, count: String
    let results: [Serie]
}

// MARK: - Result
struct Serie: Codable, Identifiable {
    let id, title, description, resourceURI: String
    let urls: [SerieURLElement]
    let startYear, endYear, rating, modified: String
    let thumbnail: SerieThumbnail
    let comics: SerieComics
    let stories: SerieStories
    let events: SerieComics
    let characters, creators: SerieCharacters
    let next, previous: SerieNext
}

// MARK: - Characters
struct SerieCharacters: Codable {
    let available, returned, collectionURI: String
    let items: [SerieCharactersItem]
}

// MARK: - CharactersItem
struct SerieCharactersItem: Codable {
    let resourceURI, name, role: String
}

// MARK: - Comics
struct SerieComics: Codable {
    let available, returned, collectionURI: String
    let items: [SerieNext]
}

// MARK: - Next
struct SerieNext: Codable {
    let resourceURI, name: String
}

// MARK: - Stories
struct SerieStories: Codable {
    let available, returned, collectionURI: String
    let items: [SerieStoriesItem]
}

// MARK: - StoriesItem
struct SerieStoriesItem: Codable {
    let resourceURI, name, type: String
}

// MARK: - Thumbnail
struct SerieThumbnail: Codable {
    let path, thumbnailExtension: String?

    enum SerieCodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct SerieURLElement: Codable {
    let type, url: String
}
