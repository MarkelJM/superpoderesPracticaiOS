//
//  BaseNetwork.swift
//  MarvelKCSuperPoderes
//
//  Created by Markel Juaristi on 25/3/23.
//

import Foundation

let server = "http://gateway.marvel.com/v1/public/comics?ts=1&apikey=432e4184d35ad24e3735e1802e8901a6&hash=6dc8945eb3e9ef983687e97d9ee2445b&orderBy=-modified"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

enum endpoints : String {
    case apiHeroes = "/v1/public/characters"
    case apiSeries = "/v1/public/characters/%@/series"
        
    func url(hero: Result) -> String {
        return String(format: self.rawValue, hero.id)
    }
    
}
/*
let heroesEndpoint = "/v1/public/characters"
var serieEndPoin = "/v1/public/characters/\(FuncionQueLlamaAPIdeHeroes.id)/series"
*/

struct BaseNetwork {
    //llamada api para los heroes
    func getApiHeros()  -> URLRequest{
        let urlApi : String = "\(server)\(endpoints.apiHeroes.rawValue)"
        var request : URLRequest = URLRequest(url: URL(string: urlApi)!)
        request.httpMethod = HTTPMethods.get
   
        return request
    }
    
    // Llamada a la API para los series de cada héroe
    func getApiSeries(for hero: Result)  -> URLRequest {
            let urlApi: String = "\(server)\(endpoints.apiSeries.url(hero: hero))"
            var request: URLRequest = URLRequest(url: URL(string: urlApi)!)
            request.httpMethod = HTTPMethods.get
            return request
        }
    
    // Llamada a la API para la imagen de un héroe
    func getImage(for hero: Result) -> URLRequest? {
        // Obtener la URL de la imagen del héroe
        guard let imagePath = hero.thumbnail.path.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let imageExtension = hero.thumbnail.thumbnailExtension else {
            debugPrint("Error: No se pudo obtener la URL de la imagen del héroe")
            return nil
        }
        let imageUrlString = "\(imagePath).\(imageExtension)"
        
        // Crear una solicitud HTTP GET para descargar la imagen
        guard let imageUrl = URL(string: imageUrlString) else {
            debugPrint("Error: No se pudo crear la URL de la imagen del héroe")
            return nil
        }
        var request = URLRequest(url: imageUrl)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
    // Llamada a la API para la imagen de una serie
    func getImageSerie(for serie: Serie) -> URLRequest? {
        // Obtener la URL de la imagen de la serie
        guard let imagePath = serie.thumbnail.path?.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let imageExtension = serie.thumbnail.thumbnailExtension else {
            debugPrint("Error: No se pudo obtener la URL de la imagen de la serie")
            return nil
        }
        let imageUrlString = "\(imagePath).\(imageExtension)"
        
        // Crear una solicitud HTTP GET para descargar la imagen
        guard let imageUrl = URL(string: imageUrlString) else {
            debugPrint("Error: No se pudo crear la URL de la imagen de la serie")
            return nil
        }
        var request = URLRequest(url: imageUrl)
        request.httpMethod = HTTPMethods.get
        
        return request
    }



    
}
