//
//  HerosInteractor.swift
//  MarvelKCSuperPoderes
//
//  Created by Markel Juaristi on 28/3/23.
//

import Foundation
import Combine

//protocolo

protocol HerosInteractorProtocol : AnyObject {
    func getHeros(filter: String) -> AnyPublisher<[Result], Error>
}


//clasee Interactor REAL
final class HerosInteractor : HerosInteractorProtocol {
    /*networker se utiliza para realizar la llamada a la API para obtener la lista de héroes mientras que baseNetworker es utilizado para crear la solicitud para llamar a la API.*/
    let networker : NetworkerProtocol
    let baseNetworker : BaseNetwork
    
    init(network: NetworkerProtocol = NetWorker(), baseNetwork: BaseNetwork = BaseNetwork()) {
        self.networker = network
        self.baseNetworker = baseNetwork
    }
    
    func getHeros(filter: String) -> AnyPublisher<[Result], Error>{
        return networker.callServer(type: [Result].self, request: baseNetworker.getApiHeros())
    }

}
