//
//  MarvelKCSuperPoderesTests.swift
//  MarvelKCSuperPoderesTests
//
//  Created by Markel Juaristi on 25/3/23.
//

import XCTest
@testable import MarvelKCSuperPoderes

final class MarvelKCSuperPoderesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
///TEST MARKEL:
    func testHeroInitialization() {
            let heroThumbnail = HeroeThumbnail(path: "http://example.com/image", thumbnailExtension: "jpg")
            let hero = Result(id: "1", name: "Spider-Man", description: "", thumbnail: heroThumbnail)

            XCTAssertEqual(hero.id, "1")
            XCTAssertEqual(hero.name, "Spider-Man")
            XCTAssertEqual(hero.description, "")
            XCTAssertEqual(hero.thumbnail.path, "http://example.com/image")
            XCTAssertEqual(hero.thumbnail.thumbnailExtension, "jpg")
    }
    /*
     ///Me da errores linea 51: let serie = Serie. debo indica rotoda
    func testSerieInitialization() {
        let serieThumbnail = SerieThumbnail(path: "http://example.com/serie-image", thumbnailExtension: "jpg")
        //let serie = Serie(id: "1", title: "Amazing Spider-Man", description: "A description", thumbnail: serieThumbnail)
        //let serie = Serie(id: <#T##String#>, title: <#T##String#>, description: <#T##String#>, resourceURI: <#T##String#>, urls: <#T##[SerieURLElement]#>, startYear: <#T##String#>, endYear: <#T##String#>, rating: <#T##String#>, modified: <#T##String#>, thumbnail: <#T##SerieThumbnail#>, comics: <#T##SerieComics#>, stories: <#T##SerieStories#>, events: <#T##SerieComics#>, characters: <#T##SerieCharacters#>, creators: <#T##SerieCharacters#>, next: <#T##SerieNext#>, previous: <#T##SerieNext#>)
        

        XCTAssertEqual(serie.id, "1")
        XCTAssertEqual(serie.title, "Amazing Spider-Man")
        XCTAssertEqual(serie.description, "A description")
        XCTAssertEqual(serie.thumbnail.path, "http://example.com/serie-image")
        XCTAssertEqual(serie.thumbnail.thumbnailExtension, "jpg")
    }
     */
    func testSerieInitialization() {
        let serieThumbnail = SerieThumbnail(path: "http://example.com/serie-image", thumbnailExtension: "jpg")
        
        let serieComics = SerieComics(available: "", returned: "", collectionURI: "", items: [])
        let serieCharacters = SerieCharacters(available: "", returned: "", collectionURI: "", items: [])
        let serieStories = SerieStories(available: "", returned: "", collectionURI: "", items: [])
        let serieNext = SerieNext(resourceURI: "", name: "")
        
        let serie = Serie(id: "1", title: "Amazing Spider-Man", description: "A description", resourceURI: "", urls: [], startYear: "", endYear: "", rating: "", modified: "", thumbnail: serieThumbnail, comics: serieComics, stories: serieStories, events: serieComics, characters: serieCharacters, creators: serieCharacters, next: serieNext, previous: nil)
        
        XCTAssertEqual(serie.id, "1")
        XCTAssertEqual(serie.title, "Amazing Spider-Man")
        XCTAssertEqual(serie.description, "A description")
        XCTAssertEqual(serie.thumbnail.path, "http://example.com/serie-image")
        XCTAssertEqual(serie.thumbnail.thumbnailExtension, "jpg")
    }



}
