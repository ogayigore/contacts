//
//  ContactsAssembly.swift
//  ContactsList
//
//  Created by Игорь Огай on 13/03/2019.
//  Copyright © 2019 Игорь Огай. All rights reserved.
//

import Foundation
import UIKit

class ContactsAssembly {
    func build() -> UIViewController? {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "main") as? ViewController else {
            return nil
        }
        
        let presenter = ContactsPresenter()
        let interactor = ContactsInteractor()
        
        vc.presenter = presenter
        presenter.vc = vc
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return vc
    }
}
