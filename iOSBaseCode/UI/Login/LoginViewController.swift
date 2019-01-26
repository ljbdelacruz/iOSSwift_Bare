//
//  LoginViewController.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 24/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var UIEmailTF: UITextField!
    @IBOutlet var UIPasswordTF: UITextField!
    var presenter: LoginPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @IBAction func LoginOnClick(_ sender: Any) {
        presenter.Authorize(email: self.UIEmailTF.text!, password: self.UIPasswordTF.text!);
    }
}

extension LoginViewController: LoginView{
    func showAuthSuccess() {
        print("Success Authentication login");
    }
    func showAuthFailed(message:String) {
        print("Failed Authentication login");
    }
}
//MARK: Button Events
extension LoginViewController{

}
