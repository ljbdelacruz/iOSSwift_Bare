//
//  MVP.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 24/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import Foundation
import UIKit

protocol BaseView: class {
    
}

class BasePresenter {
    
    weak var view: BaseView?
    
    func attachView(view: BaseView) {
        self.view = view
    }
    
    // no need to call this
    // since view has a weak reference
    func detachView() {
        self.view = nil
    }
    
}


class BaseViewController:UIViewController{
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BaseViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
