//
//  HeroesListViewModel.swift
//  MarvelKCSuperPoderes
//
//  Created by Markel Juaristi on 28/3/23.
//

import Foundation
import Combine

final class viewModelHeros: ObservableObject {
    @Published var heros: [Result]?
    
    var suscriptors = Set<AnyCancellable>()
    
    //
    var heroesPublisher: AnyPublisher<[Result], Error>?
    
    var interactor: HerosInteractorProtocol
    
    init( interactor : HerosInteractorProtocol = HerosInteractor()){
        
        self.interactor = interactor
        
        getHeros(filtro: "")
        
    }
    
    
    
    func getHeros(filtro: String){
        
        interactor.getHeros(filter: filtro)
            .sink { completion in
                switch completion{
                case .failure:
                    print("Error al traer los heroes")
                case .finished:
                    print("heroes en la app desde la api")
                }
            } receiveValue: { data in
                self.heros = data
            }
            .store(in: &suscriptors)
       
        
         
         


    }
    
    
    
}
