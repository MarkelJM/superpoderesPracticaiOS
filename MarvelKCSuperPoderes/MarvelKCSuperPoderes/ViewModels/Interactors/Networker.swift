//
//  Networker.swift
//  MarvelKCSuperPoderes
//
//  Created by Markel Juaristi on 28/3/23.
//

import Foundation
import Combine
/* esto permite una separación clara entre la lógica de red y la lógica de negocio en una aplicación, lo que facilita la escalabilidad y el mantenimiento del código*/

protocol NetworkerProtocol : AnyObject {
    func callServer<T>(type: T.Type, request: URLRequest) -> AnyPublisher<T, Error> where T: Decodable
}

final class NetWorker : NetworkerProtocol {
    func callServer<T>(type: T.Type, request: URLRequest) -> AnyPublisher<T, Error> where T: Decodable {
        URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                    
                }
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
