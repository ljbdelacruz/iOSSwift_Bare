//
//  DataAssembly.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 24/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import Swinject
import SwinjectAutoregistration
//import Moya

class DataAssembly: Assembly {
    
    func assemble(container: Container) {
        // Plugins
        //        container.register(AuthPlugin.self) { r in
        //            AuthPlugin()
        //            }.inObjectScope(.container)
        //        container.register(ClientSecretPlugin.self) { r in
        //            ClientSecretPlugin()
        //            }.inObjectScope(.container)
//        container.register(NetworkLoggerPlugin.self) { r in
//            NetworkLoggerPlugin(verbose: true)
//            }.inObjectScope(.container)
//
        container.register(MyAPI.self) { (r) in
            let service = MyAPI()
            return service
        }
//
//        // Repository
        container.autoregister(UserRepository.self, initializer: UserRepository.init).inObjectScope(.container)
//        container.autoregister(MerchantRepository.self, initializer: MerchantRepository.init).inObjectScope(.container)
//        container.autoregister(NotificationsRepository.self, initializer: NotificationsRepository.init).inObjectScope(.container)
//        container.autoregister(OtpRepository.self, initializer: OtpRepository.init).inObjectScope(.container)
//        container.autoregister(OutletRepository.self, initializer: OutletRepository.init).inObjectScope(.container)
//        container.autoregister(QrCodeRepository.self, initializer: QrCodeRepository.init).inObjectScope(.container)
//        container.autoregister(SettingsRepository.self, initializer: SettingsRepository.init).inObjectScope(.container)
    }
}
