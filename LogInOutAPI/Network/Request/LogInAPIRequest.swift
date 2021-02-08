//
//  LogInNetwork.swift
//  LogInOutAPI
//
//  Created by gyun on 2021/02/03.
//

import Foundation
import Domains
import NetworkFramework

final class LogInAPIRequest<T: Decodable> {
    private let network: Network
    private var response: LogInAPIResponse<T>? {
        didSet {
            if let response = self.response {
                sendResponseToObservers(response)
            }
        }
    }
    
    private var observerList = [((LogInAPIResponse<T>) -> Void)?]()
    
    init(network: Network) {
        self.network = network
    }
    
    @discardableResult
    func observer(_ observer: @escaping (LogInAPIResponse<T>) -> Void) -> Self {
        self.observerList.append(observer)
        return self
    }
    
    func send(parameters: Dictionary<String,Any>) {
        network.request(parameters: parameters) { [weak self] response in
            self?.response = LogInAPIResponse(response)
        }
    }
    
    private func sendResponseToObservers(_ response: LogInAPIResponse<T>) {
        for observer in self.observerList {
            if let obs = observer {
                obs(response)
            }
        }
    }
}
