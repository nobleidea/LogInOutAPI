//
//  LogInAPIResponse.swift
//  LogInOutAPI
//
//  Created by gyun on 2021/02/03.
//

import Foundation
import NetworkFramework

struct LogInAPIResponse<T: Decodable> {
    let result: LogInAPIResult<T>
    let statusCode: Int
    let requestURL: URL?
    
    init(_ response: DataResponse) {
        let statusCode = response.response?.statusCode ?? -9999
        
        self.requestURL = response.request?.url
        self.statusCode = statusCode
        
        if case 200 = self.statusCode, let data = response.data {
            let decoder = JSONDecoder()
            
            do {
                let decoded = try decoder.decode(T.self, from: data)
                self.result = LogInAPIResult<T>.success(decoded)
            } catch  {
                if let error = response.error {
                    self.result = LogInAPIResult<T>.failure(LogInAPIError(.unknown, error: error))
                } else {
                    fatalError()
                }
            }
        } else {
            fatalError()
        }
    }
}

struct LogInAPIError: Error {
    private let errorType: NetworkFramework.ErrorType
    private let error: Error
    
    init(_ errorType: NetworkFramework.ErrorType, error: Error) {
        self.errorType = errorType
        self.error = error
    }
}

enum LogInAPIResult<T: Decodable> {
    case success(T)
    case failure(LogInAPIError)
}

