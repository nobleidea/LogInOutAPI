//
//  FaceLogInUseCase.swift
//  LogInOutAPI
//
//  Created by gyun on 2021/02/03.
//

import Foundation
import Domains

final class FaceLogInUseCase: Domains.LogInUseCase {
    private let request: LogInAPIRequest<LogIn>
    
    init(request: LogInAPIRequest<LogIn>) {
        self.request = request
    }
    
    func login(parameters: Dictionary<String, Any>, completion: @escaping ((LogIn?) -> Void)) {
        request.observer { response in
            switch response.result {
            case .success(let logIn):
                completion(logIn)
            case .failure(_):
                completion(nil)
            }
        }.observer { _ in
            
        }.observer { _ in
            
        }.send(parameters: parameters)
    }
}
