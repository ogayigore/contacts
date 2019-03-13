//
//  App.swift
//  ContactsList
//
//  Created by Игорь Огай on 13/03/2019.
//  Copyright © 2019 Игорь Огай. All rights reserved.
//

import Foundation
import UIKit

class App {
    let assembly: ContactsAssembly
    init() {
        assembly = ContactsAssembly()
    }
}

extension App {
    func rootController() -> UIViewController? {
        return assembly.build()
    }
}
