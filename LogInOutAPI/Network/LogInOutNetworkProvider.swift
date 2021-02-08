//
//  LogInNetworkProvider.swift
//  LogInOutAPI
//
//  Created by gyun on 2021/02/03.
//

import Foundation
import Domains
import NetworkFramework

enum LogInOutNetworkProvier {
    
    static var login: LogInAPIRequest<LogIn> {
        let network = Network(host: Domains.Host.logInOutHost, path: Domains.Path.logIn, httpMethod: "POST")
        return LogInAPIRequest<LogIn>(network: network)
    }
    
    static var logout: LogOutAPIRequest<LogOut> {
        let network = Network(host: Domains.Host.logInOutHost, path: Domains.Path.logOut, httpMethod: "POST")
        return LogOutAPIRequest(network: network)
    }
    
}
