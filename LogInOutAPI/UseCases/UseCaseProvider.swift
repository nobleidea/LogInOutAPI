//
//  UseCaseProvider.swift
//  LogInOutAPI
//
//  Created by gyun on 2021/02/03.
//

import Foundation
import Domains

public enum LogInType {
    public enum Face {
        public final class UseCaseProvider: Domains.LogInOutUseCaseProvider {
            public init() {
                
            }
            public func makeLogOutUseCase() -> Domains.LogOutUseCase {
                LogOutUseCase()
            }
            
            public func makeLogInUseCase() -> Domains.LogInUseCase {
                FaceLogInUseCase(request: LogInOutNetworkProvier.login)
            }
        }
    }
}
