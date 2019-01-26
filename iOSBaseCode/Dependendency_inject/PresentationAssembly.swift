//
//  PresentationAssembly.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 24/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

class PresentationAssembly: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(LoginPresenter.self, initializer: LoginPresenter.init)
    }
    
}

extension SwinjectStoryboard {
    
    public static func setup() {
        defaultContainer.storyboardInitCompleted(LoginViewController.self){ (r, c) in
            c.presenter=r.resolve(LoginPresenter.self);
        }
    }
    
}
