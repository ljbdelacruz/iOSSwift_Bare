//
//  UserRepo.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 24/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Moya_ObjectMapper


class UserRepository {
    private let service: MyAPI!
    
    init(service: MyAPI) {
        self.service = service
    }
    func login(params: LoginParam) -> Observable<LoginResponse> {
        return service.rx
            .request(.login(params: params))
            .asObservable()
            .mapErrors(provider: service)
            .do(onNext: { (response) in
                let obj = try response.mapObject(LoginResponse.self)
//                Keychain.instance.passwordGrantedToken = obj.accessToken
//                Keychain.instance.refreshToken = obj.refreshToken
                UIApplication.shared.registerForRemoteNotifications()
            })
            .mapObject(LoginResponse.self)
    }
}
