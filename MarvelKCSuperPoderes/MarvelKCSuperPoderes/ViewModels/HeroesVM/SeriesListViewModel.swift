//
//  SeriesListViewModel.swift
//  MarvelKCSuperPoderes
//
//  Created by Markel Juaristi on 30/3/23.
//

import Foundation
import Combine
/*
final class HeroeSeriesViewModel: ObservableObject {
    
    @Published var series: [Serie] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init(heroeId: String) {
        let url = URL(string: "https://gateway.marvel.com/v1/public/characters/\(heroeId)/series?limit=5&apikey=<YOUR_API_KEY>")!
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: SerieWelcome.self, decoder: JSONDecoder())
            .map { $0.data.results }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    break
                }
            }) { series in
                self.series = series
            }
            .store(in: &cancellables)
    }
}


*/


class SeriesViewModel: ObservableObject {
    @Published private(set) var series: [Serie] = []
    @Published private(set) var isLoading: Bool = false //por se acaso, no necesito temas de loading, pero si da tiempo, en Heroe tocaría implementar
    @Published private(set) var errorMessage: String = ""

    private let networker: NetworkerProtocol
    private var disposables = Set<AnyCancellable>()

    init(networker: NetworkerProtocol = NetWorker()) {
        self.networker = networker
    }

    func fetchSeries(for hero: Result) {
        isLoading = true
        errorMessage = ""

        let request = BaseNetwork().getApiSeries(for: hero)

        networker.callServer(type: SerieWelcome.self, request: request)
            .sink { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                switch completion {
                case .finished:
                    debugPrint("series hechas")
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] serieWelcome in
                guard let self = self else { return }
                self.series = serieWelcome.data.results
            }
            .store(in: &disposables)
    }

    func fetchImage(for serie: Serie, completion: @escaping (Data?) -> Void) {
        guard let request = BaseNetwork().getImageSerie(for: serie) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
    //para eliminar suscripcion
    func cancel() {
        disposables.forEach { $0.cancel() }
        disposables.removeAll()
    }
}

